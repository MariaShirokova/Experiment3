int sensor1val;
int sensor2val;
int sensor3val;
//int sensor4val;

void setup() {
  //start serial connection
  Serial.begin(9600);
}

void loop() {
  // read the sensor value
  sensor1val = analogRead(0);
  // print out the sensor value
  Serial.print(sensor1val);
  // print a comma to separate the values
  Serial.print(",");

  // read the sensor value
  sensor2val = analogRead(1);
  // print out the sensor value
  Serial.print(sensor2val);
  // print a comma to separate the values
  Serial.print(",");

  // read the sensor value
  sensor3val = analogRead(2);
   Serial.print(sensor3val);
  // print out the sensor value and add a line break
  Serial.println();

  
  
// read the sensor value
 

}
