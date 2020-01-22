#ifndef SETUP_TEST_CPP_GUARD
#define SETUP_TEST_CPP_GUARD
#include "init.h"
#include <Servo.h>

int avg_ang_rotation = (max_ang_rotation + min_ang_rotation) / 2;
int avg_ang_bend = (max_ang_bend + min_ang_bend) / 2;
Servo servo1;	
Servo servo2;
Servo servo3;
Servo servo4;


void init_robot(int chosen) {
  if(chosen == 0)
	  servo1.attach(4);
  if(chosen == 1)
	  servo2.attach(5);
  if(chosen == 2)
	  servo3.attach(6);
  if(chosen == 3)
	  servo4.attach(7);
}

void quit_robot(int chosen) {
  if(chosen == 0)
	  servo1.detach();
  if(chosen == 1)
	  servo2.detach();
  if(chosen == 2)
	  servo3.detach();
  if(chosen == 3)
	  servo4.detach();
}
  
#endif


