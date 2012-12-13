#include <AFMotor.h>
#include <SoftwareSerial.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);
SoftwareSerial mySerial(14, 15);

int left, right;

void setup(){
  mySerial.begin(9600);
  right = 0;
  left = 0;
  
}

void loop(){
  get();
  drive();
  
  
  /*Serial.print("\n RIGHT:");
  Serial.print(right*127);
  Serial.print("        ");
  Serial.print(" Left:");
  Serial.print(left*127);*/
  
}

void drive(){
  
  motor1.run(FORWARD);
  motor2.run(FORWARD);
  motor3.run(FORWARD);
  motor4.run(FORWARD);


  motor1.setSpeed(right*127);
  motor2.setSpeed(right*127);
  motor3.setSpeed(left*127);
  motor4.setSpeed(left*127);
 
  
/*
  Serial.print("\n RIGHT:");
  Serial.print(right*125);
  Serial.print("        ");
  Serial.print(" Left:");
  Serial.print(left*125);*/
}

void get(){
  
  delay(100);
  String read;
  int counter = 0;
  while (mySerial.available()){
   delay(3);
   if (mySerial.available() > 0){
     char c = mySerial.read();  
     
     read += c;
     }
     counter++;
     if (counter == 2) break;
    }
  if (read == "00"){
     left = 0;
     right = 0;
  }
  if (read == "11"){
     left = 1;
     right = 1;
  }
  if (read == "22"){
     left = 2;
     right = 2;
  }
  if (read == "21"){
     left = right+1;
     if ( left == 3 ){
       right--;
       left = 2;
     }
  }
  if (read == "12"){
      right = left+1;
      if (right == 3) {
         left--;
         right = 2;
      }
  }
  
  if (right == 3) {
    right = 2;
  }
  if (left == 3){
    left = 2;
  }


  
}
  
  
