ArrayList<Asteroide> asteroides;
Shooter shooter;
float shooterSpeed = 5;

void setup() {
  size(800, 600);
  asteroides = new ArrayList<Asteroide>();
  shooter = new Shooter();
}

void draw() {
  background(0);
  
  // Generar nuevos asteroides
  if (frameCount % 60 == 0) {
    asteroides.add(new Asteroide());
  }
  
  // Mostrar y mover asteroides
  for (int i = asteroides.size() - 1; i >= 0; i--) {
    Asteroide asteroide = asteroides.get(i);
    asteroide.display();
    asteroide.move();
    
    // Colisión con Shooter
    float d = dist(asteroide.position.x, asteroide.position.y, shooter.position.x, shooter.position.y);
    if (d < 25) {
      asteroides.remove(i);
      shooter.loseLife();
    }
  }
  
  // Mostrar y mover Shooter
  shooter.display();
  if (keyPressed) {
    if (keyCode == LEFT) {
      shooter.move(-shooterSpeed);
    } else if (keyCode == RIGHT) {
      shooter.move(shooterSpeed);
    }
  }
  
  // Mostrar HUD de vidas
  fill(255);
  textSize(20);
  text("Vidas: " + shooter.getLives(), 20, 30);
  
  // Verificar fin de juego
  if (shooter.getLives() <= 0) {
    gameOver();
  }
}

void gameOver() {
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2);
  noLoop();
}
