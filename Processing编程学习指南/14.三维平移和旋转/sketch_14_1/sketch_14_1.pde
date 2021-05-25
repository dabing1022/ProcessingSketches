float r = 8;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);

  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(width/2, height/2, r, r);
  r++;
}
