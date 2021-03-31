/* 299_20210331 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  waves(width/2, height/2, 800, 150);
  cdots(32);
  waves(width/2, height/2, 800, 20);
}


void waves(float cx, float cy, float diam, int n) {

  final color[] cs = {
    color(227, 233, 242), 
    color( 98,  14, 177), 
    color(175, 212, 230), 
    color(160, 216, 239), 
    color(158, 200, 209), 
    color( 96, 154, 161), 
    color(112, 123, 153), 
    color(153, 166, 177), 
    color(239, 227, 233)
  };

  float st, x, y, dx, dy, a, t, dt, d;

  pushMatrix();
  translate(cx, cy);

  for ( int i = 0; i < n; i++ ) {
    st = random(-PI, PI);
    x = diam * cos(st);
    y = diam * sin(st);
    dx = -cos(st);
    dy = -sin(st);
    a = random(diam/2);
    t = random(-PI, PI);
    dt = PI / random(128, 512);
    d = random(5, 20);
    rotate(random(-PI, PI));
    stroke(38, 55, 130, 100);
    fill(cs[(int)random(cs.length)], random(50, 100));
    for ( float l = 0; l < diam; l++ ) {
      circle(x, y+a*cos(t), d);
      x += dx;
      y += dy;
      t += dt;
    }
  }

  popMatrix();

  return ;
}


void cdots(int n) {

  stroke(240);
  fill(208, 15, 49, 200);

  for ( int i = 0; i < n; i++ ) {
    circle(random(width), random(height), random(20, 60));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("299.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
