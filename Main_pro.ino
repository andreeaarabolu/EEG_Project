#include <Brain.h>
#include "C:\Users\Anda\Desktop\Facultate\licenta\arduino_code\official\Main_pro\functions\init.cpp"
#include "C:\Users\Anda\Desktop\Facultate\licenta\arduino_code\official\Main_pro\Handy_functions\Handy_functions.ino"
#include <stdio.h>


Brain brain(Serial1);

const int low_lim = 35;
const int high_lim = 65;

bool disp_servo[] = {0, 0, 0, 0}; // motoarele disponibile

int counter = 0;
int att_arr[] = {0, 0, 0, 0, 0}; // stocarea valorilor de atentie in 5 secunde pentru a gasi valoarea predominanta (pentru a evita artefactele)
int att_princ; //0-nu au trecut 5s, 1-attention low, 2-attention high, 3-attention mid
bool cont = true; // verificarea continuitatii semnalului

int sel_servo = 0; // motorul pe care il vom controla 0-niciun motor selectat, 1-rotate, 2-bend, 3-front, 4-bite
int incr1 = 0; //starea motorului 1: rotate
int incr2 = 0; //starea motorului 2: bend

bool mod = false; // modul de control al bratului: 0-automat, 1-manual
bool manual_flag = false; //pentru a ne asigura ca actiunea se executa o singura data
bool automat_flag = false; //pentru a ne asigura ca actiunea se executa o singura data

char stat[7]; //mesajul arduino -> matlab
char incoming[8]; //mesajul matlab ->arduino

int led_m1 = 8; //led motor rotate selectat
int led_m2 = 9; //led motor bend selectat
int led_m3 = 10; //led motor front selectat
int led_m4 = 11; //led motor bite selectat
int led_stare = 12; //led stare motor selectat

void sel_m_led() {
  digitalWrite(led_m1, LOW);
  digitalWrite(led_m2, LOW);
  digitalWrite(led_m3, LOW);
  digitalWrite(led_m4, LOW);
  switch (sel_servo) {
    case 1:
      digitalWrite(led_m1, HIGH);
      break;
    case 2:
      digitalWrite(led_m2, HIGH);
      break;
    case 3:
      digitalWrite(led_m3, HIGH);
      break;
    case 4:
      digitalWrite(led_m4, HIGH);
      break;
    default:
      break;
  }
}

int findNext(int ser, bool dis[4]) {
  //spre dreapta
  for (int j = ser; j < 4; j++)
  {
    if (dis[j] == 1)
    {
      return j + 1;
    }
  }
  //spre stanga
  for (int j = 0; j <= ser - 2; j++)
  {
    if (dis[j] == 1)
    {
      return j + 1;
    }
  }
  return 0;
}

void action(int motor) {
  switch (motor) {
    case 1:
      increment_rotation(incr1);
      if (incr1 < 3)
      {
        incr1 += 1;
      }
      else
      {
        incr1 = 0;
      }
      break;
    case 2:
      increment_bend(incr2);
      if (incr2 < 3)
      {
        incr2 += 1;
      }
      else
      {
        incr2 = 0;
      }
      break;
    case 3:
      increment_front();
      break;
    case 4:
      increment_bite();
      break;
    default:
      break;
  }
}

void setup() {
  Serial1.begin(9600);
  Serial.begin(9600);

  pinMode(led_m1, OUTPUT); //led motor1-rotatie selectat
  pinMode(led_m2, OUTPUT);  //led motor2-bend selectat
  pinMode(led_m3, OUTPUT);  //led motor3-front selectat
  pinMode(led_m4, OUTPUT);  //led motor4-bite selectat
  pinMode(led_stare, OUTPUT);  //led stare motor selectat

  
  reset();
 }

