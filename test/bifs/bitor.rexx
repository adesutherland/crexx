/* BITOR */
say "Look for BITOR OK"
/* These from the Rexx book. */
if bitor('15'x,'24'x) \= '35'x then say 'failed in test 1 '
if bitor('15'x,'2456'x) \= '3556'x then say 'failed in test 2 '
if bitor('15'x,'2456'x,'F0'x) \= '35F6'x then say 'failed in test 3 '
if bitor('1111'x,,'4D'x) \= '5D5d'x then say 'failed in test 4 '
/* These from Mark Hessling. */
if bitor( '123456'x, '3456'x ) \== '367656'x then say 'failed in test 5 '
if bitor( '3456'x, '123456'x, '99'x ) \== '3676df'x then say 'failed in test 6 '
if bitor( '123456'x,, '55'x) \== '577557'x then say 'failed in test 7 '
if bitor( 'foobar' ) \== 'foobar' then say 'failed in test 8 '
/* This one is ASCII dependent */
/* if bitor( 'FooBar' ,, '20'x) \== 'foobar' then say 'failed in test 9 ' */
say "BITOR OK"
