import processing.serial.*;

Serial myPort;

float angle = 90;
float distance = 0;

float maxDistance = 200;

void setup() {

  size(1000, 600);

  println(Serial.list());

  // CHANGE THIS NUMBER IF REQUIRED
  myPort = new Serial(this, Serial.list()[0], 9600);

  myPort.bufferUntil('\n');

  smooth();
}

void draw() {

  background(0);

  drawRadar();
  drawScanLine();
  drawObject();

  drawInformation();
}

void serialEvent(Serial myPort) {

  String data = myPort.readStringUntil('\n');

  if (data != null) {

    data = trim(data);

    String[] values = split(data, ',');

    if (values.length == 2) {

      try {

        angle = float(values[0]);
        distance = float(values[1]);

      } 
      catch (Exception e) {
        
      }
    }
  }
}

void drawRadar() {

  pushMatrix();

  translate(width/2, height-40);

  // Radar semicircles
  noFill();
  stroke(0, 255, 0);
  strokeWeight(2);

  arc(0, 0, 200, 200, PI, TWO_PI);
  arc(0, 0, 400, 400, PI, TWO_PI);
  arc(0, 0, 600, 600, PI, TWO_PI);
  arc(0, 0, 800, 800, PI, TWO_PI);

  // Radar horizontal line
  line(-400, 0, 400, 0);

  // Radar angle lines
  line(0, 0, -346, -200);
  line(0, 0, -200, -346);
  line(0, 0, 0, -400);
  line(0, 0, 200, -346);
  line(0, 0, 346, -200);

  // Distance labels
  fill(0, 255, 0);
  textSize(14);

  text("50 cm", 10, -100);
  text("100 cm", 10, -200);
  text("150 cm", 10, -300);
  text("200 cm", 10, -400);

  popMatrix();
}

void drawScanLine() {

  pushMatrix();

  translate(width/2, height-40);

  float r = 400;

  float x = r * cos(radians(180 - angle));
  float y = -r * sin(radians(180 - angle));

  stroke(0, 255, 0);
  strokeWeight(3);

  line(0, 0, x, y);

  popMatrix();
}

void drawObject() {

  if (distance > 0 && distance <= maxDistance) {

    pushMatrix();

    translate(width/2, height-40);

    float r = map(distance, 0, maxDistance, 0, 400);

    float x = r * cos(radians(180 - angle));
    float y = -r * sin(radians(180 - angle));

    fill(255, 0, 0);
    noStroke();

    ellipse(x, y, 15, 15);

    popMatrix();
  }
}

void drawInformation() {

  fill(0, 255, 0);
  textSize(22);

  text("ARDUINO RADAR SYSTEM", 20, 35);

  textSize(18);

  text("Angle: " + int(angle) + "°", 20, 70);

  if (distance <= maxDistance) {

    text("Distance: " + int(distance) + " cm", 20, 100);

  } else {

    text("Distance: Out of Range", 20, 100);
  }

  fill(255, 0, 0);
  textSize(16);

  text("RED = OBJECT DETECTED", 20, 135);
}
