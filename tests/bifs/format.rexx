/* FORMAT */
  say 'Look for FORMAT OK'
 /* These from the Rexx book. */
  if format('3',4) \== '   3'              then say 'failed in test 1 '
  if format('1.73',4,0) \== '   2'         then say 'failed in test 2 '
  if format('1.73',4,3) \== '   1.730'     then say 'failed in test 3 '
  if format('-.76',4,1) \== '  -0.8'       then say 'failed in test 4 '
  if format('3.03',4) \== '   3.03'        then say 'failed in test 5 '
  if format(' - 12.73',,4) \== '-12.7300'  then say 'failed in test 6 '
  if format(' - 12.73') \== '-12.73'       then say 'failed in test 7 '
  if format('0.000') \== '0'               then say 'failed in test 8 '
  if format('12345.73',,,2,2) \== '1.234573E+04'  then say 'failed in test 9 '
  if format('12345.73',,3,,0) \== '1.235E+4'  then say 'failed in test 10 '
  if format('1.234573',,3,,0) \== '1.235'  then say 'failed in test 11 '
  if format('123.45',,3,2,0) \== '1.235E+02'  then say 'failed in test 12 '
  if format('1.2345',,3,2,0) \== '1.235    '  then say 'failed in test 13 '
  if format('12345.73',,,3,6) \== '12345.73'  then say 'failed in test 14 '
  if format('1234567e5',,3,0) \== '123456700000.000'  then
    say 'failed in test 15 '
 /* These from Mark Hessling. */
 if format(12.34) \== '12.34'  then say 'failed in test 16 '
 if format(12.34,4) \== '  12.34'  then say 'failed in test 17 '
 if format(12.34,4,4) \== '  12.3400'  then say 'failed in test 18 '
 if format(12.34,4,1) \== '  12.3'  then say 'failed in test 19 '
 if format(12.35,4,1) \== '  12.4'  then say 'failed in test 20 '
 if format(12.34,,4) \== '12.3400'  then say 'failed in test 21 '
 if format(12.34,4,0) \== '  12'  then say 'failed in test 22 '
 if format(99.995,3,2) \== '100.00'  then say 'failed in test 23 '
 if format(0.111,,4) \== '0.1110'  then say 'failed in test 24 '
 if format(0.0111,,4) \== '0.0111'  then say 'failed in test 25 '
 if format(0.00111,,4) \== '0.0011'  then say 'failed in test 26 '
 if format(0.000111,,4) \== '0.0001'  then say 'failed in test 27 '
 if format(0.0000111,,4) \== '0.0000'  then say 'failed in test 28 '
 if format(0.00000111,,4) \== '0.0000'  then say 'failed in test 29 '
 if format(0.555,,4) \== '0.5550'  then say 'failed in test 30 '
 if format(0.0555,,4) \== '0.0555'  then say 'failed in test 31 '
 if format(0.00555,,4) \== '0.0056'  then say 'failed in test 32 '
 if format(0.000555,,4) \== '0.0006'  then say 'failed in test 33 '
 if format(0.0000555,,4) \== '0.0001'  then say 'failed in test 34 '
 if format(0.00000555,,4) \== '0.0000'  then say 'failed in test 35 '
 if format(0.999,,4) \== '0.9990'  then say 'failed in test 36 '
 if format(0.0999,,4) \== '0.0999'  then say 'failed in test 37 '
 if format(0.00999,,4) \== '0.0100'  then say 'failed in test 38 '
 if format(0.000999,,4) \== '0.0010'  then say 'failed in test 39 '
 if format(0.0000999,,4) \== '0.0001'  then say 'failed in test 40 '
 if format(0.00000999,,4) \== '0.0000'  then say 'failed in test 41 '
 if format(0.455,,4) \== '0.4550'  then say 'failed in test 42 '
 if format(0.0455,,4) \== '0.0455'  then say 'failed in test 43 '
 if format(0.00455,,4) \== '0.0046'  then say 'failed in test 44 '
 if format(0.000455,,4) \== '0.0005'  then say 'failed in test 45 '
 if format(0.0000455,,4) \== '0.0000'  then say 'failed in test 46 '
 if format(0.00000455,,4) \== '0.0000'  then say 'failed in test 47 '
 if format(1.00000045,,6) \== '1.000000'  then say 'failed in test 48 '
 if format(1.000000045,,7) \== '1.0000001'  then say 'failed in test 49 '
 if format(1.0000000045,,8) \== '1.00000000'  then say 'failed in test 50 '
 if format(12.34,,,,0) \== '1.234E+1'  then say 'failed in test 51 '
 if format(12.34,,,3,0) \== '1.234E+001'  then say 'failed in test 52 '
 if format(12.34,,,3,) \== '12.34'  then say 'failed in test 53 '
 if format(1.234,,,3,0) \== '1.234     '  then say 'failed in test 54 '
 if format(12.34,3,,,0) \== '  1.234E+1'  then say 'failed in test 55 '
 if format(12.34,,2,,0) \== '1.23E+1'  then say 'failed in test 56 '
 if format(12.34,,3,,0) \== '1.234E+1'  then say 'failed in test 57 '
 if format(12.34,,4,,0) \== '1.2340E+1'  then say 'failed in test 58 '
 if format(12.345,,3,,0) \== '1.235E+1'  then say 'failed in test 59 '
 if format(99.999,,,,) \== '99.999'  then say 'failed in test 60 '
 if format(99.999,,2,,) \== '100.00'  then say 'failed in test 61 '
 if format(99.999,,2,,2) \== '1.00E+2'  then say 'failed in test 62 '
 if format(.999999,,4,2,2) \== '1.0000'  then say 'failed in test 63 '
 if format(.999999,,5,2,2) \== '1.00000'  then say 'failed in test 64 '
 if format(.9999999,,5,2,2) \== '1.00000'  then say 'failed in test 65 '

 /*
   if format(.999999,,6,2,2) \== '0.999999'  then say 'failed in test 66 '

   We return "9.999990E-01" and I think that the 5th argument means that the
   format should indeed be SCIENTIFIC (?)
 */

 if format(90.999,,0) \== '91'  then say 'failed in test 67 '
 if format(0099.999,5,3,,) \== '   99.999'  then say 'failed in test 68 '
 if format(0.0000000000000000001,4) \== '   1E-19'  then
   say 'failed in test 69 '
 if format(0.0000000000000000001,4,4) \== '   1.0000E-19' then
   say 'failed in test 70 '
 if format(0.0000001,4,,,3) \== '   1E-7'  then say 'failed in test 71 '
 if format(0.0000001,4,4,,3) \== '   1.0000E-7'  then
   say 'failed in test 72 '
 if format(0.000001,4,4,,3) \== '   0.0000'  then say 'failed in test 73 '
 if format(0.0000001,4,5,,2) \== '   1.00000E-7'  then
   say 'failed in test 74 '
 if format(0.0000001,4,4,4,3) \== '   1.0000E-0007'  then
   say 'failed in test 75 '
 if format(1000,4,4,,3) \== '   1.0000E+3'  then say 'failed in test 76 '
 if format(0.0000000000000000000001) \== '1E-22'  then say 'failed in test 77 '
 if format(0.0000000000000000000001,,,0,) \== '0.0000000000000000000001'  then
   say 'failed in test 78 '
 if format(0.0000001,,,0,3) \== '0.0000001'  then say 'failed in test 79 '
 if format('.00001',,,2,9) \== '0.00001'  then say 'failed in test 80 '
 if format('.000001',,,2,9) \== '0.000001'  then say 'failed in test 81 '
 if format('.0000001',,,2,9) \== '1E-07'  then say 'failed in test 82 '
 if format('.00000001',,,2,9) \== '1E-08'  then say 'failed in test 83 '
