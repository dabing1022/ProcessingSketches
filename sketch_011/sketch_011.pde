// https://forum.processing.org/one/topic/moving-particles-following-text-contour.html

import geomerative.*;

ArrayList <PVector> path = new ArrayList<PVector> ();
ArrayList <Particle> particles = new ArrayList<Particle> ();

void setup() {
  size(600, 400);
  smooth();

  RG.init(this);
  RCommand.setSegmentLength(10);
  RFont font = new RFont("Keyboard.ttf", 200, RFont.CENTER);
  RPoint[] points = font.toGroup("S").getPoints();

  int xoff = width/2;
  int yoff = 2*height/3;

  for (int i=0; i<points.length; i++) {
    path.add( new PVector(xoff + points[i].x, yoff + points[i].y) );
    particles.add( new Particle(xoff + points[i].x, yoff + points[i].y, 3, i) );
  }
}

void draw() {
  background(0);
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

class Particle {
  PVector pos;
  float x, y, d, interpolate = 1;
  float speed = 0.05;
  int target;

  Particle(float x, float y, float d, int target) {
    pos = new PVector (x, y);
    this.d = d;
    this.target = target;
  }

  void update() {
    interpolate += speed;
    if (interpolate >= 1) {
      pos = path.get(target);
      target = (target+1) % path.size();
      interpolate = 0;
    }
    PVector t = path.get(target);
    x = lerp(pos.x, t.x, interpolate);
    y = lerp(pos.y, t.y, interpolate);
  }

  void display() {
    noStroke();
    fill(255, 125);
    ellipse(x, y, d, d);
  }
}
