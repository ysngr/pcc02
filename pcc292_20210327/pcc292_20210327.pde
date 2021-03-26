/* 292_20210327 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( float r = 0, t = 0; r < 400; r += random(2), t += PI / random(5, 8) ) {
    arcs(width/2+r*cos(t), height/2+r*sin(t), map(r, 0, 400, 20, 200));
  }
}


void arcs(float x, float y, float d) {

  final color[] cs = {
    color( 39,  43,  87), 
    color( 38,  55, 130), 
    color( 84, 122, 170), 
    color(200, 211, 221), 
    color( 79,  94, 117), 
    color( 45,  44,  45), 
    color(233,  77,  71), 
    color(237, 111,   0), 
    color(251, 203, 114)
  };
  final float dt = PI / 64;

  int n = (int)random(200, 1200);
  float st = random(-PI, PI);
  float et = st + random(PI);

  stroke(cs[(int)random(cs.length)], random(20));
  noFill();

  for ( int i = 0; i < n; i++ ) {
    arc(x, y, d, d, st, et);
    x += random(-1, 1);
    y += random(-1, 1);
    st += random(-1, 1) * dt;
    et += random(-1, 1) * dt;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("292.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
