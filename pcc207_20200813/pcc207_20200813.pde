/* 207_20200813 */

void setup() {
  size(1150, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(43, 174, 224);
  for ( int i = 0; i < 160; i++ ) {
    arcs(random(width), random(height), random(80, 200), (int)random(2, 8));
  }
  for ( int i = 0; i < 8; i++ ) {
    fill(215, 0, 58, random(160, 240));
    circle(random(width), random(height), random(40, 160));
  }
}


void arcs(float cx, float cy, float r, int n) {

  final color[] cs = {
    color(123, 159, 211), 
    color(143, 181, 224), 
    color(187, 208, 236), 
    color(235, 240, 243), 
    color(222, 231, 245), 
    color(204, 224, 244), 
    color( 74, 148, 191), 
    color( 37,  92, 142), 
    color( 78, 191, 213), 
    color(  0, 125, 142)
  };

  float x = cx, y = cy;
  float cd, sd;
  float st = random(-PI, 0);
  float et = random(0, PI);
  float dt = PI / random(256, 1024);

  for ( int i = 0; i < n; i++ ) {
    fill(cs[(int)random(cs.length)], random(80, 255));
    cd = random(10, 40);
    sd = cd;
    for ( float t = st; t < et; t += dt ) {
      circle(x+r*cos(t), y+r*sin(t), cd);
      cd -= sd / ((et-st)/dt);
    }
    r += sd / 2;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("207.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
