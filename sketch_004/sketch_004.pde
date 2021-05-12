int tileSize = 40;

void setup() {
  size(1200, 760);
  background(0);
  
  stroke(0);
  noFill();
  
  noLoop();
}

// strokeWeight、color

void tileDraw(int x, int y) {
   boolean tl2br = random(0, 1) > 0.5; // top left to bottom right
   strokeWeight(3);
   stroke(random(0, 255), random(0, 255), random(0, 255));
   if (tl2br) {
     line(x, y, x + tileSize, y + tileSize);
   } else {
     line(x + tileSize, y, x, y + tileSize);
   }
}

void draw() {
  for (int i = 0; i < width; i += tileSize) {
    for (int j = 0; j < height; j += tileSize) {
      tileDraw(i, j);
    }
  }
}

void keyPressed() {
  println(key);
  println("Key code pressed: " + keyCode);
  if (key == 's' || key == 'S') {
    saveFrame("tiled_lines.png");
  }
}
