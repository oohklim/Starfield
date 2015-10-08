Particle[] particles;
void setup()
{
   size(800, 800);
   background(0);
   colorMode(HSB, 100);
   particles = new Particle[500];
   particles[0] = new OddballParticle();
   particles[1] = new JumboParticle();
   for(int i = 2; i < particles.length; i++)
   {
     particles[i] = new NormalParticle();
   }
}
void draw()
{
   fill(0, 25);
   rect(-1, -1, 801, 801);
   for(int i = 0; i < particles.length; i++)
   {
     particles[i].show();
     particles[i].move();
   }
}
class NormalParticle implements Particle
{
   double x, y, speed, theta, a; //rate of change of theta
   int c, d; //color, diameter
   NormalParticle()
   {
     x = 400;
     y = 600;
     speed = Math.random() * 3 + 1;
     theta = Math.random() * (2 * Math.PI);
     c = (int)(Math.random() * 100) + 1;
     a = 0.04;
   }
   public void move()
   {
     x = x + Math.cos(theta) * speed;
     y = y + Math.sin(theta) * speed;
     theta = theta + a;
     if(theta >= 2 * Math.PI || theta <= -2 * Math.PI)
     {
       a = a * -1;
       //theta = theta * -1;
     }
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
  public void move()
  {
     x = x + Math.random()*5 - 2;
     y = y + Math.random()*5 - 2;
  }
  public void show()
  {
    fill(0, 0, 100);
    ellipse((float)x, (float)y, 15, 15);
  }
}
class JumboParticle extends NormalParticle
{
   JumboParticle()
   {
   }
   public void show()
   {
     fill(c, 70, 90);
     ellipse((float)x, (float)y, 30, 30);
   }
}
