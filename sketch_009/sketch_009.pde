import jto.colorscheme.*;

// ColorScheme

ColorScheme cs;
int counter;
ArrayList<Color> colors;
ArrayList<Integer> integerColors;

void setup() {
  size(500, 500);
  cs = new ColorScheme("xiaocai.xml", this);
  
  colors = cs.getColors();
  integerColors = cs.toIntegerArray();
  
  frameRate(1);
}


void draw() {
  
  //background(colors.get(counter).toInt());
  background(integerColors.get(counter));
  
  counter = (counter + 1 ) % colors.size();
  
}
