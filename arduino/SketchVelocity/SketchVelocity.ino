#include <AFMotor.h>
#include <SoftwareSerial.h>
#include <stdlib.h>


AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);
SoftwareSerial mySerial(14, 15);

int maxVelocity;
boolean driving;

enum driveDirection {
  forward=0, backward} 
currentDirection;
enum driveAngle {
  straight=0,left, right} 
currentAngle;

void setup(){
  mySerial.begin(9600);
  Serial.begin(9600);
  currentDirection = forward;
  maxVelocity=180;
  currentAngle = straight;
  driving = false;
}

void loop(){
  get();
  drive();
}



void drive(){
  int speedRight, speedLeft;
  if (currentDirection == forward){
    motor1.run(FORWARD);
    motor2.run(FORWARD);
    motor3.run(FORWARD);
    motor4.run(FORWARD);
    speedRight = maxVelocity;
    speedLeft = maxVelocity;
  } 
  else if (currentDirection == backward){
    motor1.run(BACKWARD);
    motor2.run(BACKWARD);
    motor3.run(BACKWARD);
    motor4.run(BACKWARD);
    speedRight = maxVelocity;
    speedLeft = maxVelocity;
  }

  if (currentAngle == left){
    speedLeft -=50;
   // motor3.run(invertCurrentDirection());
   // motor4.run(invertCurrentDirection());
    
  } 
  else if (currentAngle == right){
    speedRight -=50;
   // motor1.run(invertCurrentDirection());
   // motor2.run(invertCurrentDirection());
  }
  if (!driving) {
    speedLeft = 0;
    speedRight = 0;
  }
  
  if (speedRight < 0){
    motor1.run(invertCurrentDirection());
    motor2.run(invertCurrentDirection());
    speedRight = -speedRight;
  }
  if (speedLeft < 0){
    motor3.run(invertCurrentDirection());
    motor4.run(invertCurrentDirection());
    speedLeft = -speedLeft;
  }
  motor1.setSpeed(speedRight);
  motor2.setSpeed(speedRight);
  motor3.setSpeed(speedLeft);
  motor4.setSpeed(speedLeft);


}

int invertCurrentDirection(){
  if (currentDirection == forward) return BACKWARD;
  else return FORWARD;
}

void get(){
  delay(100);
  char reader[4] = {0x00,0x00,0x00,0x00};
  int counter=0;
  char temp;
  while (mySerial.available()>0){
    temp = mySerial.read();
    reader[counter] = temp;
    Serial.print(counter);

    counter++;
    if (counter == 3) break;
  }
  counter = 0;
  if (strcmp(reader,"vel")==0){
    while (mySerial.available()>0){
      reader[counter] = mySerial.read();
      counter++;
      if (counter == 3) break;
    }
    maxVelocity = atoi(reader);
  }
  if (strcmp(reader,"fwd")==0){
    currentAngle = straight;
    currentDirection = forward;
    driving = true;
  }
  if (strcmp(reader,"bwd")==0){
    currentAngle = straight;
    currentDirection = backward;
    driving = true;
  }
  if (strcmp(reader,"lft")==0){
    currentAngle = left;
    driving = true;
  }
  if (strcmp(reader,"rgt")==0){
    currentAngle = right;
    driving = true;
  }
  if (strcmp(reader,"stp")==0){
    driving = false;
  }
  while (mySerial.available()>0){
    mySerial.read();
  }

          
   Serial.print(reader);

}


