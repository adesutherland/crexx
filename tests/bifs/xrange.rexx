/* XRANGE */
say "Look for XRANGE OK"
/* These from the Rexx book. */
if xrange('a','f') \== 'abcdef' then say 'failed in test 1 '
if xrange('03'x,'07'x) \== '0304050607'x then say 'failed in test 2 '
/* if xrange('04'x) \== '0001020304'x then say 'failed in test */
if xrange('FE'x,'02'x) \== 'FEFF000102'x then say 'failed in test 4 '
/* These from Mark Hessling. */
/*if xrange('f','r') \== 'fghijklmnopqr' then say 'failed in test */ /* fails ebcdic */
if xrange('7d'x,'83'x) \== '7d7e7f80818283'x then say 'failed in test 6 '
if xrange('a','a') \== 'a' then say 'failed in test 7 '
say "XRANGE OK"

