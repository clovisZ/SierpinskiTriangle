int canvas = 1000;
int shapeSize = 500;
float baseCase = 400;
int[] colors = {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
};
int chosenColor = colors[(int)(Math.random()*3)];
void setup() {
  size(1000, 1000);
  background(0);
}

public void draw() {
  noStroke();
  background(0);
  fill(chosenColor);
  sierpinski((canvas/2) - (shapeSize/2), (canvas/2) + (shapeSize/2), shapeSsize);
}

public void sierpinski (int x, int y, int len) {
  if (len <= baseCase) {
    triangle(x, y, x + len/2, y - len, x + len, y);
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x+len/2, y, len/2);
    sierpinski(x+len/4, y-len/2, len/2);
  }
}

public void mousePressed(){
  if (mouseButton == LEFT && baseCase > 5) {
    baseCase = baseCase / 2;
    chosenColor = colors[(int)(Math.random()*3)];
  } else if (mouseButton == RIGHT && baseCase < 500) {
    baseCase = baseCase * 2;
    chosenColor = colors[(int)(Math.random()*3)];
  }
}
