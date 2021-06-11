int moversLen = 5;
Mover[] movers = new Mover[moversLen];
void setup() {
  size(800, 800);
  background(255);
  rectMode(CENTER);
  smooth();
  randomSeed(100);

  for (int i = 0; i < moversLen; i++) {
    color c = color(random(255), random(255), random(255));
    Mover mover = new Mover(width / 2, height / 2, random(100, 400), random(0.1, 0.4), random(0.01, 0.05), c);
    movers[i] = mover;
  }
}

void draw() {
  fill(5);
  noStroke();
  rect(width / 2, height / 2, width, height);

  fill(255);
  circle(width / 2, height / 2, 20);

  for (Mover mover : movers) {
    mover.update();
    mover.display();
  }
}

class Mover {
  float centerX;
  float centerY;
  float rotation;
  float angle;
  float r;
  float x;
  float y;
  float selfRotateSpeed;
  float publicRotateSpeed;
  color c;

  Mover(float centerX, float centerY, float r, float selfRotateSpeed, float publicRotateSpeed, color c) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.r = r;
    this.selfRotateSpeed = selfRotateSpeed;
    this.publicRotateSpeed = publicRotateSpeed;
    this.c = c;
  }

  void update() {
    rotation += selfRotateSpeed;
    angle += publicRotateSpeed;
    x = centerX + r * cos(angle);
    y = centerY + r * sin(angle);
  }

  void display() {


    noFill();
    stroke(c);
    strokeWeight(4);
    circle(centerX, centerY, 2 * r);

    pushMatrix();
    translate(x, y);
    rotate(rotation);
    rect(0, 0, 20, 20);
    popMatrix();
  }
}
