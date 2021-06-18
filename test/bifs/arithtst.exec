/* REXX */
/* Test case generated from arithmetic_test.in */
Signal On Syntax
cnt.=0
Call ver 12 + 8  , 20
Call ver 12 - 8  , 4
Call ver 12 * 8  , 96
Call ver 12 // 8 , 4
Call ver 12 % 8  , 1
Call ver 12 ** 8 , 429981696
Call ver 20 + 4  , 24
Call ver 20 - 4  , 16
Call ver 20 * 4  , 80
Call ver 20 // 4 , 0
Call ver 20 % 4  , 5
Call ver 20 ** 4 , 160000
Call ver 4  +   -17  ,  -13
Call ver 4  -   -17  ,  21
Call ver 4  *   -17  ,  -68
Call ver 4  %   -17  ,  0
Call ver 4  /   -17  ,  -0.23529411764705882353
Call ver 4  //  -17  ,  4
Call ver 4  **  -17  ,  5.82076609E-11
Call ver -17  +   4  ,  -13
Call ver -17  -   4  ,  -21
Call ver -17  *   4  ,  -68
Call ver -17  %   4  ,  -4
Call ver -17  /   4  ,  -4.25
Call ver -17  //  4  ,  -1
Call ver -17  **  4  ,  83521
id=27
x=9 / 0
Call err "SYNTAX" ID
R27:
id=''
id=28
x=9 // 0
Call err "SYNTAX" ID
R28:
id=''
id=29
x=9 % 0
Call err "SYNTAX" ID
R29:
id=''
Call ver 0**0 , 1
Call ver 3*/* comment */*3 , 27
Call over
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
