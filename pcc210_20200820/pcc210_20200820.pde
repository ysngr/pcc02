/* 210_20200820 */

final color[] cs = {
  color(  0,  98, 177), 
  color(  0,  59, 144), 
  color( 83, 109, 154), 
  color( 10, 175, 242), 
  color(252, 252, 250), 
  color( 63, 212, 240), 
  color( 52, 200, 206), 
  color(255, 111, 128)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(237, 247, 255);
  
  for ( int i = 0; i < 32; i++ ) {
    if ( random(10) < 3 ) {
      scircle();
    } else {
      hole();
    }
  }
  rnet();
  slash();
}


void hole() {

  float x, y, r;
  color c;

  x = random(width);
  y = random(height);
  r = random(60, 180);
  c = cs[(int)random(cs.length)];

  strokeWeight(2);
  noFill();
  for ( float a = random(40, 100); a > 0; a -= random(1) ) {
    stroke(c, a);
    circle(x, y, 2*r);
    r++;
  }

  return ;
}


void scircle() {

  noStroke();
  fill(cs[(int)random(cs.length)], random(60));
  circle(random(width), random(height), random(40, 380));

  return ;
}


void rnet() {

  final color[] rcs = {
    color(247,  71,  55), 
    color(245, 132,  40), 
    color(245,  25,  50)
  };

  PVector[] ps = new PVector[16];
  float d, mind, sw;
  int mini;

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height), random(25, 40));
  }

  for ( int i = 0; i < ps.length; i++ ) {
    mind = 9999;
    mini = 0;
    for ( int j = 0; j < ps.length; j++ ) {
      if ( i == j ) {
        continue;
      }
      if ( (d = dist(ps[i].x, ps[i].y, ps[j].x, ps[j].y)) < mind ) {
        mind = d;
        mini = j;
      }
    }
    sw = random(1.8, 3.2);
    strokeWeight(sw+2.4);
    stroke(255);
    line(ps[i].x, ps[i].y, ps[mini].x, ps[mini].y);
    strokeWeight(random(1.8, 3.2));
    stroke(rcs[(int)random(rcs.length)]);
    line(ps[i].x, ps[i].y, ps[mini].x, ps[mini].y);
  }

  strokeWeight(2);
  stroke(255);
  for ( PVector p : ps ) {
    fill(rcs[(int)random(rcs.length)]);
    circle(p.x, p.y, p.z);
  }

  return ;
}


void slash() {

  stroke(255, 80);
  for ( float w = 0; w < 2*width; w += random(7) ) {
    strokeWeight(map(noise(w/200), 0, 1, 0.5, 2));
    line(w, 0, 0, w);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("210.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
