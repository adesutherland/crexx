/* TRANSLATE */
  say "Look for TRANSLATE OK"
/* These from the Rexx book. */
  if translate('abcdef') \== 'ABCDEF'   then say 'failed in test          1 '
  if translate('abbc','&','b') \== 'a&&c'   then say 'failed in test          2 '
  if translate('abcdef','12','ec') \== 'ab2d1f'   then say 'failed in test          3 '
  if translate('abcdef','12','abcd','.') \== '12..ef'   then say 'failed in test          4 '
  if translate('4123','abcd','1234') \== 'dabc'   then say 'failed in test          5 '
/* These from Mark Hessling. */
  if translate("Foo Bar") \==  "FOO BAR"        then say 'failed in test          6 '
  if translate("Foo Bar",,"") \==  "Foo Bar"    then say 'failed in test          7 '
  if translate("Foo Bar","",) \==  "       "    then say 'failed in test          8 '
  if translate("Foo Bar","",,'*') \==  "*******"  then say 'failed in test          9 '
/*  if translate("Foo Bar",xrange('01'x,'ff'x)) \==  "Gpp!Cbs"  then say 'failed in test         10 ' ascii/ebcic */
  if translate("","klasjdf","woieruw") \==  ""   then say 'failed in test         11 '
  if translate("foobar","abcdef","fedcba") \==  "aooefr"  then say 'failed in test         12 '
  say "TRANSLATE OK"
