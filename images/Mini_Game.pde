// Hailey Price | 18 March 2026 | MiniGame

int x, y;          // player position
int tx, ty;        // target (flower) position
int score;         // score counter
float tw;          // target width shrinking over time

PImage player;
PImage targetImg;
PImage bg;

void setup() {
  size(800, 800);

  // Load images once
  bg = loadImage("field.png");
  player = loadImage("bee.png");
  targetImg = loadImage("flower.png");

  // Initial positions
  x = width/2;
  y = height/2;

  tx = int(random(20, width - 20));
  ty = int(random(20, height - 20));

  tw = 200;
  score = 0;

  imageMode(CENTER);
}

void draw() {
  // Draw background cleanly every frame
  image(bg, width/2, height/2, width, height);

  scorePanel();
  drawTarget();
  drawPlayer();
}

void drawPlayer() {
  image(player, x, y, 200, 200);
}

void drawTarget() {
  float d = dist(x, y, tx, ty);

  // Collision with flower
  if (d < tw/2) {
    score += int(tw * 2);
    tx = int(random(20, width - 20));
    ty = int(random(20, height - 20));
    tw = 200;
  }

  // Game over if flower shrinks too small
  if (tw < 10) {
    gameOver();
  }

  // Draw flower WITHOUT resizing original image
  image(targetImg, tx, ty, tw, tw);

  // Shrink flower
  tw -= 0.1;
}

void scorePanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 15, width, 30);

  fill(0);
  textSize(20);
  text("Score: " + score, 20, 25);
}

void gameOver() {
  background(0);
  fill(255, 0, 0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Game Over!", width/2, height/2);
  noLoop();
}

void keyPressed() {
  // Movement
  if (key == 'w' || key == 'W' || keyCode == UP) {
    y -= 10;
  } else if (key == 's' || key == 'S' || keyCode == DOWN) {
    y += 10;
  } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
    x -= 10;
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    x += 10;
  }

  // Wrap-around screen edges
  if (x > width)  x = 0;
  if (x < 0)      x = width;
  if (y > height) y = 0;
  if (y < 0)      y = height;
}
