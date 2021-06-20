// 参考学习 //<>// //<>//
// https://openprocessing.org/sketch/1130387

String[] imageNames = {"deadpool.jpeg", 
  "ironman.jpeg",
  "spiderman.png",
  "fangao_xingye.jpeg", 
  "mengke_nahan.jpeg"};
int index = 0;
float strokeLength = 35;  
float noiseScale = 0.005;

PImage[] imgs = new PImage[imageNames.length];
PImage img;

int frame;
int drawLength = 250;

void setup() {
  size(800, 800);
  background(255);

  for (int i = 0; i < imageNames.length; i++) {
    imgs[i] = loadImage(imageNames[i]);
  }
  img = imgs[0];
  img.loadPixels();

  noiseSeed(int(random(1000)));
}

void mousePressed() {
  background(255);
  index += 1;
  if (index >= imageNames.length) {
    index = 0;
  }
  img = imgs[index];
  img.loadPixels();
  frame = 0;
}

void draw() {
  if (frame > drawLength) {
    return;
  }

  translate((width - img.width) / 2, (height - img.height) / 2);

  float count = map(frame, 0, drawLength, 2, 80);
  for (float i = 0; i < count; i++) {
    int x = int(random(img.width));
    int y = int(random(img.height));
    int index = y * img.width + x;
    int c = img.pixels[index];
    float strokeThickness = map(frame, 0, drawLength, 25, 0);

    Particle particle = new Particle(x, y, c, strokeThickness);
    particle.display();
  }

  frame++;
}

class Particle {
  float x;
  float y;
  color c;
  float strokeThickness;
  Particle(float x, float y, color c, float strokeWeight) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.strokeThickness = strokeWeight;
  }

  void display() {
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float a = alpha(c);

    stroke(r, g, b, a);
    strokeWeight(strokeThickness);

    pushMatrix();
    translate(x, y);
    float noiseVal = noise(x * noiseScale, y * noiseScale);
    float angle = map(noiseVal, 0, 1, -PI, PI);
    rotate(angle);
    float lengthVariation = random(0.75, 1.25);
    line(0, 0, strokeLength * lengthVariation, 0);

    stroke(min(r * 3, 255), min(g * 3, 255), min(b * 3, 255), random(100));
    strokeWeight(strokeThickness);
    line(0, -strokeThickness * 0.15, strokeLength * lengthVariation, -strokeThickness * 0.15);
    popMatrix();
  }
}