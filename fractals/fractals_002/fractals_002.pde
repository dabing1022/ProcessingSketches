// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Recursion


// 带上数字序号

int index = 1;
void setup() {
  size(700, 700);
  textSize(20);
}

void draw() {
  background(255);
  drawCircle(width/2,height/2,width); 
  noLoop();
}

// Very simple function that draws one circle 
// and recursively calls itself
void drawCircle(int x, int y, float r) {
  noFill();
  ellipse(x, y, r, r);
  fill(0);
  float angle = random(TAU);
  text(str(index), x + r * 0.5 * cos(angle), y + r * 0.5 * sin(angle));
  index += 1;
  // Exit condition, stop when radius is too small
  if (r > 2) {
    r *= 0.75f;
    // Call the function inside the function! (recursion!)
    drawCircle(x, y, r);	 
  }				
}