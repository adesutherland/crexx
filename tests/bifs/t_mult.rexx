/* REXX */
/* Test case generated from t_mult.in */
numeric digits 9

Signal On Syntax
cnt.=0
Call ver  123456789 * 0.00005 * 3333.333 * 21.43 , 440946453
Call ver  123456789 * 0.00005 * 21.43 * 3333.333 , 440946453
Call ver  123456789 * 3333.333 * 0.00005 * 21.43 , 440946455
Call ver  123456789 * 3333.333 * 21.43 * 0.00005 , 440946454
Call ver  123456789 * 21.43 * 0.00005 * 3333.333 , 440946456
Call ver  123456789 * 21.43 * 3333.333 * 0.00005 , 440946454
Call ver  0.00005 * 123456789 * 3333.333 * 21.43 , 440946453
Call ver  0.00005 * 123456789 * 21.43 * 3333.333 , 440946453
Call ver  0.00005 * 3333.333 * 123456789 * 21.43 , 440946453
Call ver  0.00005 * 3333.333 * 21.43 * 123456789 , 440946454
Call ver  0.00005 * 21.43 * 123456789 * 3333.333 , 440946453
Call ver  0.00005 * 21.43 * 3333.333 * 123456789 , 440946454
Call ver  3333.333 * 123456789 * 0.00005 * 21.43 , 440946455
Call ver  3333.333 * 123456789 * 21.43 * 0.00005 , 440946454
Call ver  3333.333 * 0.00005 * 123456789 * 21.43 , 440946453
Call ver  3333.333 * 0.00005 * 21.43 * 123456789 , 440946454
Call ver  3333.333 * 21.43 * 123456789 * 0.00005 , 440946454
Call ver  3333.333 * 21.43 * 0.00005 * 123456789 , 440946454
Call ver  21.43 * 123456789 * 0.00005 * 3333.333 , 440946456
Call ver  21.43 * 123456789 * 3333.333 * 0.00005 , 440946454
Call ver  21.43 * 0.00005 * 123456789 * 3333.333 , 440946453
Call ver  21.43 * 0.00005 * 3333.333 * 123456789 , 440946454
Call ver  21.43 * 3333.333 * 123456789 * 0.00005 , 440946454
Call ver  21.43 * 3333.333 * 0.00005 * 123456789 , 440946454
Call over
over:
Parse Arg how
Say how
Say cnt.0ok  'ok'
Say cnt.0err 'errors'
Select
  When how<>'' Then   Exit 12
  When cnt.err=0 Then Exit 0
  Otherwise           Exit 8
  End

syntax:
If id<>'' Then Do
  say 'expected syntax error in case' id
  cnt.0ok=cnt.0ok+1
  Signal On Syntax
  Interpret 'Signal R'id
  End
Else Do
  say 'Unexpected syntax error in line' sigl
  cnt.0err=cnt.0err+1
  Call over 'premature end'
  End

novalue:
If id<>'' Then Do
  say 'Expected novalue raised in case' id
  cnt.0ok=cnt.0ok+1
  Signal On Novalue
  Interpret 'Signal R'id
  End
Else Do
  say 'Unexpected syntax error in line' sigl
  cnt.0err=cnt.0err+1
  Call over 'premature end'
  End

ver:
If arg(1)==arg(2) Then
  cnt.0ok=cnt.0ok+1
Else Do
  say 'verify error in case' sigl
  say 'expected:' arg(2)
  say '   found:' arg(1)
  cnt.0err=cnt.0err+1
  Say cnt.0err
  End
Return

err:
  Parse Arg w
  Say 'Expected' w 'condition not raised id='id
  cnt.0err=cnt.0err+1
  Return
