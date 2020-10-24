/* 240_20201024 */

final color BGC = color(33, 22, 10);
final color[] cs = {
  color(218,  65,  72), 
  color(208,  15,  49), 
  color(165,  26,  41), 
  color( 68,  81,  54), 
  color(255, 240, 193), 
  color(240, 208, 129), 
  color(231, 168,  73)
};


void setup() {
  size(1150, 800);
  noLoop();
  blendMode(LIGHTEST);
  textAlign(CENTER, CENTER);
  textFont(createFont("HGS教科書体", 16));
  rectMode(CENTER);
}


void draw() {
  background(BGC);
  writeCchars();
  drop();
  dsquares();
}


void writeCchars() {

  final String s = "前望舒役先駆兮後飛廉役奔属鸞凰為余先戒兮雷師告余以未具吾令鳳鳥飛黱兮継之以日夜瓢風屯其相離兮師雲霓而来御紛総総其離合兮斑陸離其上下吾令帝閽開関兮倚閶闔而望予";

  for ( int i = 0; i < s.length(); i++ ) {
    for ( int j = 0; j < 2; j++ ) {
      fill(cs[(int)random(cs.length)]);
      textSize(random(64, 128));
      text(s.charAt(i), random(width), random(height));
    }
  }

  return ;
}


void drop() {

  color c;

  strokeWeight(1.2);

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( random(20) < 1 && (c = get(w, h)) != color(BGC) ) {
        stroke(c);
        if ( random(10) < 8 ) {
          line(w, h, w, h+random(10, 25));
        }
        if ( random(10) < 1 ) {
          line(w, h, w+50*random(-1, 1), h);
        }
      }
    }
  }

  return ;
}


void dsquares() {

  blendMode(DIFFERENCE);
  strokeWeight(5);

  for ( int i = 0; i < 14; i++ ) {
    stroke(cs[(int)random(cs.length)]);
    fill(cs[(int)random(cs.length)]);
    square(random(width), random(height), random(120, 320));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("240.png");
    exit();
  } else if ( key == 'r' ) {
    blendMode(LIGHTEST);
    redraw();
  }
}
