void setup() {
  size(400, 400);
  background(255);
  frameRate(4);
}

void draw() {
  fill(random(255), random(255), random(255));
  translate(200, 200);
  // circle(0, 0, 200);
  ellipse(0, 0, 200, 300);
  // rect(0, 0, 100, 200);
}
