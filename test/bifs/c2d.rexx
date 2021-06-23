/* C2D */
say "Look for C2D OK"
/* These from the Rexx book. */
if c2d('09'x) \== 9 then say 'failed in test 1 '
if c2d('81'x) \== 129 then say 'failed in test 2 '
/* EBCDIC
if c2d('a'x) \== 129 then say 'failed in test 3 '
*/
if c2d('FF81'x) \== 65409 then say 'failed in test 4 '
if c2d('') \== 0 then say 'failed in test 5 '
if c2d('81'x,1) \== -127 then say 'failed in test 6 '
if c2d('81'x,2) \== 129 then say 'failed in test 7 '
if c2d('FF81'x,2) \== -127 then say 'failed in test 8 '
if c2d('FF81'x,1) \== -127 then say 'failed in test 9 '
if c2d('FF7F'x,1) \== 127 then say 'failed in test 10 '
if c2d('F081'x,2) \== -3967 then say 'failed in test 11 '
if c2d('F081'x,1) \== -127 then say 'failed in test 12 '
if c2d('0031'x,0) \== 0 then say 'failed in test 13 '
/* These from Mark Hessling. */
if c2d( 'ff80'x, 1) \== '-128' then say 'failed in test 14 '
/* ASCII 
if c2d( 'foo' ) \== "6713199" then say 'failed in test 15 '
   ASCII 
if c2d( 'bar' ) \== "6447474" then say 'failed in test 16 ' */
if c2d( '' ) \== "0" then say 'failed in test 17 '
if c2d( '101'x ) \== "257" then say 'failed in test 18 '
if c2d( 'ff'x ) \== "255" then say 'failed in test 19 '
if c2d( 'ffff'x) \== "65535" then say 'failed in test 20 '
if c2d( 'ffff'x, 2) \== "-1" then say 'failed in test 21 '
if c2d( 'ffff'x, 1) \== "-1" then say 'failed in test 22 '
if c2d( 'fffe'x, 2) \== "-2" then say 'failed in test 23 '
if c2d( 'fffe'x, 1) \== "-2" then say 'failed in test 24 '
if c2d( 'ffff'x, 3) \== "65535" then say 'failed in test 25 '
if c2d( 'ff7f'x, 1) \== "127" then say 'failed in test 26 '
if c2d( 'ff7f'x, 2) \== "-129" then say 'failed in test 27 '
if c2d( 'ff7f'x, 3) \== "65407" then say 'failed in test 28 '
if c2d( 'ff80'x, 1) \== "-128" then say 'failed in test 29 '
if c2d( 'ff80'x, 2) \== "-128" then say 'failed in test 30 '
if c2d( 'ff80'x, 3) \== "65408" then say 'failed in test 31 '
if c2d( 'ff81'x, 1) \== "-127" then say 'failed in test 32 '
if c2d( 'ff81'x, 2) \== "-127" then say 'failed in test 33 '
if c2d( 'ff81'x, 3) \== "65409" then say 'failed in test 34 '
if c2d( 'ffffffffff'x, 5) \== "-1" then say 'failed in test 35 '
say "C2D OK"
