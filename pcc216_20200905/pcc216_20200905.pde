/* 216_20200905 */

final color[] cs = {
  color(205, 223, 233), 
  color(159, 192, 207), 
  color(136, 160, 203), 
  color(244, 243, 236), 
  color(254, 236, 204), 
  color(252, 227, 205), 
  color(217, 113, 105), 
  color(196,  83,  78)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(242, 241, 245);
  translate(width/2, height/2);
  rotate(PI/6);

  for ( int i = 0; i < 8; i++ ) {
    decircle(random(-width/2, width/2), random(-height/2, height/2), random(180, 240));
  }

  float r = 120;
  for ( float t = 0; t < 2*TWO_PI; t += PI/random(6, 12) ) {
    if ( random(10) < 1 ) {
      continue;
    }
    if ( random(2) < 1 ) {
      hdecircle(r*cos(t), r*sin(t), random(60, 80));
    } else {
      hcircle(r*cos(t), r*sin(t), random(80, 120));
    }
    r += random(20);
  }
}


void hdecircle(float x, float y, float r) {

  final float D = 0.5;
  
  float a, dx, dy;
  color c;

  a = random(80, 120);
  dx = D * random(-1, 1);
  dy = D * random(-1, 1);
  c = cs[(int)random(cs.length)];

  strokeWeight(0.8);
  noFill();

  while ( a > 0 ) {
    stroke(c, a);
    circle(x, y, r);
    a -= random(1);
    x += dx;
    y += dy;
    r += 2 * mag(dx, dy);
  }
  
  return ;
}


void hcircle(float x, float y, float r) {

  float dr, dt;

  noStroke();
  fill(cs[(int)random(cs.length)], random(180, 240));

  beginShape();
  for ( float t = 0; t < TWO_PI; t += PI / 1024 ) {
    vertex(x+r*cos(t), y+r*sin(t));
  }
  dr = random(0.4, 0.8) * r;
  dt = random(-PI, PI);
  beginContour();
  x += (r - dr) * cos(dt);
  y += (r - dr) * sin(dt);
  for ( float t = TWO_PI; t > 0; t -= PI / 1024 ) {
    vertex(x+dr*cos(t), y+dr*sin(t));
  }
  endContour();
  endShape(CLOSE);

  return ;
}


void decircle(float x, float y, float r) {

  final float D = 2;

  int idx = (int)random(cs.length);

  strokeWeight(2);
  noStroke();

  while ( r > 0 ) {
    fill(cs[idx], 4);
    circle(x+D*random(-1, 1), y+D*random(-1, 1), 2*r);
    r -= random(0.2, 0.8);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("216.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
