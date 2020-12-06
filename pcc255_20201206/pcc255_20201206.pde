/* 255_20201206 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  initPoints();
  bezierNet();
  cdots();
}


void initPoints() {

  ps = new PVector[20];
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height));
  }

  return ;
}


void bezierNet() {

  final color[] cs = {
    color(208,  15,  49), 
    color( 33,  22,  10), 
    color(185, 188, 176), 
    color(230, 230, 230), 
    color(177, 196, 203), 
    color(201, 202, 202), 
    color(159, 160, 160), 
    color( 89,  87,  87), 
    color( 54,  82, 110), 
    color( 53, 108, 156), 
    color( 66, 123, 191)
  };

  int n;
  float d, cx, cy, dx, dy;

  noFill();

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i+1; j < ps.length; j++ ) {
      stroke(cs[(int)random(cs.length)]);
      n = (int)random(10, 30);
      d = random(5, 25);
      cx = (ps[i].x + ps[j].x) / 3;
      cy = (ps[i].y + ps[j].y) / 3;
      dx = 2 * (ps[i].x + ps[j].x) / 3;
      dy = 2 * (ps[i].y + ps[j].y) / 3;
      for ( int k = 0; k < n; k++ ) {
        bezier(ps[i].x, ps[i].y, cx, cy, dx, dy, ps[j].x, ps[j].y);
        cx += d * random(-1, 1);
        cy += d * random(-1, 1);
        dx += d * random(-1, 1);
        dy += d * random(-1, 1);
      }
    }
  }

  return ;
}


void cdots() {

  noStroke();

  blendMode(DIFFERENCE);
  for ( int i = 0; i < 6; i++ ) {
    fill(random(128, 255));
    circle(random(width), random(height), random(240, 320));
  }

  blendMode(BLEND);
  for ( int i = 0; i < 48; i++ ) {
    fill(random(255), random(60, 80));
    circle(random(width), random(height), random(10, 40));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("255.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
