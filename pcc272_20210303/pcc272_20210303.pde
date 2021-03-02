/* 272_20210303 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(200);
  for ( int i = 0; i < 24; i++ ) {
    bsquare(random(width), random(height), random(40, 180));
  }
  backnoise();  
  for ( int i = 0; i < 12; i++ ) {
    bsquare(random(width), random(height), random(40, 180));
  }
}


void backnoise() {

  float x, y, n;

  noiseSeed(0);
  strokeWeight(1.8);
  stroke(170, 64, 49);

  for ( int i = 0; i < 600; i++ ) {
    x = random(width);
    y = random(height);
    for ( int j = 0; j < 1000; j++ ) {
      point(x, y);
      n = 32 * noise(x/width, y/height);
      x += 2 * cos(n);
      y += 2 * sin(n);
    }
  }

  return ;
}


void bsquare(float x, float y, float l) {

  final color[] cs = {
    color(116, 143,  95), 
    color( 97, 104,  53), 
    color( 92,  87,  50), 
    color(132, 141, 127), 
    color( 28,  73,  54), 
    color( 52,  55,  52), 
    color(210, 105,  52), 
    color(175,  78,  33), 
    color(230, 230, 212)
  };

  int n = (int)random(32);
  float dt = PI / random(128, 256);
  float sw;

  noFill();
  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));

  for ( int i = 0; i < n; i++ ) {
    sw = random(1, 4);
    strokeWeight(sw);
    stroke(cs[(int)random(cs.length)]);
    square(0, 0, l);
    l += 2 * sw;
    rotate(dt);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("272.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
