/* 297_20210329 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 80; i++ ) {
    darc(width/2, height/2, random(40, 760), random(40, 760));
  }
  for ( int i = 0; i < 4; i++ ) {
    darc(width/2, height/2, random(780, 1000), random(780, 1000));
  }
}


void darc(float x, float y, float w, float h) {

  final color[] cs = {
    color(218, 205, 139), 
    color(174, 154, 107), 
    color( 92, 118, 100), 
    color(  0, 126, 118), 
    color(248, 246, 222), 
    color(230, 224, 196), 
    color( 85, 125,  62), 
    color( 73,  49,  60), 
    color(235,  92,  50)
  };

  float st, dt, rw, rh, s, drw, drh;

  st = random(-PI, PI);
  dt = PI / random(16, 128);
  rw = random(8);
  rh = random(8);
  drw = random(rw) / 20;
  drh = random(rw) / 20;

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  stroke(0, 128);
  fill(cs[(int)random(cs.length)]);

  for ( float t = st; t < st+TWO_PI; t += dt ) {
    rect(w/2*cos(t), h/2*sin(t), rw, rh);
    s = ( t < t + PI )? 1 : -1;
    rw += s * drw;
    rh += s * drh;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("297.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