/* These from Kurt Maerker */
 if format(99.999,,2,,2) \== '1.00E+2'  then say 'failed in test 84 '
 if format(.999999,,4,2,2) \== '1.0000'  then say 'failed in test 85 '
 if format(.9999999,,5,2,2) \== '1.00000'  then say 'failed in test 86 '
 if format('.0000001',,,2,9) \== '1E-07'  then say 'failed in test 87 '
 if format('.00000001',,,2,9) \== '1E-08'  then say 'failed in test 88 '

/*
  Tests 89 - 110
  For 89 we get "9.9999999000   " as an example.
  So I am wondering if the test has been transcribed wrongly. I think the test
  meaning is that the format should be SCIENTIFIC (i.e. because of the 5th
  argument) but because the exponent is 0 then it has trailing blanks because
  of the rule "If the exponent would be 0 when a nonzero expp is specified,
  then expp+2 blanks are supplied for the exponent part of the result."

  The tests (89-110) are very similar and are testing the number of trailing
  spaces. What do you think?

 if format(9.9999999,1,10,1,1) \== '9.9999999000'  then say 'failed in test 89 '
 if format(9.9999999,1,10,1,2) \== '9.9999999000'  then say 'failed in test 90 '
 if format(9.9999999,1,10,2,1) \== '9.9999999000'  then say 'failed in test 91 '
 if format(9.9999999,1,10,2,2) \== '9.9999999000'  then say 'failed in test 92 '
 if format(9.9999999,1,10,2,3) \== '9.9999999000'  then say 'failed in test 93 '
 if format(9.9999999,1,10,4,3) \== '9.9999999000'  then say 'failed in test 94 '
 if format(9.9999999,1,8,1,1) \== '9.99999990'  then say 'failed in test 95 '
 if format(9.9999999,1,8,1,2) \== '9.99999990'  then say 'failed in test 96 '
 if format(9.99999999,1,10,1,1) \== '9.9999999900'  then say 'failed in test 97 '
 if format(9.99999999,1,10,1,2) \== '9.9999999900'  then say 'failed in test 98 '
 if format(9.99999999,1,10,1,3) \== '9.9999999900'  then say 'failed in test 99 '
 if format(9.99999999,1,10,2,1) \== '9.9999999900'  then say 'failed in test 100 '
 if format(9.99999999,1,10,2,2) \== '9.9999999900'  then say 'failed in test 101 '
 if format(9.99999999,1,10,2,3) \== '9.9999999900'  then say 'failed in test 102 '
 if format(9.99999999,1,10,3,1) \== '9.9999999900'  then say 'failed in test 103 '
 if format(9.99999999,1,10,3,2) \== '9.9999999900'  then say 'failed in test 104 '
 if format(9.99999999,1,10,3,3) \== '9.9999999900'  then say 'failed in test 105 '
 if format(9.99999999,1,10,4,3) \== '9.9999999900'  then say 'failed in test 106 '
 if format(9.99999999,1,10,5,3) \== '9.9999999900'  then say 'failed in test 107 '
 if format(9.99999999,1,8,1,1) \== '9.99999999'  then say 'failed in test 108 '
 if format(9.99999999,1,8,1,2) \== '9.99999999'  then say 'failed in test 109 '
 if format(9.99999999,1,8,2,1) \== '9.99999999'  then say 'failed in test 110 '
*/
/* These from Adrian Sutherland */
 NUMERIC DIGITS 3
 if format(' - 12.73',,4) \== '-12.7000'  then say 'failed in test 111 '
 if format(' - 12.73') \== '-12.7'       then say 'failed in test 112 '
 if format('12345.73',,,2,2) \== '1.23E+04'  then say 'failed in test 113 '
 if format('12345.73',,3,,0) \== '1.230E+4'  then say 'failed in test 114 '
 NUMERIC FORM ENGINEERING
 NUMERIC DIGITS 9
 if format('12345.73',,,2,2) \== '12.34573E+03'  then say 'failed in test 115 '
 if format('12345.73',,3,,0) \== '123.460E+3'  then say 'failed in test 116 '
 if format('123.45',,3,2,0) \== '123.450    '  then say 'failed in test 117 '
 if format(12.34,,,,0) \== '12.34E+0'  then say 'failed in test 118 '

say "FORMAT OK"
