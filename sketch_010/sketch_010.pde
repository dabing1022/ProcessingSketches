String colorString = "7ac74f-a1cf6b-d5d887-e0c879-e87461";
color[] colors;

int counter = 0;

void setup() {
  size(500, 500);
  colors = getColors(colorString);
  
  frameRate(1);
}

void draw() {

  background(colors[counter]);
  
  counter = (counter + 1) % colors.length;
}


color[] getColors(String colorStr) {
  String[] colorStrings = colorStr.split("-");
  color [] result = new color[colorStrings.length];
  for (int i = 0; i < colorStrings.length; i++) {
    result[i] = unhex(colorStrings[i]);
  }
  return result;
}
