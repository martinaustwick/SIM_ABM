ArrayList<Shop> shops;

class Shop
{
    PVector p;
    //attractiveness
    float z;
    
    Shop()
    {
        p = new PVector(random(width), random(height));
        z = random(0.1, 1);
    }
    
    void display()
    {
       noFill();
       stroke(0, 255, 255);
       rect(p.x, p.y, 20*z, 20*z);     
    }   
}
  
