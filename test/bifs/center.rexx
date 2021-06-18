/* These from TRL */
  say "Look for CENTER OK"
  if centre(abc,7) \== '  ABC  '              then say 'failed in test          1 '
  if center(abc,7) \== '  ABC  '              then say 'failed in test          2 '
  if center(abc,8,'-') \== '--ABC---'         then say 'failed in test          3 '
  if center('The blue sky',8) \== 'e blue s'  then say 'failed in test          4 '
  if center('The blue sky',7) \== 'e blue '   then say 'failed in test          5 '
/* These from Mark Hessling. */
  if center('****',8,'-')      \=='--****--'   then say 'failed in test          6 '
  if center('****',7,'-')      \=='-****--'    then say 'failed in test          7 '
  if center('*****',8,'-')     \=='-*****--'   then say 'failed in test          8 '
  if center('*****',7,'-')     \=='-*****-'    then say 'failed in test          9 '
  if center('12345678',4,'-')  \=='3456'       then say 'failed in test         10 '
  if center('12345678',5,'-')  \=='23456'      then say 'failed in test         11 '
  if center('1234567',4,'-')   \=='2345'       then say 'failed in test         12 '
  if center('1234567',5,'-')   \=='23456'      then say 'failed in test         13 '
  say "CENTER OK"
