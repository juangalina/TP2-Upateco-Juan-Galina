class Player {
  private float x, y;
  private int lives;
  private PImage sprite;

  Player(float x, float y, int lives, PImage sprite) {
    this.x = x;
    this.y = y;
    this.lives = lives;
    this.sprite = sprite;
  }

  void display() {
    image(sprite, x, y);
  }

  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }

  void loseLife() {
    lives--;
  }

  boolean isGameOver() {
    return lives <= 0;
  }

  int getLives() {
    return lives;
  }
}
