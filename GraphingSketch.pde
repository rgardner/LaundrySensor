/* Processing code for this example
 
 // Graphing sketch
 
 
 // This program takes ASCII-encoded strings
 // from the serial port at 9600 baud and graphs them. It expects values in the
 // range 0 to 1023, followed by a newline, or newline and carriage return
 
 // Created 20 Apr 2005
 // Updated 18 Jan 2008
 // by Tom Igoe
 // This example code is in the public domain.
 
*/
 /*
import processing.serial.*;
 
Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
secondApplet s;

void setup ()
{
 // set the window size:
 size(400, 300); 
 s = new secondApplet();
 
 // List all the available serial ports
 println(Serial.list());
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[0].
 // Open whatever port is the one you're using.
 myPort = new Serial(this, Serial.list()[5], 9600);
 // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');
 // set inital background:
 background(0);
}

void draw ()
{
 // everything happens in the serialEvent()
}
 
void serialEvent (Serial myPort)
{
 // get the ASCII string:
 String inString = myPort.readStringUntil('\n');
 String[] s = inString.split("|");
 
 if (s[0] != null) {
   // trim off any whitespace:
   s[0] = trim(s[0]);
   // convert to an int and map to the screen height:
   float inByte = float(s[0]); 
   inByte = map(inByte, 0, 1023, 0, height);
   
   // draw the line:
   stroke(127,34,255);
   line(xPos, height, xPos, height - inByte);
   
    // at the edge of the screen, go back to the beginning:
    if (xPos >= width) {
      xPos = 0;
      background(0); 
    } else {
      // increment the horizontal position:
      xPos++;
    }
  }
}

public class secondApplet extends PApplet {
    public void setup() {
        size(400, 300);
        
    }

    public void draw() {
    }
} 
*/
import processing.serial.*;
 
Serial myPort;


float x,y,z;
int xPos = 1;

void setup() {
  size(1000, 800);
  setBounds(0, 0, 1000,800);
  
  
  // List all the available serial ports
 println(Serial.list());
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[0].
 // Open whatever port is the one you're using.
 myPort = new Serial(this, Serial.list()[5], 9600);
 // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');
 background(0);
}




void serialEvent (Serial myPort)
{
  stroke(255,255,255);
 line(0, (int)(2*(height/3)), width, (int)(2*(height/3)));
 line(0, (int)((height/3)), width, (int)((height/3)));
 line(0, 0, width, 0);
 
 line(0, (int)(2*(height/3)+height/6), width, (int)(2*(height/3)+height/6));
 line(0, (int)(height/2 ), width, (int)(height/2) );
 line(0, (int)((height/6)), width, (int)((height/6)));

 // get the ASCII string:
 String inString = myPort.readStringUntil('\n');
 String[] s = inString.split(",");
// for (int i = 0; i < s.length; i++) {
//    println(s[i]);
// }
println(inString);
 x = float(trim(s[0]));
 y = float(trim(s[1]));
 z = float(trim(s[2]));
 
  float inByteX = map(x, 0, 1023, 2*(height/3), height);
  float inByteY = map(y, 0, 1023, (int)(height/3), (int)(2*(height/3)));
  float inByteZ = map(z, 0, 1023, 0, height/3);
 
 // draw the line:
 stroke(255,0,0);
 line(xPos, height, xPos, height - inByteX);
 
 stroke(0,255,0);
 line(xPos, height, xPos, height - inByteY);
 
 stroke(0,0,255);
 line(xPos, height, xPos, height - inByteZ);
 // at the edge of the screen, go back to the beginning:
 if (xPos >= width) {
   xPos = 0;
   background(0); 
 } else {
   // increment the horizontal position:
   xPos++;
 }
} 
 
 void draw () {
 // everything happens in the serialEvent()
 }


