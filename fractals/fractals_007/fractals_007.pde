// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// The Mandelbrot Set

// Simple rendering of the Mandelbrot set
// c = a + bi
// Iterate z = z^2 + c, i.e.
// z(0) = 0
// z(1) = 0*0 + c
// z(2) = c*c + c
// z(3) = (c*c + c) * (c*c + c) + c
// etc.

// c*c = (a+bi) * (a+bi) = a^2 - b^2 + 2abi

// Establish a range of values on the complex plane
double xmin = -2.5; 
double ymin = -1; 
double w = 4; 
double h = 2;
// A different range will allow us to "zoom" in or out on the fractal
// double xmin = -1.5; double ymin = -.1; double wh = 0.15;

import controlP5.*;

ControlP5 cp5;
Slider xminSlider;
Slider yminSlider;
Slider wSlider;
Slider hSlider;

void setup() {
  size(864, 432);
  cp5 = new ControlP5(this);

  xminSlider = cp5.addSlider("x min")
    .setPosition(10, 40)
    .setRange(-2.5, -1.5)
    .setSize(100, 20)
    .setValue(-2.5);

  yminSlider = cp5.addSlider("y min")
    .setPosition(10, 80)
    .setRange(-0.1, -1.0)
    .setSize(100, 20)
    .setValue(-1.0);  

  wSlider = cp5.addSlider("w")
    .setPosition(10, 120)
    .setRange(0.01, 4)
    .setSize(100, 20)
    .setValue(4);    

  hSlider = cp5.addSlider("h")
    .setPosition(10, 160)
    .setRange(0.01, 2)
    .setSize(100, 20)
    .setValue(2);
}

void draw() {
  loadPixels();

  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 200;

  // x goes from xmin to xmax
  double xmax = xminSlider.getValue() + wSlider.getValue();
  // y goes from ymin to ymax
  double ymax = yminSlider.getValue() + hSlider.getValue();

  // Calculate amount we increment x,y for each pixel
  double dx = (xmax - xmin) / (width);
  double dy = (ymax - ymin) / (height);

  // Start y
  double y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    double x = xmin;
    for (int i = 0; i < width; i++) {

      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      double a = x;
      double b = y;
      int n = 0;
      while (n < maxiterations) {
        double aa = a * a;
        double bb = b * b;
        double twoab = 2.0 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        // Infinty in our finite world is simple, let's just consider it 16
        if (aa + bb > 16.0f) {
          break;  // Bail
        }
        n++;
      }

      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        pixels[i+j*width] = color(n*16 % 255);  // Gosh, we could make fancy colors here if we wanted
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
}
