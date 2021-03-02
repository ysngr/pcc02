/* 271_20210303 */

void setup() {
  size(1150, 800);
  noLoop();
  strokeCap(PROJECT);
}


void draw() {
  background(240);
  for ( int i = 0; i < 100; i++ ) {
    bleaf(random(width), random(height), random(width), random(height));
  }
  for ( int i = 0; i < 64; i++ ) {
    fdot(random(width), random(height), random(20, 40));
  }
}


void bleaf(float sx, float sy, float ex, float ey) {

  final color[] cs = {
    color(106, 160, 214), 
    color(128, 139, 196), 
    color(166, 107, 165), 
    color(230, 200, 223), 
    color(194, 181, 216), 
    color(220, 216, 223), 
    color(212, 227, 165), 
    color(155, 151, 161), 
    color(106,  92, 166)
  };
  final float D = 25;

  int n = (int)random(30);
  float cx, cy, dx, dy, minx, miny, maxx, maxy;

  strokeWeight(random(1, 5));
  noFill();

  minx = min(sx, ex);
  miny = min(sy, ey);
  maxx = max(sx, sy);
  maxy = max(sy, ey);
  cx = random(minx, miny);
  cy = random(maxx, maxy);
  dx = random(minx, maxy);
  dy = random(miny, maxy);
  for ( int i = 0; i < n; i++ ) {
    stroke(cs[(int)random(cs.length)], random(120, 240));
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    cx += D * random(-1, 1);
    cy += D * random(-1, 1);
    ex += D * random(-1, 1);
    ey += D * random(-1, 1);
  }

  return ;
}


void fdot(float x, float y, float d) {

  final color[] cs = {
    color(204, 125, 177), 
    color(185,  64,  71), 
    color(216,  65, 145)
  };

  noStroke();
  fill(cs[(int)random(cs.length)], random(180, 240));
  circle(x, y, d);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("271.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
