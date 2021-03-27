/* 295_20210327 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 100; i++ ) {
    bplate(random(width), random(height), random(40, 200));
  }
}


void bplate(float cx, float cy, float l) {

  final color[] cs = {
    color(191, 198, 172), 
    color(219, 212, 184), 
    color(247, 226, 214), 
    color(237, 175, 167), 
    color(213, 112, 105), 
    color(210,  65,  71), 
    color(177, 122,  93), 
    color( 90,  80,  63), 
    color( 54,  45,  51)
  };

  PGraphics p = createGraphics((int)l, (int)l);
  int n = (int)random(1, 20);
  float[][] ps = new float[4][2];

  p.beginDraw();
  p.background(cs[(int)random(cs.length)]);
  p.noStroke();
  for ( int i = 0; i < n; i++ ) {
    p.fill(cs[(int)random(cs.length)], random(128, 255));
    ps[0] = selCornerPoint(l);
    ps[1] = selControlPoint(l);
    ps[2] = selControlPoint(l);
    ps[3] = selCornerPoint(l);
    p.bezier(ps[0][0], ps[0][1], ps[1][0], ps[1][1], ps[2][0], ps[2][1], ps[3][0], ps[3][1]);
  }
  p.endDraw();

  image(p, cx-l/2, cy-l/2);

  return ;
}


float[] selCornerPoint(float l) {

  float[] p = new float[2];

  switch( (int)random(4) ) {
  case 0:
    p[0] = 0;
    p[1] = 0;
    break;
  case 1:
    p[0] = l;
    p[1] = 0;
    break;
  case 2:
    p[0] = l;
    p[1] = l;
    break;
  case 3:
    p[0] = 0;
    p[1] = l;
    break;
  }

  return p;
}


float[] selControlPoint(float l) {

  float[] p = {random(l), random(l)};

  return p;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("295.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
