Particle[] particles;
void setup()
{
   size(800, 800);
   background(0);
   colorMode(HSB, 100);
   particles = new Particle[502];
   particles[0] = new OddballParticle();
   particles[1] = new JumboParticle();
   for(int i = 2; i < particles.length; i++)
   {
     if((int)(Math.random()*2) == 0)
     {
       particles[i] = new NormalParticle();
     }
     else
     {
       particles[i] = new ShootingParticle();
     }
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
interface Particle
{
  public void show();
  public void move();
}
class NormalParticle implements Particle //rotating particles
{
  double x, y, speed, theta, a, d; //rate of change of theta
  int c, r; //color, r determines if theta increases or decreases
   NormalParticle()
   {
     x = 400;
     y = 400;
     speed = Math.random() * 3 + 1;
     r = (int)(Math.random() * 2);
     if(r == 0)
     {
       theta = Math.random() * (2 * Math.PI);
     }
     else
     {
       theta = Math.random() * (-2 * Math.PI);
     }
     c = (int)(Math.random() * 100) + 1;
     a = 0.03;
     d = (int)(Math.random() * 5) + 4;
   }
  public void move()
   {
     x = x + Math.cos(theta) * speed;
     y = y + Math.sin(theta) * speed;
     if(r == 0)
     {
       theta = theta + a;
     }
     else
     {
       theta = theta - a;
     }
     if(theta >= 2 * Math.PI || theta <= -2 * Math.PI)
     {
       a = a * -1;
     }
     if(keyPressed)
     {
       if(key == 's')
       {
         y = y + 5;
       }
       if(key == 'w')
       {
         y = y - 5;
       }
       if(key == 'a')
       {
         x = x - 5;
       }
       if(key == 'd')
       {
         x = x + 5;
       }
       if(key == '1')
       {
         speed = speed + 0.05;
       }
       if(key == '2')
       {
         speed = speed - 0.05;
       }
     }
   }
   public void show()
   {
     fill(c, 70, 90);
     ellipse((float)x, (float)y, (float)d, (float)d);
   }
}
class ShootingParticle extends NormalParticle
{
   ShootingParticle()
   {
     d = 3;
     theta = Math.random() * (2 * Math.PI);
   }
   public void move()
   {
     x = x + Math.cos(theta) * speed;
     y = y + Math.sin(theta) * speed;
     if(x > 800 || x < 0 || y > 800 || y < 0)
     {
       x = 400;
       y = 400;
       speed = Math.random() * 3 + 1;
       theta = Math.random() * (2 * Math.PI);
     }
   }
   public void show()
   {
     fill(c, 40, 90);
     ellipse((float)x, (float)y, (float)d, (float)d);
   }
}
class JumboParticle extends NormalParticle
{
   JumboParticle()
   {
     d = 30;
   }
}    
class OddballParticle implements Particle
{
   double x, y, theta, speed, d;
   OddballParticle()
   {
     x = 400;
     y = 400;
     speed = Math.random() * 3 + 2;
     theta = Math.random() * (2 * Math.PI);
     d = 0;
   }
  public void move()
  {
     x = x + Math.cos(theta) * speed;
     y = y + Math.sin(theta) * speed;
     d = dist(400, 400, (float)x, (float)y)/20;
     if(x > 800 || x < 0 || y > 800 || y < 0)
     {
       x = 400;
       y = 400;
       speed = Math.random() * 3 + 2;
       theta = Math.random() * (2 * Math.PI);
       d = 0;
     }
     if(mousePressed == true)
     {
       theta = atan2((float)(mouseY - y),(float)(mouseX - x));
     }
  }
  public void show()
  {
    fill(0, 0, 100);
    ellipse((float)x, (float)y, (float)d, (float)d);
  }
}
