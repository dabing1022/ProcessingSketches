import controlP5.*;

float segs = 200;
float radian = 0;
float lineLength = 30;
float lineWeight = 1;
ControlP5 cp5;
Slider segSlider;
Slider radianSlider;
Slider lineLengthSlider;
Slider lineWeightSlider;

void setup() {
  size(1200, 700);
  background(10);
  smooth(5);
  
  cp5 = new ControlP5(this);
  segSlider = cp5.addSlider("SEGS COUNT")
    .setPosition(10, 40)
    .setRange(20, 1000)
    .setSize(500, 40)
    .setValue(200);
    
  radianSlider = cp5.addSlider("RADIAN")
    .setPosition(10, 100)
    .setRange(0, radians(360))
    .setSize(500, 40)
    .setValue(0);
    
  lineLengthSlider = cp5.addSlider("LINE LENGTH")
    .setPosition(10, 160)
    .setRange(20, 800)
    .setSize(500, 40)
    .setValue(30);
    
  lineWeightSlider = cp5.addSlider("LINE WEIGHT")
    .setPosition(10, 220)
    .setRange(1, 30)
    .setSize(500, 40)
    .setValue(1);    
}

void draw() {
  background(10);
  stroke(255);
  segs = segSlider.getValue();
  radian = radianSlider.getValue();
  lineLength = lineLengthSlider.getValue();
  lineWeight = lineWeightSlider.getValue();
  
  float headX = width / 2;
  float headY = height / 2;
  float tailX = headX + lineLength * cos(radian);
  float tailY = headY + lineLength * sin(radian);
  gradientLine(color(255, 0, 0), color(0, 255, 0), headX, headY, tailX, tailY);
}

void gradientLine(color color1, color color2, float x1, float y1, float x2, float y2) {
  for (float i = 0; i < segs; i++) {
    color c = lerpColor(color1, color2, i / segs);
    stroke(c);
    strokeWeight(lineWeight);
    float segHeadX = lerp(x1, x2, i / segs);
    float segHeadY = lerp(y1, y2, i / segs);
    float segTailX = lerp(x1, x2, (i + 1) / segs);
    float segTailY = lerp(y1, y2, (i + 1) / segs);
    line(segHeadX, segHeadY, segTailX, segTailY);
  }
}
