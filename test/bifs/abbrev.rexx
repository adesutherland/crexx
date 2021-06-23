/* ABBREV */
say "Look for ABBREV OK"
/* These from the Rexx book. */
if \abbrev('Print','Pri') then say 'failed in test 1 '
if abbrev('PRINT','Pri') then say 'failed in test 2 '
if abbrev('PRINT','PRI',4) then say 'failed in test 3 '
if abbrev('PRINT','PRY') then say 'failed in test 4 '
if \abbrev('PRINT','') then say 'failed in test 5 '
if abbrev('PRINT','',1) then say 'failed in test 6 '
/* These from Mark Hessling. */
if \abbrev('information','info',4) then say 'failed in test 7 '
if \abbrev('information','',0) then say 'failed in test 8 '
if abbrev('information','Info',4) then say 'failed in test 9 '
if abbrev('information','info',5) then say 'failed in test 10 '
if abbrev('information','info ') then say 'failed in test 11 '
if \abbrev('information','info',3) then say 'failed in test 12 '
if abbrev('info','information',3) then say 'failed in test 13 '
if abbrev('info','info',5) then say 'failed in test 14 '
say "ABBREV OK"
