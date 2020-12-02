/* 254_20201202 */

final color[] cs = {
  color(238, 235, 221), 
  color(208, 194, 183), 
  color(137, 144, 135), 
  color(214, 176,  93), 
  color(179, 134,  51), 
  color(149,  91,  53), 
  color( 66,  55,  49), 
  color( 63,  74,  62), 
  color(  0,  36,  59)
};

PVector[] ps;


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  initPoints();
  for ( int i = 0; i < 320; i++ ) {
    drawNet();
    updatePoints();
  }
}


void initPoints() {

  ps = new PVector[80];
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height), random(cs.length));
  }

  return ;
}


void drawNet() {

  final float MAXD = 200;

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i+1; j < ps.length; j++ ) {
      if ( dist(ps[i].x, ps[i].y, ps[j].x, ps[j].y) < MAXD ) {
        stroke(cs[(int)ps[i].z], 40);
        line(ps[i].x, ps[i].y, ps[j].x, ps[j].y);
      }
    }
  }

  return ;
}


void updatePoints() {

  final float A = 1.5;

  float t;

  for ( int i = 0; i < ps.length; i++ ) {
    t = TWO_PI * noise(10*ps[i].x/width, 10*ps[i].y/height);
    ps[i].x += A * cos(t);
    ps[i].y += A * sin(t);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("254.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
