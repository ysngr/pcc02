/* 208_20200816 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  
  final int[] pqs = {2, 3};
  final float d = 180;
  
  for ( int i = 0; i < 8; i++ ) {
    torusknot(pqs[(int)random(pqs.length)], pqs[(int)random(pqs.length)], 
      random(80, 120), random(40, 80), random(width/4, width-d), random(height/2.5, height-d/2));
  }
}


void torusknot(int p, int q, float r, float s, float cx, float cy) {

  final color[] cs = {
    color( 98, 144, 177), 
    color(175, 212, 230), 
    color(160, 216, 239), 
    color(158, 200, 209), 
    color( 96, 154, 161), 
    color(112, 123, 153), 
    color(153, 166, 177), 
    color(209,  47,  72)
  };

  float x, y, d;
  color c;

  noFill();
  d = random(20, 40);
  c = cs[(int)random(cs.length)];

  for ( float t = 0; t < TWO_PI; t += PI/512 ) {
    x = (r + s*cos(p*t)) * cos(q*t);
    y = (r + s*cos(p*t)) * sin(q*t);
    stroke(c, (t < PI)? map(t, 0, PI, 30, 240) : map(t, PI, TWO_PI, 240, 30));
    circle(cx+x, cy+y, d);
    point(cx+x, cy+y);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("208.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
