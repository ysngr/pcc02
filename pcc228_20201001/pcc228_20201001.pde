/* 228_20201001 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(77, 62, 75);
  for ( int i = 0; i < 24; i++ ) {
    rotLineRing(random(0.3, 0.7)*width, random(0.3, 0.7)*height);
  }
}


void rotLineRing(float x, float y) {

  final color[] cs = {
    color(233,  71,   9), 
    color( 39,  18,  10), 
    color(195, 170, 176), 
    color(247, 213, 179), 
    color(143, 143, 176), 
    color(165, 147, 173), 
    color(244, 179, 194), 
    color(123, 102, 103)
  };
  final float DD = 400, D = 8;

  int n;
  float dx, dy, divx, divy;

  strokeWeight(random(1, 3));
  stroke(cs[(int)random(cs.length)], random(80, 200));
  noiseSeed((long)random(9999));

  n = (int)random(600, 1200);
  divx = random(40, 400);
  divy = random(40, 400);

  for ( int i = 0; i < n; i++ ) {
    dx = DD * (noise(x/divx) - 0.5);
    dy = DD * (noise(y/divy) - 0.5);
    line(x, y, x+dx, y+dy);
    x += D * (noise(x/80) - 0.5);
    y += D * (noise(y/80) - 0.5);
    if ( random(500) < 1 ) {
      noiseSeed((long)random(9999));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("228.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
