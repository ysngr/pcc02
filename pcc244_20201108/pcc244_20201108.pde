/* 244_20201108 */

void setup() {
  size(1150, 800);
  noLoop();
  strokeCap(PROJECT);
}


void draw() {
  background(240);
  wave();
  noisePlate(width/2, height/2, 680);
  extend();
}


void wave() {

  final float a = 200;

  strokeWeight(0.75);

  for ( float h = -a; h < height+a; h+=2.5 ) {
    for ( float w = 0; w < width; w++ ) {
      set((int)w, (int)(h+a*noise(10*w/width, 10*h/height)), color(220, 180));
    }
  }

  return ;
}


void noisePlate(float cx, float cy, float d) {

  final color[] cs = {
    color(238, 235, 221), 
    color(208, 194, 183), 
    color(137, 144, 135), 
    color(214, 176,  93), 
    color(179, 134,  51), 
    color(149,  91,  53), 
    color( 66,  55,  49), 
    color( 63,  74,  62), 
    color(  0,  36,  59)
  };

  float x, y, t;

  noiseSeed((int)random(9999));
  strokeWeight(1.2);

  pushMatrix();
  translate(cx, cy);

  for ( float h = -d/2; h < d/2; h++ ) {
    for ( float w = -d/2; w < d/2; w++ ) {
      if ( random(40) < 1 ) {
        x = w;
        y = h;
        stroke(cs[(int)random(cs.length)]);
        while ( mag(x, y) < d/2 ) {
          point(x, y);
          t = 7 * noise((x+cx)/80, (y+cy)/80);
          x += cos(t);
          y += sin(t);
        }
      }
    }
  }

  popMatrix();

  return ;
}


void extend() {

  final float L = 250;

  int x, y;

  strokeWeight(1.2);

  for ( int i = 0; i < 1000; i++ ) {
    x = (int)random(width);
    y = (int)random(height);
    stroke(get(x, y), 100);
    if ( random(2) < 1 ) {
      line(x-random(L), y, x+random(L), y);
    } else {
      line(x, y-random(L), x, y+random(L));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("244.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
