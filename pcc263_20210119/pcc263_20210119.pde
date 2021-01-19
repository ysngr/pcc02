/* 263_20210119 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 6; i++ ) {
    wflower(random(width), random(height), random(50, 250));
  }
}


void wflower(float cx, float cy, float d) {

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

  color c;
  float r, t, dr, dt;
  int x, y;

  c = cs[(int)random(cs.length)];
  dr = random(500, 2000);
  dt = random(800, 2400);

  for ( int i = 0; i < 1000000; i++ ) {
    if ( random(10000) < 1 ) {
      c = cs[(int)random(cs.length)];
    }
    r = d * (cos(i/dr) + i%2 + 1);
    t = tan(i/dt);
    x = (int)(cx + r*cos(t));
    y = (int)(cy + r*sin(t));
    if ( x < 0 || width < x || y < 0 || height < y ) {
      continue;
    }
    set(x, y, c);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("263.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
