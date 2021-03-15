/* 284_20210315 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 48; i++ ) {
    beziers(random(width), random(height), random(width), random(height), (int)random(80, 200));
  }
}


void beziers(float sx, float sy, float ex, float ey, int n) {

  final float A = 80, DA = 3;
  final color[] cs = {
    color(234,  85,  75), 
    color( 82, 177, 187), 
    color(251, 203, 103), 
    color(175,  98, 154), 
    color(192, 184,  95), 
    color(159, 192, 141), 
    color(179, 120,  85), 
    color(150, 205, 196), 
    color(134, 107,  49)
  };

  float cx, cy, dx, dy, dsx, dsy, dex, dey;

  cx = (sx + ex) / 3 + A * random(-1, 1);
  cy = (sy + ey) / 3 + A * random(-1, 1);
  dx = 2 * (sx + ex) / 3 + A * random(-1, 1);
  dy = 2 * (sy + ey) / 3 + A * random(-1, 1);
  dsx = DA * random(-1, 1);
  dsy = DA * random(-1, 1);
  dex = DA * random(-1, 1);
  dey = DA * random(-1, 1);

  stroke(cs[(int)random(cs.length)], random(30, 80));
  noFill();

  for ( int i = 0; i < n; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    sx += dsx;
    dy += dsy;
    ex += dex;
    ey += dey;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("284.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
