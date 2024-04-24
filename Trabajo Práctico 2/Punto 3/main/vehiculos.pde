class Vehicle {
  protected float x, y;
  protected float speed;
  protected PImage sprite;

  Vehicle(float x, float y, float speed, PImage sprite) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.sprite = sprite;
  }

  void display() {
    image(sprite, x, y);
  }

  void move() {
    x += speed;
  }
}
