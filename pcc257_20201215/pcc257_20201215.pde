/* 257_20201215 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(45, 44, 45);
  for ( int i = 0; i < 38; i++ ) {
    recstar(random(width), random(height), random(20, 100));
  }
}


void recstar(float x, float y, float r) {

  float nr, t;

  if ( r < 2 ) {
    return ;
  }

  pushMatrix();
  translate(x, y);

  star(0, 0, r);
  for ( int i = 0; i < 7; i++ ) {
    nr = random(1, 4) * r;
    t = random(-PI, PI);
    recstar(nr*cos(t), nr*sin(t), random(0.1, 0.4)*r);
  }

  popMatrix();

  return ;
}


void star(float x, float y, float sr) {

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

  float r, t;

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));

  noStroke();
  fill(cs[(int)random(cs.length)], 100);

  beginShape();
  for ( t = 0; t < TWO_PI; t += PI/128 ) {
    r = sr / cos((acos(sin(5*t))-TWO_PI) / 5);
    vertex(r*cos(t), r*sin(t));
  }
  endShape(CLOSE);

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("257.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
