#include <AFMotor.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);

int left;
int right;

void setup(){
   Serial.begin(9600);
   /*
   Serial.println("Motor test");
   
  motor1.run(BACKWARD);
  motor2.run(BACKWARD);
  motor3.run(FORWARD);
  motor4.run(FORWARD);
 

  motor1.setSpeed(255);
  motor2.setSpeed(0);
  motor3.setSpeed(0);
  motor4.setSpeed(255);
   
   delay (1000);

  motor1.setSpeed(0);
  motor2.setSpeed(255);
  motor3.setSpeed(255);
  motor4.setSpeed(0);
     delay (1000);

  
   motor1.run(RELEASE);
   motor2.run(RELEASE);
   motor3.run(RELEASE);
   motor4.run(RELEASE);
   */
   
   
   right = 0;
   left = 0;
}


void loop() {
  
  
  motor1.run(BACKWARD);
  motor2.run(BACKWARD);
  motor3.run(FORWARD);
  motor4.run(FORWARD);


  motor1.setSpeed(right*125);
  motor2.setSpeed(left*125);
  motor3.setSpeed(left*125);
  motor4.setSpeed(right*125);
 
  

  Serial.print("\n RIGHT:");
  Serial.print(right*125);
  Serial.print("        ");
  Serial.print(" Left:");
  Serial.print(left*125);
  
  get();
  
 
  
}


void get(){
   delay(100);
   
   String readString;
   
   while (Serial.available()) {
    delay(3);  //delay to allow buffer to fill 
    if (Serial.available() >0) {
      char c = Serial.read();  //gets one byte from serial buffer
      readString += c; //makes the string readString
    } 
  }

  
  if (strcmp(readString.substring(0,3),"fwd") == 0){
     left = 1;
     right = 1 
  }
    if (readString.substring(0,3) == 'stp'){
     left = 0;
     right= 0;
    }
  if (readString.substring(0,3) == 'lft'){
      right = left+1;
      if (right == 3) {
         left--;
         right = 2;
      }
  }
  if (readString.substring(0,3) == 'rgt'){
     left = right+1;
     if ( left == 3 ){
       right--;
       left = 2;
     }
  }
  if (readString.substring(0,3) == 'ffd'){
      left = 2;
      right = 2;
  }
    
  if (right == 3) {
    right = 2;
  }
  if (left == 3){
    left = 2;
  }
  /*
   
  int in = (Serial.read()-'0');
  // right = 3;
  if (in == 3){
     left = right+1;
     if ( left == 3 ){
       right--;
       left = 2;
     }
     
  // left = 4
  } else if (in == 4){
     right = left+1;
    if (right == 3) {
     left--;
     right = 2;
    } 
  // fwd = 1;
  } else if (in == 1){
     right = 1;
     left = 1;
  // ffwd = 2
  } else if (in == 2) {
    right = 2;
    left = 2;
  // stop = 0;
  } else if (in == 0) {
    left = 0;
    right = 0;
   
  }
  if (right == 3) {
    right = 2;
  }
  if (left == 3){
    left = 2;
  }
  */
}
