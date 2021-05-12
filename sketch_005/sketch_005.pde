int padding = 100;

void setup() {
  size(800, 800);
  frameRate(60);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(0, 0, 10);
  fill(0, 0, 255);
  text(frameCount, 50, 50);
  
  float w = width - padding * 2;
  float h = height - padding * 2;

  translate(padding, padding);
  stroke(0, 0, 100);
  fill(0, 0, 0);
  for (float y = 0; y <= h; y += h / 50) {
    beginShape();
    for (float x = 0; x <= w; x += 1) {
      float dist = abs(x - w / 2);
      float deg = map(dist, 0, w / 2, 0, 90);
      float amplitude = map(sin(radians(deg)), 0, 1, h / 5, h / 100);
      float n = noise(y / 20, x / 40, frameCount / 100);
      //float n = noise(y / 20, x / 40);
      n = map(n * n, 0, 1, -0.1, 0.7);
      float py = y - n * amplitude;
      vertex(x, py);
    }
    endShape();
  }
}
