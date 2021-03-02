/* 267_20210302 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 120; i++ ) {
    ncline(random(height), random(4));
  }
}


void ncline(float h, float dw) {

  final color[] cs = {
    color(215,  16, 113), 
    color(181,  82, 128), 
    color(246, 239, 242), 
    color(209,  47,  72), 
    color(235, 230, 182), 
    color(234, 191, 118), 
    color(255, 253, 232), 
    color(101, 147,  84), 
    color(231, 238, 243)
  };
  final float AH = 10;

  float d, s;

  strokeWeight(random(3));
  stroke(cs[(int)random(cs.length)], random(80, 160));
  noFill();

  d = random(10, 60);
  s = random(100);

  for ( float w = 0; w < width; w += dw ) {
    circle(w, h, d);
    h += AH * (noise(s, h/height) - 0.5);
    d += random(-1, 1) * dw;
    s += 0.01;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("267.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
