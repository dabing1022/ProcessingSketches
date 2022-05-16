PShape s;

void setup() {
  size(800, 800, P3D);
  frameRate(60);
  // The file "bot.obj" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("HelloWorld.obj");
}

void draw() {
  background(204);
  translate(width/2, height/2);
  shape(s, 0, 0);
}
