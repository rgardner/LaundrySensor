/*
  Laundry Sensors
 Determine whether a given laundry machine (washer or drier) is in use by
 measuring their acceleration.
 
 Created by Bob Gardner and Richard Samuels
 modified 6 Apr 2014

*/

int x, y, z;

void setup()
{
  // declare the pins
  Serial.begin(9600);      // sets the serial port to 9600
}

void loop()
{
  x = analogRead(0);       // read analog input pin 0
  y = analogRead(1);       // read analog input pin 1
  z = analogRead(2);       // read analog input pin 1
  //Serial.print("accelerations are x, y, z: ");
  Serial.print(x, DEC);    // print the acceleration in the X axis
  Serial.print(",");
  Serial.print(y, DEC);
  Serial.print(",");
  Serial.println(z, DEC);
  delay(100);              // wait 100ms for next reading
}

