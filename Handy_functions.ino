#ifndef HANDY_FUNCTIONS_GUARD
#define HANDY_FUNCTIONS_GUARD
#include "C:\Users\Anda\Desktop\Facultate\licenta\arduino_code\official\Main_pro\functions\init.cpp"

int pos ;
int i ;

// ROTATION MOTOR 1 FUNCTIONS

void rotate_left() {
  pos = servo1.read();
  for (i = pos; i >= min_ang_rotation; i--) {
    servo1.write(i);
    delay(10);
  }
  servo1.write(min_ang_rotation);
  delay(100);
  return;
}

void rotate_right() {
  pos = servo1.read();
  for (i = pos; i <= max_ang_rotation; i++) {
    servo1.write(i);
    delay(10);
  }
  servo1.write(max_ang_rotation);
  delay(100);
  return;
}

void rotate_center() {
  pos = servo1.read();
  if (pos <= avg_ang_rotation) {
    for (i = pos; i <= avg_ang_rotation ; i++) {
      servo1.write(i);
      delay(10);
    }
  }
  else {
    for (i = pos; i >= avg_ang_rotation ; i--) {
      servo1.write(i);
      delay(10);
    }
  }
  servo1.write(avg_ang_rotation);
  delay(100);
}

// BEND MOTOR 2 FUNCTIONS

void bend_up() {
  pos = servo2.read();
  for (i = pos; i >= min_ang_rotation; i--) {
    servo2.write(i);
    delay(10);
  }
  servo1.write(min_ang_rotation);
  delay(200);
  return;
}

void bend_down() {
  pos = servo2.read();
  for (i = pos; i <= max_ang_bend; i++) {
    servo2.write(i);
    delay(10);
  }
  servo2.write(max_ang_bend);
  delay(100);
  return;
}

// void bend_center() {
  // pos = servo2.read();
  // if (pos <= avg_ang_bend) {
    // for (i = pos; i <= avg_ang_bend ; i++) {
      // servo2.write(i);
      // delay(10);
    // }
  // }
  // else {
    // for (i = pos; i >= avg_ang_bend ; i--) {
      // servo2.write(i);
      // delay(10);
    // }
  // }
  // servo2.write(avg_ang_bend);
  // delay(100);
// }

void bend_center() {
   servo2.write(175);
   delay(100);
}


// FRONT MOTOR 3 FUNCTIONS

void max_front() {
  servo2.attach(5);
  servo2.write(175);
  pos = servo3.read();
  for (i = pos; i <= max_ang_front; i++) {
    servo3.write(i);
    delay(10);
  }
  servo3.write(max_ang_front);
  delay(300);
  servo2.detach();
  return;
}

void min_front() {
  servo2.attach(5);
  servo2.write(175);
  pos = servo3.read();
  for (i = pos; i >= min_ang_front ; i--) {
    servo3.write(i);
    delay(10);
  }
  servo3.write(min_ang_front);
  delay(300);
  servo2.detach();
  return;
}

// BITE MOTOR 4 FUNCTIONS

void max_bite() {
  pos = servo4.read();
  for (i = pos; i <= max_ang_bite; i++) {
    servo4.write(i);
    delay(10);
  }
  servo4.write(max_ang_bite);
  delay(100);
  return;
}

void min_bite() {
  pos = servo4.read();
  for (i = pos; i >= min_ang_bite ; i--) {
    servo4.write(i);
    delay(10);
  }
  servo4.write(min_ang_bite);
  delay(200);
  return;
}

// TO BE CALLED FUNCTIONS

void increment_rotation(int k) {
	pos = servo1.read();
	switch (k) {
		case 0:
			rotate_right();
			break;
		case 1:
			rotate_center();
			break;
		case 2:
			rotate_left();
			break;
		case 3:
			rotate_center();
			break;
	}
}

// void increment_bend(int k) {
	// pos = servo2.read();
	// switch (k) {
		// case 0:
			// bend_up();
			// break;
		// case 1:
			// bend_center();
			// break;
		// case 2:
			// bend_down();
			// break;
		// case 3:
			// bend_center();
			// break;
	// }
	
// }

void increment_bend(int k) {
	bend_center();
}

void increment_front() {
	pos = servo3.read();
	if (pos != max_ang_front)
		max_front();
	else
		min_front();
}

void increment_bite() {
	pos = servo4.read();
	if (pos != max_ang_bite )
	{
		servo4.write(20);
		delay(500);
	}
	else
	{
		servo4.write(180);
		delay(500);
	}
}

void reset() {

	    servo1.attach(4);
  servo1.write(70);
  delay(500);
  servo1.write(30);
  delay(500);
  servo1.write(130);
  delay(500);
  servo1.write(70);
  delay(500);
  servo1.detach();

    servo2.attach(5);
    servo3.attach(6);
    servo2.write(175);
    delay(500);
    servo3.write(5);
    delay(500);
    servo3.write(15);
    delay(500);
    servo3.detach();
    servo2.detach();

  servo4.attach(7);
  servo4.write(20);
  delay(500);
  servo4.write(180);
  delay(500);
  servo4.detach();

  servo2.attach(5);
  servo3.attach(6);
  servo2.write(175);
  delay(500);
  servo3.write(5);
  delay(500);
  servo3.detach();
  servo2.detach();
}

#endif






