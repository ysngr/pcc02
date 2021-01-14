/* 262_20210115 */

final color[] cs = {
  color(163, 214, 206), 
  color(100, 187, 186), 
  color( 63, 171, 155), 
  color(133, 203, 191), 
  color(165, 213, 183), 
  color( 89, 188, 157), 
  color(100, 157, 112), 
  color( 48, 128, 152), 
  color( 74, 172, 188), 
  color(234,  77,  21), 
  color(214,  85,  11)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 120; i++ ) {
    spiral(random(width), random(height), random(240, 360));
  }
  for ( int i = 0; i < 20; i++ ) {
    orbit(random(width), random(height), 1000, 1000);
  }
}


void spiral(float x, float y, float md) {

  final float dt = PI / 32;

  float st, et, s;
  
  strokeWeight(1);
  stroke(cs[(int)random(cs.length)], random(200, 255));
  noFill();

  st = random(-PI, PI); 
  et = st + random(PI);
  s = ( random(2) < 1 )? 1 : -1;
  for ( float d = 0; d < md; d += random(2, 4) ) {
    arc(x, y, d, d, st, et);
    st += s * dt * random(2);
    et += s * dt * random(2);
    if ( random(10) < 1 ) {
      s *= -1;
    }
  }

  return ;
}


void orbit(float x, float y, float w, float h) {

  float dx, dy, dw, dh;

  strokeWeight(random(2));
  stroke(cs[(int)random(cs.length)], random(180, 240));
  noFill();

  dx = 2 * random(-1, 1);
  dy = 2 * random(-1, 1);
  dw = 6 * random(-1, 1);
  dh = 6 * random(-1, 1);

  for ( int i = 0; i < 10; i++ ) {
    ellipse(x, y, w, h);
    x += dx;
    y += dy;
    w += dw;
    h += dh;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("262.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
