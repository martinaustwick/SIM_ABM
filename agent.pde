ArrayList<Agent> agents;

class Agent
{
    PVector p,v;
    //which home did we start at?
    int homeInt;
    //which shop are we heading towards?
    int j;
    
    Agent(PVector pos)
    {
        p = pos.get();
    }
    
    void display()
    {  
        //circle for location
        //fill(255);
        //noStroke();
        //stroke(0);
        //ellipse(p.x, p.y, 10, 10);
        //line for direction of travel
        stroke(0, 0, 0, 50);
        //line(p.x, p.y, p.x + 5*v.x, p.y + 5*v.y);
        point(p.x, p.y);
    }
    
    void decide(int i)
    {
        //uses a cumulative frequency approach to decide on a destination
        ArrayList<Float> P = SIM(i);
        float choice = random(1);
        float run = 0;
        
        for(int k = 0; k< P.size(); k++)
        {
            run+=P.get(k);
            if(choice<run) {
              j=k;
              break;
            }
        }
        
        v = PVector.sub(shops.get(j).p, homes.get(i).p);
        v.normalize();
        
        homes.get(i).Pj = P;
    }
    
    void move()
    {
        p.add(v);
    }
    
    boolean shopping()
    {
        /*
          has the agent reached the shops?
        */
        
        if(PVector.dist(p, shops.get(j).p)<20) return true;
        else return false;
    }
}
