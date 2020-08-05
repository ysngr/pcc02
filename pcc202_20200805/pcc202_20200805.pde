/* 202_20200805 */

final color[] cs = {
  color(  0,  98, 177), 
  color(  4,  34, 117), 
  color(106, 160, 214)
};
final float LEN = 25; 
final float D = LEN / 2;
final int INVALID = -1;

PVector[][] ps;


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(255);
  initPoints();
  tiling();
  drop();
  cline();
}


void initPoints() {

  float w, h;

  ps = new PVector[(int)(height/LEN)][(int)(width/LEN)];

  h = 0;
  for ( int i = 0; i < ps.length; i++ ) {
    w = 0;
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j] = new PVector(w, h, (int)random(cs.length));
      w += LEN;
    }
    h += LEN;
  }

  return ;
}


void tiling() {

  noStroke();
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      fill(cs[(int)ps[i][j].z]);
      square(ps[i][j].x, ps[i][j].y, LEN);
    }
  }

  return ;
}


void drop() {

  float x, y, r;

  blendMode(ADD);
  for ( int i = 0; i < 10; i++ ) {
    x = random(width);
    y = random(height); 
    r = random(60, 120);
    fill(160, 216, 239, random(80, 240));
    circle(x, y, 2*r);
    for ( int j = 0; j < ps.length; j++ ) {
      for ( int k = 0; k < ps[j].length; k++ ) {
        if ( dist(x, y, ps[j][k].x+D, ps[j][k].y+D) <= r ) {
          ps[j][k].z = INVALID;
        }
      }
    }
  }

  blendMode(BLEND);
  for ( int i = 0; i < 3; i++ ) {
    fill(232, 56, 40, 220);
    circle(random(width), random(height), random(100, 160));
    fill(248, 181, 0, 220);
    circle(random(width), random(height), random(100, 160));
  }

  return ;
}


void cline() {

  final float R = 0.2 * LEN;

  strokeWeight(2);
  stroke(252, 252, 250, 220);
  fill(252, 252, 250, 220);

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      if ( i != 0 && ps[i-1][j].z == ps[i][j].z && ps[i][j].z != INVALID ) {
        circle(ps[i-1][j].x+D, ps[i-1][j].y+D, R);
        circle(ps[i][j].x+D, ps[i][j].y+D, R);
        bline(ps[i-1][j].x+D, ps[i-1][j].y+D, ps[i][j].x+D, ps[i][j].y+D);
        fill(252, 252, 250);
      }
      if ( j != 0 && ps[i][j-1].z == ps[i][j].z && ps[i][j].z != INVALID ) {
        circle(ps[i][j-1].x+D, ps[i][j-1].y+D, R);
        circle(ps[i][j].x+D, ps[i][j].y+D, R);
        bline(ps[i][j-1].x+D, ps[i][j-1].y+D, ps[i][j].x+D, ps[i][j].y+D);
        fill(252, 252, 250);
      }
    }
  }

  return;
}


void bline(float sx, float sy, float ex, float ey) {

  float d = dist(sx, sy, ex, ey) / 2;

  noFill();
  bezier(
    sx                , sy                , 
    sx+random(-1, 1)*d, sy+random(-1, 1)*d, 
    ex-random(-1, 1)*d, ey-random(-1, 1)*d, 
    ex                , ey
  );

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("202.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
