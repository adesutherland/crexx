/* STRIP */
say "Look for STRIP OK"
/* These from the Rexx book. */
if strip(' ab c ') \== 'ab c' then say 'failed in test 1 '
if strip(' ab c ','L') \== 'ab c ' then say 'failed in test 2 '
if strip(' ab c ','t') \== ' ab c' then say 'failed in test 3 '
if strip('12.7000',,0) \== '12.7' then say 'failed in test 4 '
if strip('0012.7000',,0) \== '12.7' then say 'failed in test 5 '
/* These from Mark Hessling. */
if strip(" foo bar ") \== "foo bar" then say 'failed in test 6 '
if strip(" foo bar ",'L') \== "foo bar " then say 'failed in test 7 '
if strip(" foo bar ",'T') \== " foo bar" then say 'failed in test 8 '
if strip(" foo bar ",'B') \== "foo bar" then say 'failed in test 9 '
if strip(" foo bar ",'B','*') \== " foo bar " then say 'failed in test 10 '
if strip(" foo bar",,'r') \== " foo ba" then say 'failed in test 11 '
say "STRIP OK"
