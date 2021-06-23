/* SUBSTR */
  say "Look for SUBSTR OK"
/* These from the Rexx book. */
  if substr('abc',2) \== 'bc'            then say 'failed in test          1 '
  if substr('abc',2,4) \== 'bc  '        then say 'failed in test          2 '
  if substr('abc',2,6,'.') \== 'bc....'  then say 'failed in test          3 '
/* These from Mark Hessling. */
  if substr("foobar",2,3) \==   "oob"                 then say 'failed in test          4 '
  if substr("foobar",3) \==   "obar"                  then say 'failed in test          5 '
  if substr("foobar",3,6) \==   "obar  "              then say 'failed in test          6 '
  if substr("foobar",3,6,'*') \==   "obar**"          then say 'failed in test          7 '
  if substr("foobar",6,3) \==   "r  "                 then say 'failed in test          8 '
  if substr("foobar",8,3) \==   "   "                 then say 'failed in test          9 '
  say "SUBSTR OK"
