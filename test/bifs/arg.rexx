/* ARG */
say "Look for ARG OK"
/* These from the Rexx book. */
call name;call namex 1,,2
/* These from Mark Hessling. */
call testarg2 1,,2
call testarg1
say "ARG OK"
return
name:
if arg() \= 0 then say 'failed in test 1 '
if arg(1) \== '' then say 'failed in test 2 '
if arg(2) \== '' then say 'failed in test 3 '
if arg(1,'e') then say 'failed in test 4 '
if arg(1,'O') \= 1 then say 'failed in test 5 '
return
namex:
if arg() \= 3 then say 'failed in test 6 '
if arg(1) \== 1 then say 'failed in test 7 '
if arg(2) \== '' then say 'failed in test 8 '
if arg(3) \= 2 then say 'failed in test 9 '
if arg(999) \== '' then say 'failed in test 10 '
if arg(1,'e') \= 1 then say 'failed in test 11 '
if arg(2,'E') \= 0 then say 'failed in test 12 '
if arg(2,'O') \= 1 then say 'failed in test 13 '
if arg(3,'o') \= 0 then say 'failed in test 14 '
if arg(4,'o') \= 1 then say 'failed in test 15 '
return

testarg1:
if arg() \== "0" then say 'failed in test 16 '
if arg(1) \== "" then say 'failed in test 17 '
if arg(2) \== "" then say 'failed in test 18 '
if arg(1,"e") \== "0" then say 'failed in test 19 '
if arg(1,"O") \== "1" then say 'failed in test 20 '
return

testarg2:
if arg() \== "3" then say 'failed in test 21 '
if arg(1) \== "1" then say 'failed in test 22 '
if arg(2) \== "" then say 'failed in test 23 '
if arg(3) \== "2" then say 'failed in test 24 '
if arg(4) \== "" then say 'failed in test 25 '
if arg(1,"e") \== "1" then say 'failed in test 26 '
if arg(2,"E") \== "0" then say 'failed in test 27 '
if arg(2,"O") \== "1" then say 'failed in test 28 '
if arg(3,"o") \== "0" then say 'failed in test 29 '
if arg(4,"o") \== "1" then say 'failed in test 30 '
return
