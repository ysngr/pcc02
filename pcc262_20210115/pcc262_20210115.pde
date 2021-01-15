/* 262_20210115 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( float r = 0, t = 0; r < 800; r++, t += PI/20 ) {
    spiral(width/2+r*cos(t), height/2+r*sin(t), map(r, 0, 800, 40, 320));
  }
}


void spiral(float x, float y, float md) {

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
  final float dt = PI / 32;

  float st, et, s, r;

  strokeWeight(1);
  stroke(cs[(int)random(cs.length)], random(200, 255));
  noFill();

  st = random(-PI, PI); 
  et = st + random(PI);
  s = ( random(2) < 1 )? 1 : -1;
  for ( float d = 0; d < md; d += random(2, 4) ) {
    arc(x, y, d, d, st, et);
    r = random(1);
    st += s * dt * (1 + r);
    et += s * dt * (1 + r);
    if ( random(2) < 1 ) {
      s *= -1;
    }
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
