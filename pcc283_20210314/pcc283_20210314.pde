/* 283_20210314 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);
  for ( int i = 0; i < 80; i++ ) {
    narch(random(width), random(width), random(height), random(height));
  }
}


void narch(float sx, float ex, float sy, float ey) {

  final color[] cs = {
    color(184,  27,  48), 
    color( 17,   6,  10), 
    color(206, 182,  88), 
    color(202,  70,  73), 
    color( 78,  73,  82), 
    color(220, 210, 169), 
    color(105,   0,  34), 
    color(215, 210, 220), 
    color(  5,  79, 135)
  };
  final float A = 160;

  float dx, dy;

  dx = (ex - sx) / abs(ex - sx);
  dy = (ey - sy) / abs(ey - sy);

  noiseSeed((long)random(9999));
  strokeWeight(0.7);
  stroke(cs[(int)random(cs.length)], 120);

  for ( float y = sy; y < ey; y += dy ) {
    for ( float x = sx; abs(ex-x) > 2; x += dx ) {
      point(x, y+A*(noise(10*x/width, 10*y/height)-0.5));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("283.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
