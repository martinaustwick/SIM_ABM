ArrayList<Home> homes;

class Home
{
    PVector p;
    ArrayList<Float> Pj;
    
    Home()
    {
        p = new PVector(random(width), random(height));
    }
    
    void display()
    {
       noFill();
       stroke(255, 0, 0);
       rect(p.x, p.y, 20, 20);     
    }
    
    Agent shopper()
    {
        return new Agent(p);
    }
}
