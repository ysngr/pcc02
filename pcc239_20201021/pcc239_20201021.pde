/* 239_20201021 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(0);

  for ( int i = 0; i < 100; i++ ) {
    flow(random(width), random(height), (int)random(400, 1000));
  }
  for ( int i = 0; i < 24; i++ ) {
    eye(random(width), random(height), random(50, 200));
  }
  for ( int i = 0; i < 100; i++ ) {
    dcircle(random(width), random(height), random(6, 70));
  }
}


void flow(float cx, float cy, int n) {

  float x, y, a, t, sw;

  x = cx;
  y = cy;
  a = 1.2;
  sw = 3;

  if ( random(100) < 1 ) {
    noiseSeed((long)random(9999));
  }
  stroke(191, 6, 34, 80);

  for ( int i = 0; i < n; i++ ) {
    if ( x < 0 || width <= x || y < 0 || height <= y ) {
      break;
    }
    strokeWeight(sw);
    point(x, y);
    t = 15 * noise(x/width, y/height);
    x += a * cos(t);
    y += a * sin(t);
    sw += random(0.01);
  }

  return ;
}


void eye(float x, float y, float d) {

  noStroke();
  fill(220);
  circle(x, y, d);
  fill(( random(2) < 1 )? color(90, 162, 206) : color(232, 66, 33));
  circle(x, y, 0.6*d);
  fill(0);
  circle(x, y, 0.4*d);
  fill(220);
  circle(x+d/4*cos(-PI/4), y+d/4*sin(-PI/4), d/5);

  return ;
}


void dcircle(float x, float y, float r) {

  final float dt = TWO_PI / (int)random(24, 40);

  float tr, sw, dx, dy;

  strokeWeight(1);
  stroke(184, 27, 48, 240);
  fill(184, 27, 48, 240);

  beginShape();
  for ( float t = 0; t < TWO_PI+dt; t += dt ) {
    tr = (( random(10) < 1 )? random(1.2, 2.4) : random(0.8, 1.2)) * r;
    curveVertex(x+tr*cos(t), y+tr*sin(t));
    t += dt;
    curveVertex(x+r*cos(t), y+r*sin(t));
  }
  endShape(CLOSE);

  for ( int i = 0; i < 5; i++ ) {
    sw = random(4);
    strokeWeight(sw);
    dx = r * random(-1, 1);
    dy = random(40, 80);
    if ( random(10) < 8 ) {
      line(x+dx, y, x+dx, y+dy);
      if ( random(3) < 1 ) {
        ellipse(x+dx, y+dy, 0.7*sw, 2.0*sw);
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("239.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
