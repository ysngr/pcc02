/* 256_20201211 */

final color[] cs = {
  color(185, 188, 176), 
  color(230, 230, 230), 
  color(177, 196, 203), 
  color(201, 202, 202), 
  color(159, 160, 160), 
  color( 89,  87,  87), 
  color( 54,  82, 110), 
  color( 53, 108, 156), 
  color( 66, 123, 191)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 20; i++ ) {
    dbcircle(random(width), random(height), random(240, 420));
  }
  for ( int i = 0; i < 90; i++ ) {
    bbezier(random(width), random(height), random(width), random(height));
  }
  for ( int i = 0; i < 15; i++ ) {
    dbcircle(random(width), random(height), random(240, 420));
  }
  for ( int i = 0; i < 10; i++ ) {
    bbezier(random(width), random(height), random(width), random(height));
  }
}


void bbezier(float sx, float sy, float ex, float ey) {

  float cx, cy, dx, dy;

  cx = (sx + ex) / random(1, 5);
  cy = (sy + ey) / random(1, 5);
  dx = (sx + ex) / random(1, 5);
  dy = (sy + ey) / random(1, 5);

  stroke(cs[(int)random(cs.length)], 60);
  noFill();
  bezier(sx, sy, cx, cy, dx, dy, ex, ey);

  return ;
}


void dbcircle(float x, float y, float d) {

  color c = cs[(int)random(cs.length)];
  float r = d / 2;
  float ir, t;
  int n;

  noStroke();
  while ( r > 0 ) {
    fill(c, 7);
    circle(x+random(-1, 1), y+random(-1, 1), 2*r);
    if ( random(5) < 1 ) {
      n = (int)random(5);
      for ( int i = 0; i < n; i++ ) {
        ir = 0.8 * r;
        t = random(-PI, PI);
        fill(cs[(int)random(cs.length)], 80);
        circle(x+ir*cos(t), y+ir*sin(t), random(2, 5));
      }
    }
    r -= random(0.75, 1.25);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("256.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
