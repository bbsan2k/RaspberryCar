#include <AFMotor.h>
#include <SoftwareSerial.h>
#include <stdlib.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);
SoftwareSerial mySerial(14, 15);

int left, right;
int dir;

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


  motor1.setSpeed(right);
  motor2.setSpeed(right);
  motor3.setSpeed(left);
  motor4.setSpeed(left);


  /*
  Serial.print("\n RIGHT:");
   Serial.print(right*125);
   Serial.print("        ");
   Serial.print(" Left:");
   Serial.print(left*125);*/
}

void get(){

  delay(100); // 100ms freq
  //String read;
  int counter = 0;
  int val;
  //while (mySerial.available()){
  if (mySerial.available()){
    delay(3);
    if (mySerial.available() > 0){
      char c = mySerial.read();
      char reader [3];
      if (c == 'l'){
        reader[0] = mySerial.read();
        reader[1] = mySerial.read();
        reader[2] = mySerial.read();
        left=atoi(reader);
        c = mySerial.read();
      }
      if (c == 'r'){
        reader[0] = mySerial.read();
        reader[1] = mySerial.read();
        reader[2] = mySerial.read();
        right=atoi(reader);
        c = mySerial.read();
      }
      if (c == 'f'){
        dir = 1;
      }
      if (c == 'b'){
        dir = -1;
      }

      //read += c;
    }
    //counter++;
    //if (counter == 2) break;
  }
  /*if (read == "00"){
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
   }*/

  if (right >= 255) {
    right = 255;
  }
  if (left >= 255){
    left = 255;
  }



}



