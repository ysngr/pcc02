/* 234_20201007 */

final color[] cs = {
  color(  0, 132, 168), 
  color( 56, 158, 169), 
  color(243, 239, 227), 
  color(240, 244, 228), 
  color(247, 244, 240), 
  color( 72, 120, 127), 
  color(158, 181, 210), 
  color(184, 203, 191), 
  color(206,   4,   4, 160)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(235, 239, 244);

  for ( int i = 0; i < 240; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(-PI, PI));
    growingArc(0, 0, random(60, 240), random(60, 240), random(-PI, 0), random(0, PI));
    popMatrix();
  }
  for ( int i = 0; i < 12; i++ ) {
    orbit(random(width), random(height), 1200, 1200);
  }
}


void growingArc(float x, float y, float w, float h, float st, float et) {

  float dt;
  int n = (int)random(10, 20);

  strokeWeight(random(1, 3));
  stroke(cs[(int)random(cs.length)]);
  noFill();

  for ( int i = 0; i < n; i++ ) {
    arc(x, y, w, h, st, et);
    x += random(-1, 1);
    y += random(-1, 1);
    w += random(-2, 2);
    h += 6;
    dt = random(-1, 1) * PI/8;
    st += dt;
    et += dt;
  }

  return ;
}


void orbit(float x, float y, float w, float h) {

  float dx, dy, dw, dh;

  strokeWeight(random(2, 4));
  stroke(cs[(int)random(cs.length)]);
  noFill();

  dx = 2 * random(-1, 1);
  dy = 2 * random(-1, 1);
  dw = 6 * random(-1, 1);
  dh = 6 * random(-1, 1);

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
    saveFrame("234.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
