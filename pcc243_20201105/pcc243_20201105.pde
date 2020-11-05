/* 243_20201105 */

final color[] cs = {
  color(149, 155, 169), 
  color( 94, 101, 102), 
  color(211, 210, 191), 
  color( 36,  49,  70), 
  color( 62,  49,  70), 
  color( 62,  87, 112), 
  color(217, 117,  86), 
  color(241, 173,  95), 
  color(225, 198, 192), 
  color(224, 140, 122)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 20; i++ ) {
    fripple(random(width), random(height), random(180, 240));
  }
  blendMode(LIGHTEST);
  for ( int i = 0; i < 20; i++ ) { 
    wave();
  }
}


void fripple(float cx, float cy, float d) {

  int n = (int)random(20, 40);

  noStroke();
  fill(cs[(int)random(cs.length)], 6);

  for ( int i = 0; i < n; i++ ) {
    circle(cx, cy, (1+0.05*i)*d);
  }

  return ;
}


void wave() {

  float dx, dy, d, a, s, is;
  int n;

  dx = width/4 * random(-1, 1);
  dy = height/4 * random(-1, 1);
  d = sq(dx) + sq(dy);
  a = random(100, 200);
  is = random(1000);
  n = (int)random(5, 25);

  pushMatrix();
  translate(width/2+dx, height/2+dy);
  rotate(random(-PI, PI));

  strokeWeight(0.8);
  stroke(cs[(int)random(cs.length)]);

  for ( int i = 0; i < n; i++ ) {
    s = is;
    for ( float w = -width/2-d; w < width/2+d; w++ ) {
      point(w, a*(noise(w/500, s)-0.5));
      s += 0.001;
    }
    a += 50;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("243.png");
    exit();
  }
}
