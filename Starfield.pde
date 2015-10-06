Particle[] particles;
void setup()
{
   size(500, 500);
   background(0);
   colorMode(HSB, 100);
   particles = new Particle[100];
   particles[0] = new OddballParticle();
   particles[1] = new JumboParticle();
   for(int i = 2; i < particles.length; i++)
   {
     particles[i] = new NormalParticle();
   }
}
void draw()
{
   background(0);
   for(int i = 0; i < particles.length; i++)
   {
     particles[i].show();
     particles[i].move();
   }
}
class NormalParticle implements Particle
{
   double x, y, speed, angle;
   int c; //color
   NormalParticle()
   {
     x = 250;
     y = 250;
     speed = Math.random() * 3 + 1; //[1, 3]
     angle = Math.random() * 10 + 1; //[1, 10]
     c = (int)(Math.random() * 100) + 1;
   }
   public void move()
   {
     x = x + Math.cos(angle) * speed;
     y = y + Math.sin(angle) * speed;
   }
   public void show()
   {
     fill(c, 70, 90);
     ellipse((float)x, (float)y, 10, 10);
   }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
   double x, y;
   OddballParticle()
   {
     x = 250;
     y = 250;
   }
  public void move() //need to create new move method
  {
  }
  public void show()
  {
    fill(0, 0, 100);
    ellipse((float)x, (float)y, 10, 10);
  }
}
class JumboParticle implements Particle
{
   double x, y, speed, angle;
   int c; //color
   JumboParticle()
   {
     x = 250;
     y = 250;
     speed = Math.random() * 3 + 1; //[1, 3]
     angle = Math.random() * 10 + 1; //[1, 10]
     c = (int)(Math.random() * 100) + 1;
   }
   public void move()
   {
     x = x + Math.cos(angle) * speed;
     y = y + Math.sin(angle) * speed;
   }
   public void show()
   {
     fill(c, 70, 90);
     ellipse((float)x, (float)y, 20, 20);
   }
}
