float f = 0;
void setup() {
  size(600, 500);
}

void draw() {
  f += 1;
  background(#53354a);
  fill(#e84545);
  stroke(#903749);
  for (float y = 100; y < height; y += 5) {
    beginShape();
    for (float x = 0; x < width; x += 1) {
        vertex(x, y - 80 / (1 + (pow(x - width / 2, 4) / 8000000)) * noise(x / 30 + y + f / 10));
    }
      
    endShape();
  }
}
