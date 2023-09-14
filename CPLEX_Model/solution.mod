/*********************************************
 * OPL 12.6.2.0 Model
 * Author: oguzd
 * Creation Date: 04 May 2023 at 09:27:58
 *********************************************/

 //sets
 int machines = 25;
 int regularOrders = 60;
 int additionalOrders = 40;
 int allOrders = 100;
 
 //parameters
 
 range macRange = 1..machines;
 range regOrderRange = 1..regularOrders;
 range addOrderRange = 61..allOrders;
 range allOrderRange = 1..allOrders;
 
 int demand[allOrderRange]=...;
 int capacity[macRange]=...;
 int profit[allOrderRange]=...;
 int fixedCost[macRange]=...;
 
 //decision variables
 
 dvar boolean X[allOrderRange][macRange];
 dvar boolean Z[macRange];
 
 
 maximize sum (i in addOrderRange, m in macRange) (profit[i]*X[i][m]) - sum(m in macRange)(capacity[m]*Z[m]);
 

 
 subject to
 {
 
 forall(o in regOrderRange)sum ( m in macRange)(X[o][m])== 1;
 
 forall(a in allOrderRange)sum (m in macRange)(X[a][m]) <= 1;
 
 forall(m in macRange)sum (i in allOrderRange)(X[i][m]) <= Z[m];
 
 forall(m in macRange)sum (i in allOrderRange)(demand[i]*X[i][m]) <= capacity[m] * Z[m];
 
 forall(m in macRange)sum (m in macRange:m!=4)(Z[m]) <= 7;
 

  
 }
 
 
 
 
 
 