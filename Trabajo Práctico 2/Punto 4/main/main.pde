ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
Nave nave;
PImage naveImg, asteroidImg, bulletImg;
int score = 0;
int lives = 3;

void setup() {
  size(800, 600);
  naveImg = loadImage("nave.png");
  asteroidImg = loadImage("asteroide.png");
  bulletImg = loadImage("bala.png");
  nave = new Nave(naveImg, width/2, height/2, 5);
}

void draw() {
  background(0);
  

  nave.display();
  nave.move();
  nave.readCommand();
  

  if (frameCount % 60 == 0) {
    float asteroidY = random(height);
    Asteroid asteroid = new Asteroid(asteroidImg, width, asteroidY, 3);
    asteroids.add(asteroid);
  }
  

  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.display();
    b.move();
    

    for (int j = asteroids.size() - 1; j >= 0; j--) {
      Asteroid a = asteroids.get(j);
      if (dist(b.x, b.y, a.x, a.y) < 20) {
        bullets.remove(i);
        asteroids.remove(j);
        score += 10;
        break; 
      }
    }
    
    
    if (b.x > width) {
      bullets.remove(i);
    }
  }
  
  
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.display();
    a.move();
    
    
    if (dist(nave.x, nave.y, a.x, a.y) < 40) {
      asteroids.remove(i);
      lives--;
      if (lives <= 0) {
        gameOver();
      }
      continue; 
    }

   
    for (int j = bullets.size() - 1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      if (dist(b.x, b.y, a.x, a.y) < 20) {
        bullets.remove(j);
        asteroids.remove(i);
        score += 10;
        break; 
      }
    }
  }
  
  
  textAlign(LEFT);
  fill(255);
  textSize(20);
  text("Puntaje: " + score, 20, 30);
  text("Vidas: " + lives, 20, 60);
}

void keyPressed() {
  if (keyCode == UP) {
    nave.movingUp = true;
  } else if (keyCode == DOWN) {
    nave.movingDown = true;
  } else if (keyCode == LEFT) {
    nave.movingLeft = true;
  } else if (keyCode == RIGHT) {
    nave.movingRight = true;
  } else if (key == ' ') {
    
    Bullet b = new Bullet(bulletImg, nave.x + nave.img.width, nave.y + nave.img.height/2, 10);
    bullets.add(b);
  }
}

void keyReleased() {
  if (keyCode == UP) {
    nave.movingUp = false;
  } else if (keyCode == DOWN) {
    nave.movingDown = false;
  } else if (keyCode == LEFT) {
    nave.movingLeft = false;
  } else if (keyCode == RIGHT) {
    nave.movingRight = false;
  }
}

void gameOver() {
  background(0);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(40);
  text("GAME OVER", width/2, height/2);
  noLoop(); 
}
