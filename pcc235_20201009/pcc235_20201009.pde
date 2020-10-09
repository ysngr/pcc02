/* 235_20201009 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240, 242, 238);
  for ( int i = 0; i < 32; i++ ) {
    nbezier(random(width/6, 5*width/6), random(height/7, 6*height/7), random(width/6, 5*width/6), random(height/7, 6*height/7));
  }
}


void nbezier(float sx, float sy, float ex, float ey) {

  final color[] cs = {
    color(163, 214, 206), 
    color(100, 187, 186), 
    color( 63, 171, 155), 
    color(133, 203, 191), 
    color(165, 213, 183), 
    color( 89, 188, 157), 
    color(100, 157, 112), 
    color( 48, 128, 152), 
    color( 74, 172, 188), 
    color(234,  77,  21), 
    color(214,  85,  11)
  };
  final float D = 6;

  float cx, cy, dx, dy, divx, divy, a;
  int n, idx;

  cx = (sx + ex) / 3;
  cy = (sy + ey) / 3;
  dx = 2 * (sx + ex) / 3;
  dy = 2 * (sy + ey) / 3;
  divx = random(80, 320);
  divy = random(80, 320);
  a = random(120, 240);
  n = (int)random(20, 200);
  idx = (int)random(cs.length);

  noiseSeed((long)random(9999));
  noFill();

  for ( int i = 0; i < n; i++ ) {
    stroke(cs[idx], a);
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    sx += D * (noise(sx/divx) - 0.5);
    sy += D * (noise(sy/divy) - 0.5);
    ex += D * (noise(ex/divx) - 0.5);
    ey += D * (noise(ey/divy) - 0.5);
    if ( (a -= 1.2) < 0 ) {
      break;
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("235.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
