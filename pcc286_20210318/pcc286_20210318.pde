/* 286_20210318 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(33, 22, 10);
  for ( int i = 0; i < 160; i++ ) {
    eye(random(width), random(height), random(80, 320));
  }
}


void eye(float x, float y, float d) {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 79,  53,  39), 
    color( 68,  81,  54), 
    color(255, 240, 193), 
    color(240, 208, 129), 
    color(231, 168,  73)
  };

  float or, st, dt;

  for ( float r = 0; r < d/2; r += random(0.1*d) ) {
    stroke(cs[(int)random(cs.length)], random(100, 200));
    st = random(-PI, PI);
    dt = PI / random(16, 128);
    or = r + random(0.01, 0.08) * d;
    for ( float t = st; t < st+TWO_PI; t += dt ) {
      line(x+r*cos(t), y+r*sin(t), x+or*cos(t), y+or*sin(t));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("286.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
