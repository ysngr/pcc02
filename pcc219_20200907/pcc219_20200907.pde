/* 219_20200907 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(242, 241, 245);
  for ( int i = 0; i < 80; i++ ) {
    ddcircle(random(width), random(height), random(40, 280));
    if ( random(8) < 1 ) {
      decircle(random(width), random(height), random(240, 380));
    }
  }
}


void ddcircle(float x, float y, float d) {

  final color[] cs = {
    color(205, 223, 233), 
    color(159, 192, 207), 
    color(136, 160, 203), 
    color(244, 243, 246), 
    color(254, 236, 204), 
    color(252, 227, 205), 
    color(217, 113, 105), 
    color(198,  83,  78)
  };

  float r, dr, t;

  noStroke();

  r = d / 2;

  while ( r > 0.02*d ) {
    fill(cs[(int)random(cs.length)]);
    circle(x, y, 2*r);
    dr = random(0.01, 0.04) * d;
    t = random(-PI, PI);
    r -= dr;
    x += dr * cos(t);
    y += dr * sin(t);
  }

  return ;
}


void decircle(float x, float y, float d) {

  float r = d / 2;

  fill(242, 241, 245, 4);

  while ( r > 0.05*d ) {
    circle(x, y, 2*r);
    r -= random(1);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("219.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
