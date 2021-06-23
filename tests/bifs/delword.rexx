/* These from TRL */
say "Look for DELWORD OK"
if delword('Now is the time',2,2) \== 'Now time' then say 'failed in test 1 '
if delword('Now is the time ',3) \== 'Now is ' then say 'failed in test 2 '
if delword('Now time',5) \== 'Now time' then say 'failed in test 3 '
/* These from Mark Hessling. */
if delword("Med lov skal land bygges", 3) \== "Med lov " then say 'failed in test 4 '
if delword("Med lov skal land bygges", 1) \== "" then say 'failed in test 5 '
if delword("Med lov skal land bygges", 1,1) \== "lov skal land bygges" then say 'failed in test 6 '
if delword("Med lov skal land bygges", 2,3) \== "Med bygges" then say 'failed in test 7 '
if delword("Med lov skal land bygges", 2,10) \== "Med " then say 'failed in test 8 '
if delword("Med lov skal land bygges", 3,2) \== "Med lov bygges" then say 'failed in test 9 '
if delword("Med lov skal land bygges", 3,2) \== "Med lov bygges" then say 'failed in test 10 '
if delword("Med lov skal land bygges", 3,2) \== "Med lov bygges" then say 'failed in test 11 '
if delword("Med lov skal land bygges", 3,0) \== "Med lov skal land bygges" then say 'failed in test 12 '
if delword("Med lov skal land bygges", 10) \== "Med lov skal land bygges" then say 'failed in test 13 '
if delword("Med lov skal land bygges", 9,9) \== "Med lov skal land bygges" then say 'failed in test 14 '
if delword("Med lov skal land bygges", 1,0) \== "Med lov skal land bygges" then say 'failed in test 15 '
if delword(" Med lov skal", 1,0) \== " Med lov skal" then say 'failed in test 16 '
if delword(" Med lov skal ", 4) \== " Med lov skal " then say 'failed in test 17 '
if delword("", 1) \== "" then say 'failed in test 18 '
say "DELWORD OK"
