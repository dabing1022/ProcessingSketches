/* Messy Line Portrait
 Author: Undercurrent
 Inspired by thedotisblack at https://www.youtube.com/watch?v=zT7We17o4zU&t=15s
 */

int num = 400;
Agent[]as;
PImage pic;
boolean playing = true;

void setup() {
  size(1000, 1000);
  colorMode(HSB);
  as = new Agent[num];
  for (int i = 0; i < num; i++) {
    as[i] = new Agent();
  }

  pic = loadImage("bw2.jpg");
  pic.resize(width, height);
  pic.filter(THRESHOLD, 0.3);

  background(255);
}

void draw() {
  for (int i = 0; i < num; i++) {
    as[i].update();
    as[i].display();
  }
}

void mousePressed() {
  playing =! playing;
  if (playing) {
    loop();
  } else {
    noLoop();
  }
}

void keyPressed() {
  if (key ==  ' ') {
    saveFrame("" + frameCount + ".png");
  }
  if (key ==  'r') {
    background(255);
  }
}

class Agent {
  PVector center;
  PVector spd;
  PVector loc;
  PVector prev;
  float angle = random(TWO_PI);
  float angleSpd = random(0.01, 0.02);
  float rad = random(10, 100);
  color c = color(random(255), random(50, 120), random(150, 200));
  int energy;

  Agent() {
    center = new PVector(random(width), random(height));
    spd = PVector.random2D();
    spd.mult(random(0.2, 1));
    loc = new PVector();
    loc.set(center.x + cos(angle) * rad, center.y + sin(angle) * rad);
    prev = loc.copy();
  }

  void update() {
    center.add(spd);

    angle += angleSpd;
    loc.set(center.x + cos(angle) * rad, center.y + sin(angle) * rad);

    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) {
      center.set(random(width), random(height));
      loc.set(center.x + cos(angle) * rad, center.y + sin(angle) * rad);
      prev = loc.copy();
      energy = 0;
    }
  }

  void display() {
    if (brightness(pic.get(int(loc.x), int(loc.y))) ==  255) {
      energy -= 3;
      energy = max(energy, 0);
    } else {
      energy++;
    }

    if (energy > 0) {
      strokeWeight(1);
      stroke(c, 70);
      line(prev.x, prev.y, loc.x, loc.y);
    }
    prev = loc.copy();
  }
}
