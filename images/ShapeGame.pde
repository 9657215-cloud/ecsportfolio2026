//Hailey Price | 4 March 2026| ShapeGame
int x, y, tx, ty, score;
float tw;
PImage player,target;

void setup() {
  size (800, 800);
  x = width/2;
  y = height/2;
  tx = int(random(20, width-20));
  ty = int(random(20, width-20));
  tw = 200.0;
  score = 0;
  target = loadImage("Watermelon.png");
  player = loadImage("Penguin.png");
}


void draw() {
  background(127);
  scorePanel();
  target();
  imageMode(CENTER);
  image(player,x,y,200,200);
  
}


void target () {
  float d = dist(x, y, tx, ty);
  println(d);
  if (d<50) {
    score = score + int(tw*2);
    tx = int(random(20, width-20));
    ty = int(random(20, height-20));
    tw = 200;
  } 
  rectMode(CENTER);
  //rect(tx,ty,tw,tw);
  if(tw<10) {
  gameOver();
  }
  image(target,tx,ty);
 tw = tw-0.1;
 target.resize(int(tw), int(tw));
}

void gameOver(){
background(0);
fill(255,0,0);
textSize(40);
text("Game Over!", width/2, height/2);
noLoop();
}

void scorePanel() {
 rectMode(CENTER);
 fill(127,127);
  rect(width/2,15,width,30);
   fill(0);
    text("Score:" + score,20,25);
}

void keyPressed() {
  //WASD
  if (x > width) {
    x = 0;
  }
  if (x > width) {
    y = 0;
  }
  if (y > height) {
      y = 0;
    }
    if (y > height) {
      y = 0;
    }




    if (key == 'w' || key == 'W' || keyCode == UP) {
      y = y -10;
    } else if (key == 's' || key == 'S' || keyCode == DOWN) {
      y = y + 10;
    } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
      x = x-10;
    } else if (key == 'd' || key == 'D' || keyCode ==RIGHT) {
      x = x + 10;
    }
  }
