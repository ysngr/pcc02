/* 213_20200829 */

final color[] cs = {
  color( 30,  40, 100), 
  color( 55,  80, 216), 
  color( 93, 144, 229), 
  color( 22, 105, 245), 
  color(150, 177, 252), 
  color( 65, 186, 240), 
  color( 57, 212, 216), 
  color(172, 233, 247)
};


PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(7, 59, 103);
  for ( int i = 0; i < 7; i++ ) {
    vibcircle();
  }
  for ( int i = 0; i < 5; i++ ) {
    pltcircle();
  }
  for ( int i = 0; i < 8; i++ ) {
    decircle();
  }
  slash();
  for ( int i = 0; i < 6; i++ ) {
    decircle();
  }
  for ( int i = 0; i < 5; i++ ) {
    pltcircle();
  }
  for ( int i = 0; i < 5; i++ ) {
    vibcircle();
  }
}


void vibcircle() {

  final color[] fcs = {
    color(232, 155,  77), 
    color(245,  15,  57), 
    color(216,  20, 128), 
    color(252,  18,  37)
  };
  final float D = 4;

  float x, y, r, a;
  int idx;

  x = random(width);
  y = random(height);
  r = random(60, 180);
  a = random(80, 120);
  idx = (int)random(fcs.length);

  noFill();

  while ( a > 0 && r > 0 ) {
    stroke(fcs[idx], a);
    circle(x+D*random(-1, 1), y+D*random(-1, 1), r);
    r -= random(2);
    a--;
  }

  return ;
}


void decircle() {

  final float D = 1.5;

  float x, y, r;
  int idx;

  x = random(width);
  y = random(height);
  r = random(180, 420);
  idx = (int)random(cs.length);

  noStroke();

  while ( r > 0 ) {
    fill(cs[idx], 3);
    circle(x+D*random(-1, 1), y+D*random(-1, 1), r);
    r--;
  }

  return ;
}


void pltcircle() {

  int n;
  float r, t, pt;
  boolean isLineStroke;

  n = (int)random(3, 6);
  r = random(180, 420);
  isLineStroke = false;

  pushMatrix();
  translate(random(width), random(height));

  strokeWeight(2);
  stroke(cs[(int)random(cs.length)]);

  for ( int i = 0; i < n; i++ ) {
    for ( pt = -PI/64, t = 0; t < TWO_PI; t += PI/random(32, 128) ) {
      if ( (isLineStroke = ! isLineStroke) == true ) {
        line(r*cos(t), r*sin(t), r*cos(pt), r*sin(pt));
      }
      pt = t;
    }
    r -= random(0.02, 0.08) * r;
  }

  popMatrix();

  return ;
}


void slash() {

  stroke(7, 59, 103, 20);
  for ( float w = 0; w < 2*width; w += random(5, 20) ) {
    strokeWeight(7*noise(w/200));
    line(w, 0, 0, w);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("213.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
