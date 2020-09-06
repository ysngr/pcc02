/* 217_20200906 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(245, 245, 240);
  translate(width/2, height/2);
  rotate(-PI/6);
  translate(-width/2, -height/2);

  cline();
  for ( float w = 0; w < width; w += 4 ) {
    pcircle(w, height/2, map(noise(w/200), 0, 1, 80, 460));
  }
}


void cline() {

  final float r = 8;

  strokeWeight(5);

  for ( float w = -width/2; w < 1.5*width; w++ ) {
    stroke(9, 86, 140);
    point(w, height/2+r*cos(w/20));
    stroke(205, 218, 219);
    point(w, height/2+r*cos(w/50));
  }

  return ;
} 



void pcircle(float x, float y, float r) {

  final color[] cs = {
    color(234, 230, 192), 
    color(253, 211,  92), 
    color(202, 162,  86), 
    color(100,  70,  48), 
    color(242, 233, 114), 
    color( 54,  54,  98), 
    color( 52,  55,  58), 
    color(196, 154, 114)
  };
  final float st = PI / random(8, 20);

  strokeWeight(random(2, 6));
  stroke(cs[(int)random(cs.length)], random(120, 220));

  pushMatrix();
  translate(x, y);
  for ( float t = st; t < TWO_PI - st; t += PI / 1024 ) {
    point(r*cos(t), r*sin(t));
    if ( random(500) < 1 ) {
      t += PI / random(10, 20);
    }
  }
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("217.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
