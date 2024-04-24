class Asteroide extends GameObject {
  private float speed;
  
  Asteroide() {
    position = new PVector(random(width), -50);
    image = loadImage("asteroide.png");
    speed = random(1, 4);
  }
  
  void display() {
    image(image, position.x, position.y);
  }
  
  void move() {
    position.y += speed;
    if (position.y > height) {
      position.y = -50;
      position.x = random(width);
    }
  }
}
