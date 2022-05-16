String testMessage = "(100, 200, 300)";

void setup() {
  size(200, 200);  
  color c = calColor(testMessage);
  background(c);
}

void draw() {
  
}


color calColor(String message) {
  message = message.replace("(", "");
  message = message.replace(")", "");
  message = message.replace(" ", "");
  String[] rgb = message.split(",");
  print(message);
  
  float r = Integer.parseInt(rgb[0]);
  float g = Integer.parseInt(rgb[1]);
  float b = Integer.parseInt(rgb[2]);
  color c = color(r, g, b);
  return c;
}
