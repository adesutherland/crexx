/* SUBWORD */
say "Look for SUBWORD OK"
/* These from the Rexx book. */
if subword('Now is the time',2,2) \== 'is the' then say 'failed in test 1 '
if subword('Now is the time',3) \== 'the time' then say 'failed in test 2 '
if subword('Now is the time',5) \== '' then say 'failed in test 3 '
/* These from Mark Hessling. */
if subword(" to be or not to be ",5) \== "to be" then say 'failed in test 4 '
if subword(" to be or not to be ",6) \== "be" then say 'failed in test 5 '
if subword(" to be or not to be ",7) \== "" then say 'failed in test 6 '
if subword(" to be or not to be ",8,7) \== "" then say 'failed in test 7 '
if subword(" to be or not to be ",3,2) \== "or not" then say 'failed in test 8 '
if subword(" to be or not to be ",1,2) \== "to be" then say 'failed in test 9 '
if subword(" to be or not to be ",4,2) \== "not to" then say 'failed in test 10 '
if subword("abc de f", 3) \== 'f' then say 'failed in test 11 '
say "SUBWORD OK"
