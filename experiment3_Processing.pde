
import processing.sound.*;

import processing.serial.*; // import the Processing serial library
Serial myPort;              // The serial port
int sensor1;
int sensor2;
int sensor3;

int mo=240;

float mappedSensor1;
float mappedSensor2;
float mappedSensor3;


SoundFile sample;
SoundFile sample1;
SoundFile sample2;
Waveform waveform;
int x0;
int y0;
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int x4;
int y4;
int samples = 100;

//vertical line
float xoff = 0.0;

float angle;
void setup() 
{
  fullScreen(P3D);
  printArray(Serial.list());
  

  
 
   sample = new SoundFile(this, "masha.mp3");
   sample1 = new SoundFile(this, "xylo.wav");
   sample2 = new SoundFile(this, "song.wav");
  
    sample.play();
    sample.loop();
    sample.amp (0);
    sample1.play();
    sample1.loop();
    sample1.amp (0);
    sample2.play();
    sample2.loop();
    sample2.amp (0);
   



  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  waveform = new Waveform (this,samples);
  waveform.input(sample);
  //patterncircles
  x0 = 400;
  y0 = 400;

  x1 = x0 - 200;
  y1 = x0 - 200;
  
  x2 = x0 + 200;
  y2 = x0 - 200;
  
  x3 = x0 - 200;
  y3 = x0 + 200;
  
  x4 = x0 + 200;
  y4 = x0 + 200;
}



void draw() {
  background(255);
   PFont font;
    

   stroke(0);
   strokeWeight(1);
   noFill();

 //waveform
  waveform.analyze();
  line (200,0,200,height);
  line (400,0,400,height);
  line (600,0,600,height);
  line (800,0,800,height);
  line (1000,0,1000,height);
  line (1200,0,1200,height);
  line (1400,0,1400,height);
  beginShape();
  for(int i = 0; i < samples; i++){
    vertex(
     map(i, 0, samples, 0 , width),
     map(waveform.data[i], -1, 1, 0, 400)
    );
  }
  endShape();
  
   beginShape();
  for(int i = 0; i < samples; i++){
    vertex(
      map(i, 0, samples, 0, width),
      map(waveform.data[i], -1, 1, 0, 800)
    );
  }
  endShape();
   beginShape();
  for(int i = 0; i < samples; i++){
    vertex(
      map(i, 0, samples, 0, width),
      map(waveform.data[i], -1, 1, 0, 1200)
    );
  }
  endShape();
  
  if (sensor1 < 990) {
    noStroke();
    fill(57, 255, 20);
    sample.amp(1);
    font = createFont("Arial",35);
    fill(0, 229, 255);
    textFont(font);
    text("blup",50+mo,100);
    stroke (0);
    noFill();
ellipse(100+mo,100, frameCount%100,frameCount%100);
ellipse(100+mo,100, frameCount%75,frameCount%75);
ellipse(100+mo,100, frameCount%50,frameCount%50);
fill(0, random(0,240), 255);
ellipse(200+mo, mappedSensor1*3.5, frameCount%200, frameCount%200);
  }
   else
   {
       sample.amp (0);
      
       
   }
   noStroke();
   
    //box
  push();
  noStroke();
  translate(550+mo,300,200);
  rotateX(frameCount*0.01);
  rotateY(frameCount*0.01);
  fill(128, 235, 52);
  rectMode(CENTER);
  box(50);
  pop();
  
  //box
  push();
  noStroke();
  translate(200+mo,400,200);
  rotateX(frameCount*0.01);
  rotateY(frameCount*0.01);
  fill(255, 102, 0);
  rectMode(CENTER);
  box(25);
  pop();
    

  if (sensor2 <800) {
  rectMode(CENTER);
  stroke((frameCount * 0.3) % 360, 50, 90);
  strokeWeight(1);
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
  sample1.amp(1);
  textSize(50);
    
   
    textSize(50);
    font = createFont("Arial",45);
    fill(21, 0, 255);
    textFont(font);
    text("PLAY MORE",100+mo,600);
    
    fill(255, 238, 0);
    noStroke();
    rect(600+mo, mappedSensor2, 135,135);
  }
  else
  {
    sample1.amp(0);
  }
    
  rectMode(CENTER);
  fill(200, 0, 255);
  translate(width/2, height/2);
  rect(600+mo, mappedSensor2, 135,135);
 
  if (sensor3 <600 ) {
    
  fill(252, 123, 3);
  rect(210,90,30,180);
  fill(252, 3, 44);
  rect(120,210,150,40);
  sample2.amp (1);
   

  }
   else {
  sample2.amp(0);
  fill(255, 0, 157);
  translate(width/2, height/2);
  translate(400, 400);
  stroke(255);
  strokeWeight(2);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);}
   

  translate(0, 0);
  stroke(255);
  strokeWeight(2);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
 
  
}


void serialEvent(Serial myPort) {
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
  myString = trim(myString);

   
  int sensors[] = int(split(myString, ','));
  for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
  print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    
    println();
    sensor1 = sensors[0];  
    sensor2 = sensors[1]; 
    sensor3 = sensors[2];
    mappedSensor1 = map(sensor1, 0, 1023, height, 0);
    mappedSensor2 = map(sensor2, 0, 1023, height, 0);
    mappedSensor3 = map(sensor3, 0, 1023, height, 0);
  }
}
