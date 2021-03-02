/* 269_20210302 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  backpoints(40, 180, 100, 200, 100, 255);
  for ( int i = 0; i < 180; i++ ) {
    fdot(random(width), random(height), random(40, 160));
  }
}


void backpoints(float lr, float hr, float lg, float hg, float lb, float hb) {

  final float D = 30;

  float r, g, b, rs, gs, bs, drs, dgs, dbs;

  background(255);
  strokeWeight(0.8);
  stroke(255);

  rs = random(10);
  gs = random(10);
  bs = random(10);
  drs = random(0.1);
  dgs = random(0.1);
  dbs = random(0.1);

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( random(100) < 97 ) {
        continue;
      }
      r = map(noise(rs, w/width), 0, 1, lr, hr);
      g = map(noise(gs, h/height), 0, 1, lg, hg);
      b = map(noise(bs, w/width), 0, 1, lb, hb);
      fill(r, g, b, random(240));
      circle(w, h, D*noise(rs, gs, bs));
      rs += drs;
      gs += dgs;
      bs += dbs;
    }
  }

  return ;
}


void fdot(float x, float y, float d) {

  final color[] cs = {
    color(234,  85,  75), 
    color( 82, 177, 187), 
    color(251, 203, 103)
  };

  if ( random(5) < 1 ) {
    blendMode(SUBTRACT);
  } else {
    blendMode(BLEND);
  }

  strokeWeight(random(5));
  stroke(255, 252, 242);
  fill(cs[(int)random(cs.length)], 200);
  circle(x, y, d);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("269.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
