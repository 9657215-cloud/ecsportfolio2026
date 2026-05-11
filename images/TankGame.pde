// TankGame | April 1 2026 | Hailey Price
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
float score, health,x,y,h,w,speed;
PImage bg;

Timer objTimer;
Timer puTimer;

void setup() {
  size(500, 500);
  score = 0;
  health = 100;
  speed = 5.0;

  bg = loadImage("tankbg.png");
  t1 = new Tank();

  objTimer = new Timer(1000);
  objTimer.start();

  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);

  // Spawn Powerups
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp(40, 40, random(1, 3)));
    puTimer.start();
  }

  // Update Powerups
  for (int i = powerups.size()-1; i >= 0; i--) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();

    if (pu.reachedEdge()) {
      powerups.remove(i);
      continue;
    }

    // Tank picks up powerup
    if (dist(t1.x, t1.y, pu.x, pu.y) < (t1.w/2 + pu.w/2)) {
      applyPowerUp(pu.type);
      powerups.remove(i);
    }
  }

  // Spawn Rocks
  if (objTimer.isFinished()) {
    rocks.add(new Rock(50, 50, random(2, 5), 10));
    objTimer.start();
  }

  // Update Rocks
  for (int i = rocks.size()-1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display();
    r.move();

    if (r.reachedEdge()) {
      rocks.remove(i);
      continue;
    }

    if (t1.intersect(r)) {
      score -= 50;
      t1.health-=20;
      rocks.remove(i);
    }
  }

  //Update Projectiles
  for (int i = projectiles.size()-1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();

    if (p.reachedEdge()) {
      projectiles.remove(i);
      continue;
    }

    // Check collision with rocks
    for (int j = rocks.size()-1; j >= 0; j--) {
      Rock r = rocks.get(j);
      if (p.intersect(r)) {
        score += 100;
        projectiles.remove(i);
        rocks.remove(j);
        break;
      }
    }
  }

  // Draw Tank
  t1.display();

  // Score Panel
  scorePanel();
}

void applyPowerUp(int type) {
  if (type == 0) score += 200;
  if (type == 1) {
    t1.health += 10;
    if (t1.health > 100) t1.health = 100;
  }
  if (type == 2) t1.speed += 1;
}

void keyPressed() {
  if (key =='w') t1.move('w');
  if (key =='s') t1.move('s');
  if (key =='a') t1.move('a');
  if (key =='d') t1.move('d');
}

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    float speed = 7;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("Score: " + score, width-100, 25);
    text("Health: " + t1.health, width-250,25);
      text("Speed: " + t1.speed, width-400,25);
}
