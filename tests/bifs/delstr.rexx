/* These from TRL */
say "Look for DELSTR OK"
if delstr('abcd',3) \== 'ab' then say 'failed in test 1 '
if delstr('abcde',3,2) \== 'abe' then say 'failed in test 2 '
if delstr('abcde',6) \== 'abcde' then say 'failed in test 3 '
/* These from Mark Hessling. */
if delstr("Med lov skal land bygges", 6) \== "Med l" then say 'failed in test 4 '
if delstr("Med lov skal land bygges", 6,10) \== "Med lnd bygges" then say 'failed in test 5 '
if delstr("Med lov skal land bygges", 1) \== "" then say 'failed in test 6 '
if delstr("Med lov skal", 30) \== "Med lov skal" then say 'failed in test 7 '
if delstr("Med lov skal", 8 , 8) \== "Med lov" then say 'failed in test 8 '
if delstr("Med lov skal", 12) \== "Med lov ska" then say 'failed in test 9 '
if delstr("Med lov skal", 13) \== "Med lov skal" then say 'failed in test 10 '
if delstr("Med lov skal", 14) \== "Med lov skal" then say 'failed in test 11 '
if delstr("", 30) \== "" then say 'failed in test 12 '
say "DELSTR OK"
