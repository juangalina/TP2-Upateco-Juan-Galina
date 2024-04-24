class Shooter extends GameObject {
  private int lives;
  
  Shooter() {
    position = new PVector(width/2, height - 50);
    image = loadImage("nave.png");
    lives = 3;
  }
  
  void display() {
    image(image, position.x, position.y);
  }
  
  void move() {
    // En este caso, el Shooter no se mueve verticalmente, por lo que este método
    // está vacío. Puedes agregar funcionalidad para moverlo horizontalmente si lo deseas.
  }
  
  void move(float x) {
    position.x += x;
    position.x = constrain(position.x, 0, width);
  }
  
  int getLives() {
    return lives;
  }
  
  void loseLife() {
    lives--;
  }
}
