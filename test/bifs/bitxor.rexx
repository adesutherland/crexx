/* BITXOR */
say "Look for BITXOR OK"
/* These from the Rexx book. */
if bitxor('12'x,'22'x) \== '30'x then say 'failed in test 1 '
if bitxor('1211'x,'22'x) \== '3011'x then say 'failed in test 2 '
/* EBCDIC dependent
if bitxor('C711'x,'222222'x,' ') \== 'E53362'x then say 'failed in test 3 '
*/
if bitxor('1111'x,'444444'x,'40'x) \== '555504'x then
  say 'failed in test 4 '
if bitxor('1111'x,,'4D'x) \== '5C5C'x then say 'failed in test 5 '
/* These from Mark Hessling. */
if bitxor( '123456'x, '3456'x ) \== '266256'x then say 'failed in test 6 '
if bitxor( '3456'x, '123456'x, '99'x ) \== '2662cf'x then
  say 'failed in test 7 '
if bitxor( '123456'x,, '55'x) \== '476103'x then say 'failed in test 8 '
if bitxor( 'foobar' ) \== 'foobar' then say 'failed in test 9 '
/* This one is ASCII dependent. */
/* if bitxor( 'FooBar' ,, '20'x) \== 'fOObAR' then
   say 'failed in test 10 ' */

say "BITXOR OK"
