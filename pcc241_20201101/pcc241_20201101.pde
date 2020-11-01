/* 241_20201101 */

void setup() {
  size(1150, 800);
  noLoop();
  noiseSeed(5091);
}


void draw() {
  background(161, 162, 173);
  blendMode(SUBTRACT);
  for ( int i = 0; i < 14; i++ ) {
    ring(random(width), random(height), random(240, 480));
  }
  blendMode(BLEND);
  for ( int i = 0; i < 320; i++ ) {
    spiral(random(width), random(height), random(40, 60));
  }
  for ( int i = 0; i < 6; i++ ) {
    ring(random(width), random(height), random(240, 320));
  }
}


void spiral(float cx, float cy, float r) {

  final color[] cs = {
    color(220,  79,  18), 
    color(229, 129,  34), 
    color(240, 180,  70), 
    color(212,  95,  34), 
    color(252, 214, 140), 
    color(241, 143,  77), 
    color(161, 162, 173), 
    color( 73,  90,  95), 
    color( 23,  24,  21)
  };

  float t = random(-PI, PI);
  float dt = PI / random(64, 256);
  int n = (int)random(200, 800);

  strokeWeight(0.8);
  stroke(cs[(int)random(cs.length)], 80);

  for ( int i = 0; i < n; i++ ) {
    line(cx, cy, cx+r*cos(t), cy+r*sin(t));
    r += 4 * (noise(r/200) - 0.5);
    t += dt;
    cx += cos(4*cx/width);
    cy += sin(4*cy/height);
  }

  return ;
}


void ring(float x, float y, float d) {

  final float D = 10;

  float c = random(180, 255);
  int n = (int)random(5, 20);

  strokeWeight(random(2.0, 4.0));
  noFill();

  for ( int i = 0; i < n; i++ ) {
    stroke(c, random(60, 100));
    fill(c, 10);
    circle(x+D*random(-1, 1), y+D*random(-1, 1), d*random(0.8, 1.2));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("241.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
