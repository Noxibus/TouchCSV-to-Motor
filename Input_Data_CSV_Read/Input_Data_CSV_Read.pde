Table table;
TableRow row;
int timer =0; 
int timerDelay= 1000;//1000 millisenconds/ 1 second. 
int i=0;
float val;
int mapMin = 0;
int mapMax = 2000;
float lerpFdata;
float newData;


void setup() {
setupSerial();
  size(500, 500); //testing screen
  background(0);

  //initialise the CSV file. 
  table = loadTable("DATALOG.csv", "header");
  row = table.getRow(0);
 
}

void draw() {
    printArray(Serial.list());
  readCSV();

myPort.write(int(val));
  println(int(val));
  //float cVal = constrain(val, 0, 180);
}

void readCSV() { 
  if (millis() >= timer) {
   
    timer = millis() + timerDelay;

    row = table.getRow(i); // get a new row of data
    val = map(row.getInt("Value"), mapMin, mapMax, 0, 180);

    // increment row counter
    i++;

    //  check to see if at end of data
    if (i == table.getRowCount()) {
      i = 0;//if so, loop back to first row
    }
  }
}