void loop() {
  // "signal strength, attention, meditation, delta, theta, low alpha, high alpha, low beta, high beta, low gamma, high gamma"
  if (brain.update()) // PAS I: TRIMIT MESAJ CATRE MATLAB GUI
  { 
    if (brain.readErrors() != NULL)
    { 
      stat[0] = '!';
      stat[1] = '0';
      if (brain.readSignalQuality() == 0)
      {
        stat[2] = '0';
        stat[3] = '0';
        stat[4] = '0';
        stat[5] = '0';
        stat[6] = '\0';


        int att = (int) brain.readAttention();
        if (att == 100)
        {
          stat[3] = '1', stat[4]  = '0', stat[5] = '0';
        }
        else
        {
          stat[4] = att / 10 + '0';
          stat[5] = att % 10 + '0';
        }
        if (cont == true)
        {
          if (counter < 4)
          {
            att_arr[counter] = att;
            counter++;
            att_princ = 0;
          }
          else
          {
            int low_att = 0;
            int mid_att = 0;
            int high_att = 0;
            for (int j = 0; j < 5; j++)
            {
              if (att_arr[j] < low_lim)
              {
                low_att += 1;
              }
              if (att_arr[j] >= low_lim && att_arr[j] <= high_lim)
              {
                mid_att += 1;
              }
              if (att_arr[j] > high_lim)
              {
                high_att += 1;
              }
            }

            int ok = 0;
            if (low_att > mid_att && low_att > high_att )
            {
              att_princ = 1;
              ok = 1;
            }
            if (high_att > mid_att && high_att > low_att && ok == 0)
            {
              att_princ = 2;
              ok = 1;
            }
            if (ok == 0)
            {
              att_princ = 3;
            }
            counter = 0;
            automat_flag = true; //avem un semnal auto de executat
          }

        }

        cont = true;
        Serial.println(stat); // semnal OK
      }
      else
      {
        stat[2] = '1';
        stat[3] = '0';
        stat[4] = '0';
        stat[5] = '0';
        stat[6] = '\0';
        cont = false;
        counter = 0;
        Serial.println(stat); // semnal EEG slab
      }
    }
    else
    {
      stat[0] = '!';
      stat[1] = '1';
      stat[2] = '0';
      stat[3] = '0';
      stat[4] = '0';
      stat[5] = '0';
      stat[6] = '\0';
      cont = false;
      counter = 0;
      Serial.println(stat); // erroare de primire pachet EEG
    }
  }
  

  // delay(20);
  if (Serial.available() > 0) // PAS II: PRIMESC MESAJ DE LA MATLAB GUI
  { 
    if (Serial.read() == '!')
    { 
      digitalWrite(13,!digitalRead(13));
      (Serial.readString()).toCharArray(incoming, 8);
        for (int j = 0; j < 4; j++) //verificam ce motoare avem disponibile
        {
          if (incoming[j] == '0')
          {
            disp_servo[j] = 0;
          }
          else
          {
            disp_servo[j] = 1;
          }
        }
        if (incoming[4] == '1')
        {
          mod = true; // mod manual
          manual_flag = true;
          automat_flag = false;
        }
        else
        {
          mod = false; // mod automat
        }

    }
  }

    if (mod == false) //PAS III: daca suntem pe modul automat
  {
    
    if (automat_flag == true) //actiune de executat
    { 
      if (att_princ == 1) //low attention, se selecteaza urmatorul motor disponibil
      { 
        sel_servo = findNext(sel_servo, disp_servo);
        sel_m_led();
      }
      if (att_princ == 2 && sel_servo != 0) //high attention, exista motor selectat
      {
        init_robot(sel_servo - 1);
        digitalWrite(led_stare, HIGH);
        action(sel_servo);
        digitalWrite(led_stare, LOW);
        quit_robot(sel_servo - 1);
      }
      automat_flag = false;
    }
  }

  if (mod == true) //PAS IV: DACA SUNTEM PE MODUL MANUAL
  { 
    if (manual_flag == true) //actiune de executat
    {
      sel_servo = incoming[5] - '0';
      sel_m_led();
      if ((incoming[6] - '0') == 1)
      { 
        init_robot(sel_servo - 1);
        digitalWrite(led_stare, HIGH);
        action(sel_servo);
        digitalWrite(led_stare, LOW);
        quit_robot(sel_servo - 1);
      }
      manual_flag = false;
    }
  }
}
