SIM_ABM
=======

This code is driven a simple singly constrained spatial interaction model (SIM) of the form

Y_ij = O_i Z_j^a exp(-b*r_ij)/sum_k Z_k^a exp(-b*r_ik)

where Y_ij is the flow between home i and shop j

O_i is the expenditure of home i

Z_j is the office floorspace

r_ij is the distance between home i and shop j

a, b are parameters, which can be changed in code

For the "agents"

1) Each home has one active agent at any time. 

2) Upon generation, an agent decides probablistically which shop to travel to, based on the weightings from the above SIM

3) The agent travels at a fixed speed to its destination. 

4) When it reaches its destination, it disappears and a new agent appears at source.

5) On arrival, it deposits "money" at the destination

Shops grow each time "money" is deposited. Technically, this is not the classic Lotka-Volterra formulism, instead it is

dZ_j(t) = c*D_j(t)

And as such can grow without limit.

Keys:

r to reset

n to toggle network defined by underlying SIM
