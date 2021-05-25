void setup() {
   size(800, 800);
   colorMode(HSB);
}

void draw() {
    fill(0, 10);
    noStroke();
    rect(0, 0, width, height);


    fill(30, 255, 255);
    circle(mouseX, mouseY, 50);
}
