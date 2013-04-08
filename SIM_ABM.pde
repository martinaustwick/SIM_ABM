/*
  Simple demonstration Agent-Based/Monte Carlo Spatial Interaction Model with time delays
  by Martin Austwick
  First Version uploaded 5th April 2013
  Developed from ideas by Alan Wilson.
*/


boolean showP = false;

void setup()
{
  size(600, 600);
  smooth();
  
  agents = new ArrayList<Agent>();

  shops = new ArrayList<Shop>();
  for(int i = 0; i<5; i++)
  {
      shops.add(new Shop());
  }

  homes = new ArrayList<Home>();
  for (int i = 0; i<10; i++)
  {
    homes.add(new Home());
    Agent a = homes.get(i).shopper();
    a.decide(i);
    a.homeInt = i;
    agents.add(a);
  }
  
  

  rectMode(CENTER);
  background(255);
}

void draw()
{
  //background(255);  
  for (int i = 0; i<agents.size(); i++)
  {
    agents.get(i).move();
    agents.get(i).display();
    
    if(agents.get(i).shopping())
    {
        /*
            This is the line which feeds the shop.
            Technically this looks like a discretization of
            (dz_j/dt)(t) = gamma*D_j(t)
            rather than the more usual 
            (dz_j/dt)(t) = gamma*z_j(D_j - k*z_j)
            which is a typical Lotka-Volterra form.
            This version has zero land cost and will grow indefinitely, which is problematic. Also, the delay created by finite journey times creates implicit costs around distance.
        */
        
        shops.get(agents.get(i).j).z += 0.1;  
        
        //add a new agent from this home location
        int homeInteger = agents.get(i).homeInt;
        Agent a = homes.get(homeInteger).shopper();
        a.decide(homeInteger);
        a.homeInt = homeInteger;
        
        //add the new agent
        agents.remove(i);
        agents.add(a);
    }
  }

  for (int i = 0; i<homes.size(); i++)
  {  
    homes.get(i).display();
  }
  
  for(int i = 0; i<shops.size(); i++)
  {
      shops.get(i).display();
  }
  
  if(showP)
  {
      for(int i = 0; i<homes.size(); i++)
      {
          ArrayList<Float> links = homes.get(i).Pj;
          for(int j = 0; j < links.size(); j++)
          {
              stroke(0, 0, 0, 300*links.get(j));
              ///strokeWeight(5*links.get(j));
              PVector p1 = homes.get(i).p;
              PVector p2 = shops.get(j).p;
              line(p1.x, p1.y, p2.x, p2.y);
          }
      }
  }
}

void keyPressed()
{
    if(key=='r') setup();
    if(key=='n') showP = !showP;
}

