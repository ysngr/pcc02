/* 247_20201116 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(252, 252, 247);

  float r, t;

  for ( int i = 0; i < 20; i++ ) {
    r = random(0.2, 0.4) * width;
    t = random(-PI, PI);
    spiral(width/2+r*cos(t), height/2+r*sin(t), random(140, 280));
  }

  spiral(width/2, height/2, 800);

  for ( int i = 0; i < 60; i++ ) {
    r = random(0.3, 0.6) * width;
    t = random(-PI, PI);
    spiral(width/2+r*cos(t), height/2+r*sin(t), random(140, 280));
  }
}


void spiral(float x, float y, float d) {

  final color[] cs = {
    color(198, 183, 217), 
    color(166, 111, 167), 
    color(131,  92, 143), 
    color(242, 226, 238), 
    color(209, 172, 175), 
    color(174, 150, 165), 
    color(205, 200, 185), 
    color(211, 177, 141), 
    color(151, 129, 127)
  };
  final float dt = PI / 128;

  float r, t, s;

  noStroke();
  fill(cs[(int)random(cs.length)]);
  for ( int i = 0; i < 10; i++ ) {
    r = random(d) / 2.4;
    t = random(-PI, PI);
    circle(x+r*cos(t), y+r*sin(t), random(20, 40));
  }

  stroke(cs[(int)random(cs.length)], 180);
  fill(cs[(int)random(cs.length)], 80);
  r = 0;
  t = 0;
  s = ( random(2) < 1 )? 1 : -1;
  while ( r < d/4 ) {
    line(x+r*cos(t), y+r*sin(t), x+2*r*cos(t+dt), y+2*r*sin(t+dt));
    r += random(0.2);
    t += s * dt;
    if ( random(8) < 1 ) {
      circle(x+1.5*r*cos(t), y+1.5*r*sin(t), random(6, 24));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("247.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
