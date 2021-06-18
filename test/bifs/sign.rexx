/* SIGN */
say "Look for SIGN OK"
/* These from the Rexx book. */
if sign('12.3') \= 1 then say 'failed in test 1 '
if sign(0.0) \= 0 then say 'failed in test 2 '
if sign(' -0.307') \= -1 then say 'failed in test 3 '
/* These from Mark Hessling. */
if sign("0") \== 0 then say 'failed in test 4 '
if sign("-0") \== 0 then say 'failed in test 5 '
if sign("0.4") \== 1 then say 'failed in test 6 '
if sign("-10") \== -1 then say 'failed in test 7 '
if sign("15") \== 1 then say 'failed in test 8 '
say "SIGN OK"
