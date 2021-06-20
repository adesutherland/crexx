/* SYMBOL */
say "Look for SYMBOL OK"
/* These from the Rexx book. */
drop A.3; j=3
if symbol('J') \== 'VAR' then say 'failed in test 1 '
if symbol(J) \== 'LIT' then say 'failed in test 2 '
if symbol('a.j') \== 'LIT' then say 'failed in test 3 '
if symbol(2) \== 'LIT' then say 'failed in test 4 '
if symbol('*') \== 'BAD' then say 'failed in test 5 '
/* These from Mark Hessling. */
parse value 'foobar' with alpha 1 beta 1 omega 1 gamma.foobar
omega = 'FOOBAR'
if symbol("HEPP") \== "LIT" then say 'failed in test 6 '
if symbol("ALPHA") \== "VAR" then say 'failed in test 7 '
if symbol("Un*x") \== "BAD" then say 'failed in test 8 '
if symbol("gamma.delta") \== "LIT" then say 'failed in test 9 '
if symbol("gamma.FOOBAR") \== "VAR" then say 'failed in test 10 '
if symbol("gamma.alpha") \== "LIT" then say 'failed in test 11 '
if symbol("gamma.omega") \== "VAR" then say 'failed in test 12 '
/* if symbol("gamma.Un*x") \== "LIT" then say 'failed in test 13 ' also fails in REXX370 */
if symbol("Un*x.gamma") \== "BAD" then say 'failed in test 14 '
if symbol("!!") \== "LIT" then say 'failed in test 15 '
if symbol("") \== "BAD" then say 'failed in test 16 '
if symbol("00"x) \== "BAD" then say 'failed in test 17 '
if symbol("foo-bar") \== "BAD" then say 'failed in test 18 '
say "SYMBOL OK"
