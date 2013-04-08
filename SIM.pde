//alpha
float a = 1; 
//beta
float b = 1/100;


ArrayList<Float> SIM(int i)
{
    /*
      This method encodes a simple singly-constrained spatial interaction model
      Yij = z_j^alpha exp(-beta*rij) /sum_k [z_k^alpha exp(-beta*rik)]
      expressed for each home i as an output vector of js
    */
  
    //Pj array/vector, probability of going to j
    ArrayList<Float> Pj = new ArrayList<Float>();
    //sum, for normalisation
    float sum = 0;
    
    for(int j = 0; j<shops.size(); j++)
    {
        //straight line distance
        float rij = PVector.dist(shops.get(j).p, homes.get(i).p);
        
        //utility variabl
        float attractiveness = pow(shops.get(j).z, a);
        
        //un-normalised SIM Yij
        float p = attractiveness*exp(-b*rij);
        Pj.add(p);
        
        sum+=p;
    }
    
    //normalisation loop
    for(int j = 0; j<shops.size(); j++)
    {
        float p = Pj.get(j)/sum;
        Pj.remove(j);
        Pj.add(j, p);
    }
    return Pj;
}
