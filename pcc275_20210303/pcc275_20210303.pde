/* 275_20210303 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 24; i++ ) {
    beziers(random(width), random(height), random(width), random(height));
  }
}


void beziers(float sx, float sy, float ex, float ey) {

  final color[] cs = {
    color( 52, 114, 161), 
    color(  9,  86, 140), 
    color(250, 248, 240), 
    color(234, 235, 239), 
    color(205, 218, 219), 
    color(201, 194, 189), 
    color(158, 153, 130), 
    color(141, 156, 160), 
    color(161, 168, 174)
  };

  float cx, cy, dx, dy, d;

  cx = (sx + ex) / 3;
  cy = (sy + ey) / 3;
  dx = 2* (sx + ex) / 3;
  dy = 2 * (sy + ey) / 3;
  d = random(2, 15);

  stroke(cs[(int)random(cs.length)], 20);
  noFill();

  for ( int i = 0; i < 1500; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    sx += noise(sx/width) - 0.5;
    sy += noise(sy/height) - 0.5;
    cx += d * (noise(cx/width) - 0.5);
    cy += d * (noise(cy/height) - 0.5);
    dx += d * (noise(dx/width) - 0.5);
    dy += d * (noise(dy/height) - 0.5);
    ex += noise(ex/width) - 0.5;
    ey += noise(ey/height) - 0.5;
    if ( random(100) < 1 ) {
      noiseSeed((long)random(9999));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("275.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
