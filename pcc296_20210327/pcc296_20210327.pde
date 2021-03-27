/* 296_20210327 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 50; i++ ) {
    beziers();
  }
}


void beziers() {

  final color[] cs = {
    color(173, 128, 175), 
    color(246, 237,  67), 
    color(244, 159,  58), 
    color( 78, 191, 213), 
    color(232,  68, 126), 
    color(182, 212,  88), 
    color(250, 250, 245), 
    color( 83,  78, 138), 
    color(  3,  20,  43)
  };

  int n;
  float sx, sy, cx, cy, dx, dy, ex, ey;

  n = (int)random(80, 400);
  sx = random(width);
  sy = random(height);
  cx = random(width);
  cy = random(height);
  dx = random(width);
  dy = random(height);
  ex = random(width);
  ey = random(height);

  stroke(cs[(int)random(cs.length)], 20);
  fill(cs[(int)random(cs.length)], 5);

  for ( int i = 0; i < n; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    sx += random(-1, 1);
    sy += random(-1, 1);
    cx += random(-1, 1);
    cy += random(-1, 1);
    dx += random(-1, 1);
    dy += random(-1, 1);
    ex += random(-1, 1);
    ey += random(-1, 1);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("296.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
