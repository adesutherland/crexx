/* FACT: procedure  */
parse arg N 
F = 1 
do J = 2 to N
  F = F * J
end 
return F
  