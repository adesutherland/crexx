/* B2X */
say "Look for B2X OK"
/* These from the Rexx book. */
if b2x('11000011') \== 'C3' then say 'failed in test 1 '
if b2x('10111') \== '17' then say 'failed in test 2 '
if b2x('101') \== '5' then say 'failed in test 3 '
if b2x('1 1111 0000') \== '1F0' then say 'failed in test 4 '
if x2d(b2x('10111')) \== '23' then say 'failed in test 5 '
/* These from Mark Hessling. */
if b2x("") \== "" then say 'failed in test 6 '
if b2x("0") \== "0" then say 'failed in test 7 '
if b2x("1") \== "1" then say 'failed in test 8 '
if b2x("10") \== "2" then say 'failed in test 9 '
if b2x("010") \== "2" then say 'failed in test 10 '
if b2x("1010") \== "A" then say 'failed in test 11 '
if b2x("1 0101") \== "15" then say 'failed in test 12 '
if b2x("1 01010101") \== "155" then say 'failed in test 13 '
if b2x("1 0101 0101") \== "155" then say 'failed in test 14 '
if b2x("10101 0101") \== "155" then say 'failed in test 15 '
if b2x("0000 00000000 0000") \== "0000" then say 'failed in test 16 '
if b2x("11111111 11111111") \== "FFFF" then say 'failed in test 17 '
say "B2X OK"
