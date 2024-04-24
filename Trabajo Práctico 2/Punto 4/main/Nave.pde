class Nave implements IDisplayable, IMoveable, IController {
  PImage img;
  float x, y;
  float speed;
  boolean movingUp, movingDown, movingLeft, movingRight;
  
  Nave(PImage img, float x, float y, float speed) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  void display() {
    image(img, x, y);
  }
  
  void move() {
    if (movingUp) {
      y -= speed;
    }
    if (movingDown) {
      y += speed;
    }
    if (movingLeft) {
      x -= speed;
    }
    if (movingRight) {
      x += speed;
    }
  }
  
  void readCommand() {
    // Aquí puedes implementar la lógica para controlar la nave
  }
}
