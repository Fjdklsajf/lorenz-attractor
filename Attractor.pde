/**************************************************************************************
 * Class Attractor
 * 
 * Description - Holds every solution of Lorenz's differerntial equation with given
 *   initial conditions (x, y, z) and change of tiem (dt)
 **************************************************************************************/
class Attractor {
  private float x;
  private float y;
  private float z;
  private float dt = 0.01;
  
  //Points are stored as vectors in an arraylist
  private ArrayList<PVector> points = new ArrayList<PVector>();

  Attractor() {
    x = 0.1;
    y = 0;
    z = 0;
  }

  Attractor(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  Attractor(float x, float y, float z, float dt) {
    this(x, y, z);
    this.dt = dt;
  }

  void update() {
    //Lorenz's Equations
    float dx = (SIGMA * (y - x)) * dt;
    float dy = (x * (RHO - z) - y) * dt;
    float dz = (x * y - BETA * z) * dt;

    //Update variables
    x += dx;
    y += dy;
    z += dz;

    points.add(new PVector(x, y, z));
  }
  
  float X() { return x; }
  float Y() { return y; }
  float Z() { return z; }
  ArrayList<PVector> getPoints() { return points; }
  int size() { return points.size(); };
}
