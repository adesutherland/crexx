/* COUNTSTR */
say "Look for COUNTSTR OK"
if countstr('bc','abcabcabc') \= 3 then say 'failed in test 1 '
if countstr('aa','aaaa') \= 2 then say 'failed in test 2 '
if countstr('','a a') \= 0 then say 'failed in test 3 '
/* These from the Rexx book. */
/* These from Mark Hessling. */
if countstr('','') \== 0 then say 'failed in test 4 '
if countstr('a','abcdef') \== 1 then say 'failed in test 5 '
if countstr(0,0) \== 1 then say 'failed in test 6 '
if countstr('a','def') \== 0 then say 'failed in test 7 '
if countstr('a','') \== 0 then say 'failed in test 8 '
if countstr('','def') \== 0 then say 'failed in test 9 '
if countstr('abc','abcdef') \== 1 then say 'failed in test 10 '
if countstr('abcdefg','abcdef') \== 0 then say 'failed in test 11 '
if countstr('abc','abcdefabccdabcd') \== 3 then say 'failed in test 12 '
say "COUNTSTR OK"
