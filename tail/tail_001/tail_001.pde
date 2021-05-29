import controlP5.*;

ControlP5 cp5;
Slider alphaSlider;
float alpha;
void setup() {
  size(800, 800);
  colorMode(HSB);

  cp5 = new ControlP5(this);
  alphaSlider = cp5.addSlider("ALPHA")
    .setPosition(10, 40)
    .setSize(floor(width * 0.8), 40)
    .setRange(0, 255)
    .setValue(10);
}

void draw() {
  alpha = alphaSlider.getValue();
  
  fill(0, alpha);
  noStroke();
  rect(0, 0, width, height);


  fill(30, 255, 255);
  circle(mouseX, mouseY, 50);
}
