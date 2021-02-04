/* 266_20210204 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  translate(width/2, height/2);
  nlines(200, 500, 800, 8);
  nlines(1000, 0, 400, 3);
}


void nlines(int n, float minr, float maxr, float w) {

  float sr, er, st, et;

  for ( int i = 0; i < n; i++ ) {
    sr = random(minr, maxr);
    st = random(-PI, PI);
    er = random(minr, maxr);
    et = random(-PI, PI);
    nline(sr*cos(st), sr*sin(st), er*cos(et), er*sin(et), random(50), w);
  }

  return ;
}


void nline(float sx, float sy, float ex, float ey, float a, float w) {

  final color[] cs = {
    color(233,  71,   9), 
    color( 39,  18,  10), 
    color(195, 170, 176), 
    color(247, 213, 179), 
    color(143, 143, 176), 
    color(165, 147, 173), 
    color(244, 179, 194), 
    color(123, 102, 103), 
    color( 77,  62,  75)
  };
  final float e = 2.0;
  final float A = 2 * TWO_PI;

  float d = dist(sx, sy, ex, ey);
  float dx = (ex - sx) / d;
  float dy = (ey - sy) / d;
  float x = sx;
  float y = sy;

  strokeWeight(random(w));
  stroke(cs[(int)random(cs.length)]);

  while ( dist(x, y, ex, ey) > e ) {
    point(x+a*sin(A*(noise(x)-0.5)), y+a*sin(A*(noise(y)-0.5)));
    x += dx;
    y += dy;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("266.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
