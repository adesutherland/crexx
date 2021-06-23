/* CHANGESTR */
say "Look for CHANGESTR OK"
if changestr('bc','abcabcabc','xy') \== 'axyaxyaxy' then say 'failed in test 1 '
if changestr('bc','abcabcabc','') \== 'aaa' then say 'failed in test 2 '
if changestr('','abcabcabc','xy') \== 'abcabcabc' then say 'failed in test 3 '
/* These from the Rexx book. */
/* These from Mark Hessling. */
if changestr('a','fred','c') \== 'fred' then say 'failed in test 4 '
if changestr('','','x') \== '' then say 'failed in test 5 '
if changestr('a','abcdef','x') \== 'xbcdef' then say 'failed in test 6 '
if changestr('0','0','1') \== '1' then say 'failed in test 7 '
if changestr('a','def','xyz') \== 'def' then say 'failed in test 8 '
if changestr('a','','x') \== '' then say 'failed in test 9 '
if changestr('','def','xyz') \== 'def' then say 'failed in test 10 '
if changestr('abc','abcdef','xyz') \== 'xyzdef' then say 'failed in test 11 '
if changestr('abcdefg','abcdef','xyz') \== 'abcdef' then say 'failed in test 12 '
if changestr('abc','abcdefabccdabcd','z') \== 'zdefzcdzd' then say 'failed in test 13 '
say "CHANGESTR OK"
