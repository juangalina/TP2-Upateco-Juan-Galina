class Asteroid implements IDisplayable, IMoveable {
  PImage img;
  float x, y;
  float speed;
  
  Asteroid(PImage img, float x, float y, float speed) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  void display() {
    image(img, x, y);
  }
  
  void move() {
    x -= speed;
    if (x < -img.width) {
      // Elimina el asteroide cuando sale de la pantalla
      // Aquí puedes implementar la lógica para eliminar el asteroide de una lista
    }
  }
}
