/* rexx test factorial function */
rc = assertEQ( factrial(1), 1)
rc = rc + assertEQ( factrial(2), 4)
rc = rc + assertEQ( factrial(3), 18)
rc = rc + assertEQ( factrial(4), 96)
rc = rc + assertEQ( factrial(5), 600)
rc = rc + assertEQ( factrial(6), 4320)
rc = rc + assertEQ( factrial(7), 35280)
rc = rc + assertEQ( factrial(8), 322560)
rc = rc + assertEQ( factrial(9), 3265920)

say 'factorial:' rc
