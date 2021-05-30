// https://openprocessing.org/sketch/1199460

Particle[] particles;
float alpha;

void setup() {
  size(800, 600);
  background(0);
  noStroke();
  
  setParticles();
}


void draw() {
  frameRate(60);
  alpha = map(mouseX, 0, width, 5, 35);
  fill(0, alpha);
  rect(0, 0, width, height);

  loadPixels();
  for(Particle p : particles) {
    p.run();
  }
  updatePixels();
}

void mousePressed() {
  setParticles();
}

void setParticles() {
  particles = new Particle[6000];
  for (int i = 0; i < 6000; i++) {
    float x = random(width);
    float y = random(height);
    color c = color(255, 255, 255, 100);
    particles[i] = new Particle(new PVector(x, y), c);
  }
}


class Particle {
  PVector pos;
  float increment;
  float angle;
  color c;

  Particle(PVector posIn, color cIn) {
    pos = posIn;
    c = cIn;
  }

  void run() {
    update();
    wrap();
    display();
  }

  void update() {
    increment += 0.008;
    angle = noise(pos.x * 0.006, pos.y * 0.004, increment) * TWO_PI;
    pos.x += 2 * cos(angle);
    pos.y += 2 * sin(angle);
  }

  void wrap() {
    if (pos.x < 0) pos.x = width;
    if (pos.x > width) pos.x = 0;
    if (pos.y < 0) pos.y = height;
    if (pos.y > height) pos.y = 0;
  }

  void display() {
    if (pos.x > 0 && pos.x < width && pos.y > 0 && pos.y < height) {
      pixels[(int)pos.x + (int)pos.y * width] = c;
    }
  }

}
