class Bullet implements IDisplayable, IMoveable {
  PImage img;
  float x, y;
  float speed;
  
  Bullet(PImage img, float x, float y, float speed) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  void display() {
    image(img, x, y);
  }
  
  void move() {
    x += speed;
    if (x > width) {
      // Elimina la bala cuando sale de la pantalla
      // Aquí puedes implementar la lógica para eliminar la bala de una lista
    }
  }
}
