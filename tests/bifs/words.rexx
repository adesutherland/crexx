/* WORDS */
say "Look for WORDS OK"
/* These from the Rexx book. */
if words('Now is the time') \= 4 then say 'failed in test 1 '
if words(' ') \= 0 then say 'failed in test 2 '
/* These from Mark Hessling. */
if words('This is certainly a test') \== 5 then say 'failed in test 3 '
if words(' This is certainly a test') \== 5 then say 'failed in test 4 '
if words('This is certainly a test') \== 5 then say 'failed in test 5 '
if words('This is certainly a test ') \== 5 then say 'failed in test 6 '
if words(' hepp ') \== 1 then say 'failed in test 7 '
if words(' hepp hepp ') \== 2 then say 'failed in test 8 '
if words('') \== 0 then say 'failed in test 9 '
if words(' ') \== 0 then say 'failed in test 10 '
say "WORDS OK"
