#ifndef SETUP_TEST_GURAD
#define SETUP_TEST_GUARD
#include <Servo.h>

extern Servo servo1; // rotation
extern Servo servo2; // bend
extern Servo servo3; // front
extern Servo servo4; // bite
extern int avg_ang_rotation;
extern int avg_ang_bend;

void init_robot();

#define max_ang_rotation 130 
#define min_ang_rotation 10

#define max_ang_bend 125  // tija in fata
#define min_ang_bend 180 // tija in spate // default 175!!!!!!!!

#define max_ang_front 3 
#define min_ang_front 45
 
#define max_ang_bite 20 //deschis
#define min_ang_bite 180 //inschis

#endif


