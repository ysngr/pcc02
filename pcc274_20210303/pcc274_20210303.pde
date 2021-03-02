/* 274_20210303 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  recCircle(0.9*width, 0.9*height, 600);
}


void recCircle(float x, float y, float d) {

  final color[] cs = {
    color(215,   0,  58), 
    color(103,  65, 150), 
    color( 97,  92, 102), 
    color( 19,   0,  18), 
    color(241, 141,   0), 
    color(249, 248, 248), 
    color(236, 104,   0), 
    color(250, 213, 214), 
    color(246, 173,  72)
  };

  if ( d < 5 ) {
    return ;
  }

  strokeWeight(d/100);
  stroke(cs[(int)random(cs.length)]);
  fill(cs[(int)random(cs.length)], 200);
  circle(x, y, d);

  int n = (int)random(4, 10);
  float r, t;

  for ( int i = 0; i < n; i++ ) {
    r = random(0.8, 1.6) * d / 2;
    t = random(PI-PI/6, 3*PI/2+PI/6);
    recCircle(x+r*cos(t), y+r*sin(t), random(0.3, 0.7)*d);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("274.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
