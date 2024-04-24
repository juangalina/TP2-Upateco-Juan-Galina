class SpawnerVehicles {
  private ArrayList<Vehicle> vehicles;
  private PImage carSprite;
  private PImage truckSprite;

  SpawnerVehicles(PImage carSprite, PImage truckSprite) {
    vehicles = new ArrayList<Vehicle>();
    this.carSprite = carSprite;
    this.truckSprite = truckSprite;
  }

  void spawnVehicle(float x, float y, float speed) {
    float rand = random(1);
    if (rand < 0.5) {
      vehicles.add(new Car(x, y, speed, carSprite));
    } else {
      vehicles.add(new Truck(x, y, speed, truckSprite));
    }
  }

  void display() {
    for (Vehicle v : vehicles) {
      v.display();
      v.move();
    }
  }

  ArrayList<Vehicle> getVehicles() {
    return vehicles;
  }
}
