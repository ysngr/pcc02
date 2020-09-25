/* 227_20200925 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  translate(width/2, height/2);
  float x, y, r = 80;
  for ( float t = 0; t < 5*TWO_PI; t+=PI/20 ) {
    x = r * cos(t);
    y = r * sin(t);
    noiseBezier(x, y, x+random(-200, 200), y+random(-200, 200));
    r += random(1, 2);
  }
}


void noiseBezier(float sx, float sy, float ex, float ey) {

  final color[] cs = {
    color(  0, 165, 213), 
    color( 89, 195, 225), 
    color(161, 216, 225), 
    color(161, 216, 225), 
    color( 76, 187, 180), 
    color(134, 202, 182), 
    color(230, 229, 215), 
    color( 91, 164, 105), 
    color(250, 238, 222), 
    color(247, 242, 244), 
    color(242,  79,  20)
  };

  float cx, cy, dx, dy;

  cx = (sx + ex) / 3;
  cy = (sy + ey) / 3;
  dx = 2 * (sx + ex) / 3;
  dy = 2 * (sy + ey) / 3;

  noiseSeed((long)random(9999));
  stroke(cs[(int)random(cs.length)]);
  noFill();

  for ( int i = 0; i < 80; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    cx += 40 * (noise(cx) - 0.5);
    cy += 40 * (noise(cy) - 0.5);
    dx += 40 * (noise(dx) - 0.5);
    dy += 40 * (noise(dy) - 0.5);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("227.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
