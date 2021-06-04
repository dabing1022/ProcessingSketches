void setup() {
  size(500, 500);
  background(255);
  
  //PFont f = loadFont("FiraCode-Bold-48.vlw");
  
  //String[] fontList = PFont.list();
  //printArray(fontList);
  
  PFont f = createFont("HackNerdFontComplete-Regular");
  textFont(f);
  
  textAlign(CENTER, CENTER);
}

void draw() {
  fill(0);
  text("hello", width / 2, height / 2);
}
