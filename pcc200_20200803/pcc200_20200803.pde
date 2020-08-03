/* 200_20200803 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(98, 144, 177);
  blood(30);
  rects(120);
  blood(20);
  decircles(40);
  rects(20);
}


void decircles(int n) {

  final color[] cs = {
    color(160, 216, 239), 
    color(250, 250, 245)
  };

  float x, y, d;

  noStroke();
  for ( int i = 0; i < n; i++ ) {
    x = random(width);
    y = random(height);
    d = random(140, 160);
    fill(cs[(int)random(cs.length)], 6);
    for ( float r = d; r > 0.4*d; r -= random(1, 2) ) {
      circle(x+random(-1, 1), y+random(-1, 1), 2*r);
    }
  }

  return ;
}


void rects(int n) {

  final color[] cs = {
    color(163, 214, 206), 
    color(100, 187, 186), 
    color( 63, 171, 155), 
    color(133, 203, 191), 
    color(165, 213, 183), 
    color( 89, 188, 157), 
    color(100, 157, 112)
  };

  noStroke();
  for ( int i = 0; i < n; i++ ) {
    fill(cs[(int)random(cs.length)], random(40, 120));
    square(random(width), random(height), random(40, 80));
  }

  return ;
}


void blood(int n) {

  for ( int i = 0; i < n; i++ ) {
    dcircle(random(width), random(height), random(2, 12));
  }

  return ;
}


void dcircle(float x, float y, float r) {

  final float dt = TWO_PI / (int)random(30, 40);

  float tr, dx;

  stroke(184, 27, 48, 240);
  fill(184, 27, 48, 240);

  beginShape();
  for ( float t = 0; t < TWO_PI+dt; t += dt ) {
    tr = 1.32*r;
    curveVertex(x+tr*cos(t), y+tr*sin(t));
    t += dt;
    curveVertex(x+r*cos(t), y+r*sin(t));
  }
  endShape(CLOSE);

  strokeWeight(1);
  for ( int i = 0; i < 5; i++ ) {
    dx = r * random(-1, 1);
    if ( random(10) < 7 ) {
      line(x+dx, y, x+dx, y+random(50));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("200.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
