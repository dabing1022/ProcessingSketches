String colorString = "ef476f-ffd166-06d6a0-118ab2-073b4c";
int[] colors;
int index = 1;
PVector lineStartPos;
PVector lineEndPos;
float squareSize = 50;
float halfSquareSize = squareSize / 2;

void setup() {
  size(450, 450);
  colors = getColors(colorString);
  stroke(0);
  strokeWeight(4);

  lineStartPos = new PVector(0, 300);
  lineEndPos = new PVector(width, 300);
  fill(colors[index]);
}

void draw() { 
  stepDraw();
}

void stepDraw() {
  background(colors[0]);
  line(lineStartPos.x, lineStartPos.y, lineEndPos.x, lineEndPos.y); 
  float sinValue = abs(sin(frameCount * 0.06));
  translate((lineEndPos.x - lineStartPos.x) / 2, lineStartPos.y - squareSize / 2 - sinValue * 0.414 * (squareSize / 2));
  rotate(frameCount * 0.03);

  if (sinValue <= 0.03) { 
    index = (index + 1) % colors.length; 
    if (index == 0) {
      index = 1;
    }
    fill(colors[index]);
  }
  rect(-halfSquareSize, -halfSquareSize, squareSize, squareSize);
}

int[] getColors(String colorStr) {
  // get color string list by slit -
  String[] colorStrings = colorStr.split("-");
  int [] result = new int[colorStrings.length];
  // convert string list to int list
  for (int i = 0; i < colorStrings.length; i++) {
    if (colorStrings[i].length() == 6) {
      result[i] = unhex("FF" + colorStrings[i]);
    } else {
      result[i] = unhex(colorStrings[i]);
    }
  }
  return result;
}
