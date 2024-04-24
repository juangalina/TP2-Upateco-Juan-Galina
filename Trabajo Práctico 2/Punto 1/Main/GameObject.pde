abstract class GameObject {
  protected PVector position;
  protected PImage image;
  
  abstract void display();
  abstract void move();
}
