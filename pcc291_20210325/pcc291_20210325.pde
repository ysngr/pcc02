/* 291_20210325 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(128);
  for ( int i = 0; i < 12; i++ ) {
    dcircle(random(width), random(height), random(400, 1000));
  }
  bwave();
  for ( int i = 0; i < 20; i++ ) {
    dcircle(random(width), random(height), random(600, 1000));
  }
}


void bwave() {

  final float A = 100;

  stroke(128, 100);

  for ( float h = -A; h < height+A; h += 2 ) {
    for ( float w = 0; w < width; w++ ) {
      point(w, h+A*(noise(10*w/width, 10*h/height)-0.5));
    }
  }

  return ;
}


void dcircle(float x, float y, float d) {

  final color[] cs = {
    color(252, 229, 232), 
    color(251, 224, 216), 
    color(238, 185, 175), 
    color(227, 213, 192), 
    color(253, 237, 228), 
    color(251, 230, 239), 
    color(206, 172, 155), 
    color(179, 173, 138), 
    color(144, 160, 125)
  };

  color c = cs[(int)random(cs.length)];

  noStroke();

  for ( float r = 0; r < d/2; r++ ) {
    fill(c, map(r, 0, d/2, 1, 6));
    circle(x, y, r);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("291.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
