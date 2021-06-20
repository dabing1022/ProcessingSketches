int count = 30;
float[] angles = new float[count];
float[] angleSpeeds = new float[count];
float[] squareSizes = new float[count];

void setup() {
  size(700, 700);
  background(255);
  smooth();

  stroke(0);
  strokeWeight(10);
  fill(255);
  rectMode(CENTER);

  for (int i = 0; i < count; i++) {
    angles[i] = 0;
    angleSpeeds[i] = 0.2 + i * 0.15;
    squareSizes[i] = 300 - i * 10;
  }
}

void draw() {
  background(255);

  translate(width / 2, height / 2);

  for (int i = 0; i < count; i++) {
    angleSpeeds[i] = 0.2 + i * 0.20;
    squareSizes[i] = 300 - i * 10;
  }

  for (int i = 0; i < count; i++) {
    pushMatrix();

    rotate(radians(angles[i]));
    angles[i] += angleSpeeds[i];
    square(0, 0, squareSizes[i]);

    popMatrix();
  }
}
