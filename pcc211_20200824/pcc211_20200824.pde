/* 211_20200824 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(20);
  initPoints();
  drawNet();
}


void initPoints() {

  float x, y, rez, imz;

  ps = new PVector[80000];

  for ( int i = 0; i < ps.length; i++ ) {
    do {
      x = random(width);
      y = random(height);
      rez = 1.6 * map(x, 0, width, -1, 1);
      imz = map(y, 0, height, 1, -1);
    } while ( isPointEscape(rez, imz) );
    ps[i] = new PVector(x, y);
  }

  return ;
}


void drawNet() {

  final float MAXD = 4.0;

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i+1; j < ps.length; j++ ) {
      if ( dist(ps[i].x, ps[i].y, ps[j].x, ps[j].y) < MAXD ) {
        stroke(
          map(noise(ps[i].x/200, ps[i].y/200), 0, 1,  80, 160), 
          map(noise(ps[j].x/200, ps[j].y/200), 0, 1, 100, 200), 
          map(noise(ps[i].x/100, ps[j].y/100), 0, 1, 200, 240)
        );
        line(ps[i].x, ps[i].y, ps[j].x, ps[j].y);
      }
    }
  }

  return ;
}


boolean isPointEscape(float rez, float imz) {

  final float rec = -0.74, imc = 0.08;

  float crez, cimz;

  for ( int i = 0; i < 100; i++ ) {
    if ( mag(rez, imz) > 4 ) {
      return false;
    }
    crez = rez;
    cimz = imz;
    rez = sq(crez) - sq(cimz) + rec;
    imz = 2 * crez * cimz + imc;
  }

  return true;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("211.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
