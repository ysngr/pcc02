/* 289_20210320 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  flower(width/2, height/2, 800);
}


void flower(float x, float y, float d) {

  final color[] cs = {
    color( 52, 114, 161), 
    color(  9, 86, 140), 
    color(250, 248, 240), 
    color(234, 235, 239), 
    color(205, 218, 219), 
    color(201, 194, 189), 
    color(158, 153, 130), 
    color(141, 156, 160), 
    color(161, 168, 174)
  };
  final float WA = 100;

  float wr, or, dor, st, dt, divt;

  for ( float r = 0; r < d/2; r += random(0.001, 0.010*d) ) {
    stroke(cs[(int)random(cs.length)], random(60, 120));
    st = random(-PI, PI);
    divt = random(256, 1024);
    dt = PI / divt;
    dor = random(0.01, 0.04) * d;
    for ( float t = st, rt = 0; t < st+TWO_PI; t += dt, rt += 8*dt ) {
      wr = r + WA * (noise(rt) - 0.5); 
      or = wr + dor;
      line(x+wr*cos(t), y+wr*sin(t), x+or*cos(t), y+or*sin(t));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("289.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
