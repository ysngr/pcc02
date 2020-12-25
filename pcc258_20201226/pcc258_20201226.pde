/* 258_20201226 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(32, 22, 10);
  for ( int i = 0; i < 70; i++ ) {
    npolygon((int)random(3, 8), random(width), random(height), random(280, 400));
  }
  for ( int i = 0; i < 70; i++ ) {
    npolygon((int)random(3, 8), random(width), random(height), random(80, 240));
  }
}


void npolygon(int n, float x, float y, float rad) {

  final color[] cs = {
    color(205, 233, 233), 
    color(159, 192, 207), 
    color(136, 160, 203), 
    color(242, 241, 245), 
    color(254, 236, 204), 
    color(252, 227, 205), 
    color(217, 113, 105), 
    color(198,  83,  78)
  };
  final float dt = TWO_PI / n;

  float nr;

  stroke(cs[(int)random(cs.length)], random(4, 6));
  noFill();

  for ( float r = 0; r < rad; r += random(0.5) ) {
    beginShape();
    for ( float t = 0; t < TWO_PI; t += dt ) {
      nr = r * max(0.25, (noise(5*(x+r*cos(t))/width, 5*(y+r*sin(t))/height) - 0.1));
      vertex(x+nr*cos(t), y+nr*sin(t));
    }
    endShape(CLOSE);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("258.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
