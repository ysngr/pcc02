/* 238_20201019 */

final color[] cs = {
  color(227, 236, 244), 
  color(112, 148, 192), 
  color( 56,  90, 158), 
  color(234, 235, 235), 
  color(212, 212, 211), 
  color( 51,  49, 115), 
  color(232, 211, 207), 
  color(204, 104, 117), 
  color(164, 125,  90)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(227, 236, 244);
  
  bcircles(575, 400, 800);
  for ( int i = 0; i < 10; i++ ) {
    bcircles(random(width), random(height), random(280, 360));
  }
  for ( int i = 0; i < 40; i++ ) {
    bcircles(random(width), random(height), random(100, 180));
  }
  for ( int i = 0; i < 10; i++ ) {
    orbit(random(width), random(height), 1200, 1200);
  }
}


void bcircles(float x, float y, float d) {

  float r, dx, dy, w, h;
  int n;

  noStroke();
  fill(cs[(int)random(cs.length)], 100);
  circle(x, y, d);

  noStroke();
  n = (int)random(8, 30);
  r = d / 2;
  for ( int i = 0; i < n; i++ ) {
    fill(cs[(int)random(cs.length)], random(200, 240));
    dx = random(-1, 1) * d / 4;
    dy = random(-1, 1) * d / 4;
    r *= random(0.8, 1.0);
    circle(x+dx, y+dy, r);
  }

  noFill();
  n = (int)random(1, 4);
  for ( int i = 0; i < n; i++ ) {
    strokeWeight(random(2.4, 3.2));
    stroke(cs[(int)random(cs.length)]);
    dx = random(-1, 1) * d / 8;
    dy = random(-1, 1) * d / 8;
    w = random(0.6, 1.2) * d;
    h = random(0.6, 1.2) * d;
    ellipse(x+dx, y+dy, w, h);
  }

  return ;
}


void orbit(float x, float y, float w, float h) {

  float dx, dy, dw, dh;

  strokeWeight(random(2, 4));
  stroke(cs[(int)random(cs.length)]);
  noFill();

  dx = 4 * random(-1, 1);
  dy = 4 * random(-1, 1);
  dw = 12 * random(-1, 1);
  dh = 12 * random(-1, 1);

  for ( int i = 0; i < 6; i++ ) {
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
    saveFrame("238.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
