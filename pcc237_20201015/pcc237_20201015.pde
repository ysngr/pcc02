/* 237_20201015 */

final color[] cs = {
  color(218,  65,  72), 
  color(208,  15,  49), 
  color(165,  26,  41), 
  color( 68,  81,  54), 
  color( 33,  22,  10), 
  color(255, 240, 193), 
  color(240, 208, 129), 
  color(231, 168,  73)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(33, 22, 10);
  
  blendMode(BLEND);
  for ( int i = 0; i < 100; i++ ) {
    flow(random(width), random(height), (int)random(400, 1800));
  }
  blendMode(ADD);
  for ( int i = 0; i < 18; i++ ) {
    spolygon(random(width), random(height), random(30, 240));
  }
}


void spolygon(float x, float y, float r) {

  float dt, a, s;
  int idx;

  dt = PI / (int)random(3, 5);
  a = random(80, 120); 
  s = ( random(2) < 1 )? 1 : -1;
  idx = (int)random(cs.length);

  strokeWeight(1);
  noFill();
  noiseSeed((long)random(9999));

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  for ( int i = 0; i < 120; i++ ) {
    rotate(s*PI/random(256, 512));
    stroke(cs[idx], a);
    beginShape();
    for ( float t = 0; t < TWO_PI; t += dt ) {
      vertex(r*cos(t), r*sin(t));
    }
    endShape(CLOSE);
    r += 0.75;
    if ( a-- < 0 ) {
      break;
    }
  }
  popMatrix();

  return ;
}


void flow(float cx, float cy, int n) {

  float x, y, a, t, sw;

  x = cx;
  y = cy;
  a = 1.2;
  sw = 1;

  if ( random(80) < 1 ) {
    noiseSeed((long)random(9999));
  }
  stroke(cs[(int)random(cs.length)], 120);

  for ( int i = 0; i < n; i++ ) {
    if ( x < 0 || width <= x || y < 0 || height <= y ) {
      break;
    }
    strokeWeight(sw);
    point(x, y);
    t = 14 * noise(x/300, y/300);
    x += a * cos(t);
    y += a * sin(t);
    sw += random(0.01);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("237.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
