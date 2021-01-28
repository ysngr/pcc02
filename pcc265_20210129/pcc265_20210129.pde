/* 219_20210129 */

final color[] cs = {
  color(218,  65,  72), 
  color(208,  15,  49), 
  color(165,  26,  41), 
  color( 79,  53,  39), 
  color( 68,  81,  54), 
  color(255, 240, 193), 
  color(231, 168,  73)
};


void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);

  float x, y;

  for ( int i = 0; i < 14; i++ ) {
    orbit(random(width), random(height), 1000, 1000);
  }

  for ( int i = 0; i < 28; i++ ) {
    noiseSeed((long)random(9999));
    tspiral(
      x = random(width), 
      y = random(height), 
      map(noise(x/width, y/height), 0, 1, 20, 200), 
      map(noise(y/height, y/height), 0, 1, 60, 240)
    );
  }
}


void tspiral(float x, float y, float ir, float id) {

  int n;
  float r, d;

  strokeWeight(1);
  stroke(cs[(int)random(cs.length)], random(20, 40));
  noFill();

  n = (int)random(5);

  for ( float t = 0; t < n*TWO_PI; t += PI/512 ) {
    r = ir * max(cos(noise(t, x/width, y/height)), t/(1.5*TWO_PI));
    d = id * sin(noise(t));
    circle(x+r*cos(t), y+r*sin(t), d);
  }

  return ;
}


void orbit(float x, float y, float w, float h) {

  float dx, dy, dw, dh;

  strokeWeight(random(1, 3));
  stroke(cs[(int)random(cs.length)], 160);
  noFill();

  dx = 8 * random(-1, 1);
  dy = 8 * random(-1, 1);
  dw = 12 * random(-1, 1);
  dh = 12 * random(-1, 1);

  for ( int i = 0; i < 10; i++ ) {
    ellipse(x, y, w, h);
    x += dx;
    y += dy;
    w += dw;
    h += dh;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("219.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
