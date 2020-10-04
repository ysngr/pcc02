/* 232_20201004 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(238, 235, 221);
  
  for ( int i = 0; i < 10; i++ ) {
    spiralPlate(random(0.5, 0.9)*width, random(0.1, 0.9)*height, random(240, 420), true);
  }
  for ( int i = 0; i < 3; i++ ) {
    spiralPlate(random(0.1, 0.3)*width, random(0.3, 0.7)*height, random(240, 360), false);
  }
}


void spiralPlate(float x, float y, float d, boolean colsel) {

  final color[] cs1 = {
    color(208, 194, 183), 
    color(137, 144, 135), 
    color(214, 176,  93), 
    color(179, 134,  51), 
    color(149,  91,  53), 
    color( 66,  55,  49), 
    color( 63,  74,  62), 
    color(  0,  36,  59)
  };
  final color[] cs2 = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 68,  81,  54), 
    color( 33,  22,  10), 
    color(255, 240, 193), 
    color(240, 208, 129), 
    color(231, 168,  73), 
    color( 33,  22,  10)
  };

  float sx, sy, cx, cy, dx, dy, ex, ey, r, sr, er, cr, dr, t, ct, dt;
  color[] cs = colsel ? cs1 : cs2;

  pushMatrix();
  translate(x, y);
  stroke(238, 235, 221);
  noiseSeed((long)random(9999));

  for ( int i = 0; i < 80; i++ ) {
    r = d / 2;
    t = random(-PI, PI);
    sr = r * map(noise(t), 0, 1, -0.1, 0.10);
    cr = r * map(noise(t), 0, 1, 0.10, 0.50);
    dr = r * map(noise(t), 0, 1, 0.50, 0.80);
    er = r * map(noise(t), 0, 1, 0.80, 1.00);
    ct = t + (noise(cr*cos(t)/50, cr*sin(t)/50) - 0.5) * PI;
    dt = t + (noise(dr*cos(t)/50, dr*sin(t)/50) - 0.5) * PI;
    sx = sr * cos(t);
    sy = sr * sin(t);
    cx = cr * cos(ct);
    cy = cr * sin(ct);
    dx = dr * cos(dt);
    dy = dr * sin(dt);
    ex = er * cos(t);
    ey = er * sin(t);
    fill(cs[(int)random(cs.length)], random(220, 255));
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("232.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
