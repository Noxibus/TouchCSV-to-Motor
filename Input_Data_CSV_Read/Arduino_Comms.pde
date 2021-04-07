import processing.serial.*;
Serial myPort; 

void setupSerial() {

  String portName = Serial.list()[2]; //change to correct port
  myPort = new Serial(this, portName, 9600);

}
