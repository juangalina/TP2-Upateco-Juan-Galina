PImage carSprite, truckSprite, playerSprite;
Player player;
SpawnerVehicles spawner;
boolean gameOver;

void setup() {
  size(800, 600);
  carSprite = loadImage("autito siuuuuuuuu.png");
  truckSprite = loadImage("camion SUS.png");
  playerSprite = loadImage("frogger.png");
  
  player = new Player(width/2, height - 50, 3, playerSprite); // Player starts with 3 lives
  spawner = new SpawnerVehicles(carSprite, truckSprite);
  gameOver = false;
}

void draw() {
  background(255);
  
  if (!gameOver) {
    // Spawn vehicles
    if (frameCount % 60 == 0) {
      spawner.spawnVehicle(width, random(height/2), -random(1, 3));
    }
    
    // Display vehicles
    spawner.display();
    
    // Display player
    player.display();
    
    // Display lives
    textAlign(LEFT);
    textSize(24);
    fill(0);
    text("Lives: " + player.getLives(), 10, 30);
    
    // Check for collisions
    checkCollisions();
  } else {
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Game Over", width/2, height/2);
  }
}

void keyPressed() {
  if (!gameOver) {
    if (keyCode == UP || key == 'W') {
      player.move(0, -5);
    } else if (keyCode == DOWN || key == 'S') {
      player.move(0, 5);
    } else if (keyCode == LEFT || key == 'A') {
      player.move(-5, 0);
    } else if (keyCode == RIGHT || key == 'D') {
      player.move(5, 0);
    }
  }
}

void checkCollisions() {
  ArrayList<Vehicle> vehicles = spawner.getVehicles();
  for (Vehicle v : vehicles) {
    if (dist(v.x, v.y, player.x, player.y) < 20) {
      player.loseLife();
      if (player.isGameOver()) {
        gameOver = true;
      } else {
        player = new Player(width/2, height - 50, player.getLives(), playerSprite);
      }
    }
  }
}
