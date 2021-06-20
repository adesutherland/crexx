/* This can be a development test by taking it partially from the top. */
/* A minimum of SAY and EXIT is needed to get a runnable test. */
/* A dump of the pseudo-code should show two byte operand then one byte
operator "Say" for CRX pseudo-code. */
say 'Regression test with all sorts of pseudo-codes. Look for "Done OK"'
/* Simplest IF has a "Then" operator to compare operand with '0' and '1' */
if 0 then exit
if 0 then exit; else nop
/* Selects are much the same. */
select
when 0 then exit
when 1 then nop
otherwise nop
end
/* SELECT has error raised if nothing satisfied. */
select
when 1 then nop
end
/* CRX has different assignment of constants than non-constants. */
abc=0
pqr=abc
if pqr then exit
/* CRX compiles out 'stemming'. */
stema.3 = 0
stemb.abc.0 = stema.3
if stemb.0.abc then exit
/* Unary operators */
abc=+1;if \abc then exit
abc=\1;if abc then exit
abc=-1;if \(-abc) then exit
/* Binary operators */
if abc=abc then nop
if abc\=abc then exit
if abc<abc then exit
if abc<=abc then nop
if abc>=abc then nop
if abc>abc then exit
if abc==abc then nop
if abc\==abc then exit
if abc<<abc then exit
if abc<<=abc then nop
if abc>>=abc then nop
if abc>>abc then exit
if 5%2 \= 2 then exit
if 2*2 \= 4 then exit
if 2/2 \= 1 then exit
if 5//2 \= 1 then exit
if (1 && 1) \= 0 then exit
if (1 | 0) \= 1 then exit
if (1 & 1) \= 1 then exit
if (2-1) \= 1 then exit
if (2+1) \= 3 then exit
if "a"||"b" \== "ab" then exit
if "a" "b" \== "a b" then exit
if 2**0 \== 1 then exit
A = 1 > 2
if A then exit
drop A
if A\=='A' then exit
drop A.
if A.\=='A.' then exit
if 0 then do
drop A.B
drop (A.)
end
/*
address
address DOS
address DOS "Dir"
address value "DOS"
address value "DOS" with output stem A.
address value "DOS" with output replace stem A.
address "DOS" with output append stream A. input stream B.
"DIR"
*/
if datatype("b",'L') then nop
if substr("abc",2,1) \== 'b' then exit
j=2
if substr("abc",j,1) \== 'b' then exit
if length('abc') \= 3 then exit
if 0 then do
if countstr('c',"abcc") \= 2 then exit
if max(2,1) \= 2 then exit
if min(3,2,1) \= 1 then exit
end
nop
numeric form Engineering
numeric form value('e')
numeric fuzz 0
numeric digits
numeric fuzz
numeric form
numeric digits 9
call digits
if digits() <> 9 then exit
parse version x;say x
parse source x;say x
parse value 2+2 with x
parse var x y
parse version a,b
if 0 then do
parse testin x
parse pull x
parse arg x
end
signal on lostdigits
signal off lostdigits
signal Trouble
say "Signal didn't work"
Trouble:
trace 'O'
call on notready name sub
options "gosh"
if 0 then do
interpret "nop"
push barrow
queue intest
end
call sub
x=ftn()
if x <> 99 then exit
do 99
end
do 99 while 1
end
do forever
leave
end
do forever while 0
end
do n=1 by 5 for 3
iterate
end
do n=1 to 5 until 0
end
do n=1
leave
end
if 0 then do
do a.b.c=1 by 5 for 3
nop
end
do a.b.c=1 to 5 until 0
nop
end
end
interpret "nop;interpret 'say 99'"
if \abbrev('Print','Pri') then exit
if left('abc def',7) \== 'abc de' then exit
if overlay('123','abc',5,6,'+') \== 'abc+123+++' then exit
if substr('abc',2,6,'.') \== 'bc....' then exit
say
say "Done OK"
exit
sub:return
ftn:return 99
procedure expose A. A.B (A.) (A.B)
address error with output normal error append stream A.
