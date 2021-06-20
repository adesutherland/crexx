/* ABS */
say "Look for ABS OK"
/* These from the Rexx book. */
if abs('12.3') \= 12.3 then say 'failed in test 1 '
if abs(' -0.307') \= 0.307 then say 'failed in test 2 '
/* These from Mark Hessling. */
if abs(-12.345) \== 12.345 then say 'failed in test 3 '
if abs(12.345) \== 12.345 then say 'failed in test 4 '
if abs(-0.0) \== 0 then say 'failed in test 5 '
if abs(0.0) \== 0 then say 'failed in test 6 '
say "ABS OK"
