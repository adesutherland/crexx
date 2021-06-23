/* MATHS TEST */
  say "Look for MATHS OK"
  NUMERIC DIGITS 15
  if 5 * 7 \= 35                             then say 'failed in test  1 '
  if 46340 * 46340 \= 2147395600             then say 'failed in test  2 '
  if 46341 * 46341 \= 2147488281             then say 'failed in test  3 '
  if 737787 * 86400 * 1000000 \= ,
                        63744796800000000    then say 'failed in test  4 '
  if 1.23 * 2 \= 2.46                        then say 'failed in test  5 '

  if 14 / 7 \= 2                             then say 'failed in test  6 '
  if 2147395600 / 46340 \= 46340             then say 'failed in test  7 '
  if 2147488281 / 46341 \= 46341             then say 'failed in test  8 '
  if 5 / 2 \= 2.5                            then say 'failed in test  9 '
  if 1 / 3 \= 0.333333333333333              then say 'failed in test  10 '

  if 100 + 50 \= 150                         then say 'failed in test  11 '
  if '100' + '50' \= 150                     then say 'failed in test  12 '
  if 100.5 + 50 \= 150.5                     then say 'failed in test  13 '
  if 100.5 + 50.5 \= 151                     then say 'failed in test  14 '
  if 100.5 + 50.6 \= 151.1                   then say 'failed in test  15 '
  if 2147480001 + 10000 \= 2147490001        then say 'failed in test  16 '

  if 100 - 50 \= 50                          then say 'failed in test  17 '
  if '100' - '50' \= 50                      then say 'failed in test  18 '
  if 100.5 - 50 \= 50.5                      then say 'failed in test  19 '
  if 100.5 - 50.5 \= 50                      then say 'failed in test  20 '
  if 100.5 - 50.6 \= 49.9                    then say 'failed in test  21 '
  if -2147480001 - 10000 \= -2147490001      then say 'failed in test  22 '

  say "MATHS OK"