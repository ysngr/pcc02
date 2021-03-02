/* 268_20210302 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(241, 239, 219);
  for ( int i = 0; i < 1200; i++ ) {
    bleaf(random(width), random(height), random(180, 400));
  }
  for ( int i = 0; i < 32; i++ ) {
    fdot(random(width), random(height), random(10, 70));
  }
}


void bleaf(float x, float y, float d) {

  final color[] cs = {
    color(205, 224, 136), 
    color(142, 186, 112), 
    color(102, 177,  79), 
    color(187, 211,  97), 
    color(161, 163, 104), 
    color(161, 163, 104), 
    color(192, 214, 207), 
    color(237, 241, 187), 
    color(212, 207, 160), 
    color(232,  56,  57), 
    color(210, 105,  52)
  };

  float t;
  float[][] ps = new float[4][2];

  for ( int i = 0; i < 4; i++ ) {
    t = random(-PI, PI);
    ps[i][0] = x + d/2 * cos(t);
    ps[i][1] = y + d/2 * sin(t);
  }

  if ( random(10) < 1 ) {
    noStroke();
    fill(cs[(int)random(cs.length)], random(80, 160));
  } else {
    strokeWeight(random(5));
    stroke(cs[(int)random(cs.length)]);
    noFill();
  }

  bezier(ps[0][0], ps[0][1], ps[1][0], ps[1][1], ps[2][0], ps[2][1], ps[3][0], ps[3][1]);

  return ;
}


void fdot(float x, float y, float d) {

  noStroke();
  fill(58, 172, 173);
  circle(x, y, d);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("268.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
