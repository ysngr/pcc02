/* 280_20210311 */

PVector[][] ps;


void setup() {
  size(1150, 800);
  noLoop();
  initPoints();
}


void initPoints() {

  final float L = 50;

  ps = new PVector[(int)(height/L)][(int)(width/L)];

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j] = new PVector(j*L, i*L, L);
    }
  }

  return ;
}


void draw() {
  background(240);
  drawArcs(3);
  drawRandArcs(150);
}


void drawArcs(int n) {

  boolean b;

  for ( int i = 0; i < n; i++ ) {
    b = i % 2 == 1;
    for ( int j = 0; j < ps.length; j++ ) {
      for ( int k = 0; k < ps[i].length; k++ ) {
        partArc(getPosition(j, k, b), ps[j][k].z);
      }
    }
  }

  return;
}


void drawRandArcs(int n) {

  boolean b = (int)random(2) % 2 == 0;

  for ( int i = 0; i < n; i++ ) {
    partArc(getPosition(b), random(80, 240));
  }

  return ;
}


PVector getPosition(boolean b) {

  int i = (int)random(ps.length);
  int j = (int)random(ps[i].length);

  return getPosition(i, j, b);
}

PVector getPosition(int i, int j, boolean b) {

  PVector p;
  float l;

  i = (int)random(ps.length);
  j = (int)random(ps[i].length);
  p = ps[i][j];
  l = b? ps[i][j].z : 0;

  return new PVector(p.x+random(-1, 1)*l, p.y+random(-1, 1)*l);
}


void partArc(PVector cp, float l) {

  final color[] cs = {
    color(159,  33,  88), 
    color(120,  34,  85), 
    color(165, 132, 144), 
    color(236, 209, 191), 
    color(187,  85,  72), 
    color(  0, 125, 142), 
    color(107,  81,  70), 
    color( 75,  26,  71), 
    color(220, 211, 178)
  };
  final float[] ts = {0, HALF_PI, PI, 3*HALF_PI};
  final float dt = PI / 512;

  float st = ts[(int)random(ts.length)];
  float sw = random(2, 8);
  float dsw = random(0.05);

  pushMatrix();
  translate(cp.x+l/2, cp.y+l/2);

  stroke(cs[(int)random(cs.length)], 10);

  for ( float t = st; t < st+HALF_PI; t += dt ) {
    strokeWeight(sw);
    point(l*cos(t), l*sin(t));
    sw += dsw;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("280.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
