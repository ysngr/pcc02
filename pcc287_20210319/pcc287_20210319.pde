/* 287_20210319 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 200; i++ ) {
    beye(random(width), random(height), random(80, 240));
  }
}


void beye(float x, float y, float d) {

  final color[] cs = {
    color(185, 188, 176), 
    color(230, 230, 230), 
    color(177, 196, 203), 
    color(201, 202, 202), 
    color(159, 160, 160), 
    color( 89,  87,  87), 
    color( 54,  82, 110), 
    color( 53, 108, 156), 
    color( 66, 123, 191)
  };
  final float WA = 5;

  float wr, or, dor, st, dt, divt;

  for ( float r = 0; r < d/2; r += random(0.01, 0.03*d) ) {
    stroke(cs[(int)random(cs.length)], random(100, 200));
    st = random(-PI, PI);
    divt = random(16, 128);
    dt = PI / divt;
    dor = random(0.01, 0.04) * d;
    for ( float t = st, rt = 0; t < st+TWO_PI; t += dt, rt += 8*dt ) {
      wr = r + WA * cos(rt); 
      or = wr + dor;
      line(x+wr*cos(t), y+wr*sin(t), x+or*cos(t), y+or*sin(t));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("287.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
