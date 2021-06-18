Numeric Digits 88
__Digits.__Level = 9
__Form.__Level = 'S'
__Fuzz.__Level = 0
__Limit_ExponentDigits = 45
say Arithop(1e-6,'+',0)   1e-6+0
say Arithop(1e-7,'+',0)   1e-7+0
say Arithop(1e-18,'+',0)  1e-18+0
say Arithop(1e-19,'+',0)  1e-19+0
Say ArithOp( 2, '**', -19 ) 0.00000190734863
Say ArithOp( 2, '**', -20 ) 0.000000953674316
Return
ArithOp:
arg Number1, Operator, Number2
/* The Operator will be applied to Number1 and Number2 under the numeric
settings __Digits.__Level, __Form.__Level, __Fuzz.__Level */
/* The result is the result of the operation, or the raising of a 'SYNTAX' or
'LOSTDIGITS' condition. */
/* Variables with digit 1 in their names refer to the first argument of the
operation. Variables with digit 2 refer to the second argument. Variables
with digit 3 refer to the result. */
/* The quotations and page numbers are from the first reference in
Annex C of this standard. */
/* The operands are prepared first. (Page 130) Function Prepare does this,
separating sign, mantissa and exponent. */
v = Prepare(Number1,__Digits.__Level)
parse var v Sign1 Mantissa1 Exponent1
v = Prepare(Number2,__Digits.__Level)
parse var v Sign2 Mantissa2 Exponent2
/* The calculation depends on the operator. The routines set Sign3
Mantissa3 and Exponent3. */
Comparator = ''
select
when Operator == '*' then call Multiply
when Operator == '/' then call DivType
when Operator == '**' then call Power
when Operator == '%' then call DivType
when Operator == '//' then call DivType
otherwise call AddSubComp
end
call PostOp /* Assembles Number3 */
if Comparator \== '' then do
/* Comparison requires the result of subtraction made into a logical */
/* value. */
t = '0'
select
when left(Number3,1) == '-' then
if wordpos(Comparator,'< <= <> >< \= \>') > 0 then t = '1'
when Number3 \== '0' then
if wordpos(Comparator,'> >= <> >< \= \<') > 0 then t = '1'
otherwise
if wordpos(Comparator,'>= = =< \< \>') > 0 then t = '1'
end
Number3 = t
end
return Number3 /* From ArithOp */
/* Activity before every operation: */
Prepare: /* Returns Sign Mantissa and Exponent */
/* Preparation of operands, Page 130 */
/* "...terms being operated upon have leading zeros removed (noting the
position of any decimal point, and leaving just one zero if all the digits in
the number are zeros) and are then truncated to DIGITS+1 significant digits
(if necessary)..." */
arg Number, Digits
/* Blanks are not significant. */
/* The exponent is separated */
parse upper value space(Number,0) with Mantissa 'E' Exponent
if Exponent == '' then Exponent = '0'
/* The sign is separated and made explicit. */
Sign = '+' /* By default */
if left(Mantissa,1) == '-' then Sign = '-'
if verify(left(Mantissa,1),'+-') = 0 then Mantissa = substr(Mantissa,2)
/* Make the decimal point implicit; remove any actual Point from the
mantissa. */
p = pos('.',Mantissa)
if p > 0 then Mantissa = delstr(Mantissa,p,1)
else p = 1+length(Mantissa)
/* Drop the leading zeros */
do q = 1 to length(Mantissa) - 1
if substr(Mantissa,q,1) \== '0' then leave
p = p - 1
end q
Mantissa = substr(Mantissa,q)
/* Detect if Mantissa suggests more significant digits than DIGITS
caters for. */
do j = Digits+1 to length(Mantissa)
if substr(Mantissa,j,1) \== '0' then call __Raise 'LOSTDIGITS', Number
end j
/* Combine exponent with decimal point position, Page 127 */
/* "Exponential notation means that the number includes a power of ten
following an 'E' that indicates how the decimal point will be shifted. Thus
4E9 is just a shorthand way of writing 4000000000 " */
/* Adjust the exponent so that decimal point would be at right of
the Mantissa. */
Exponent = Exponent - (length(Mantissa) - p + 1)
/* Truncate if necessary */
t = length(Mantissa) - (Digits+1)
if t > 0 then do
Exponent = Exponent + t
Mantissa = left(Mantissa,Digits+1)
end
if Mantissa == '0' then Exponent = 0
return Sign Mantissa Exponent
/* Activity after every operation. */
/* The parts of the value are composed into a single string, Number3. */
PostOp:
/* Page 130 */
/* 'traditional' rounding */
t = length(Mantissa3) - __Digits.__Level
if t > 0 then do
/* 'traditional' rounding */
Mantissa3 = left(Mantissa3,__Digits.__Level+1) + 5
if length(Mantissa3) > __Digits.__Level+1 then
/* There was 'carry' */
Exponent3 = Exponent3 + 1
Mantissa3 = left(Mantissa3,__Digits.__Level)
Exponent3 = Exponent3 + t
end
/* "A result of zero is always expressed as a single character '0' "*/
if verify(Mantissa3,'0') = 0 then Number3 = '0'
else do
if Operator == '/' | Operator == '**' then do
/* Page 130 "For division, insignificant trailing zeros are removed
after rounding." */
/* Page 133 "... insignificant trailing zeros are removed." */
do q = length(Mantissa3) by -1 to 2
if substr(Mantissa3,q,1) \== '0' then leave
Exponent3 = Exponent3 + 1
end q
Mantissa3 = substr(Mantissa3,1,q)
end
if Floating() == 'E' then do /* Exponential format */
Exponent3 = Exponent3 + (length(Mantissa3)-1)
/* Page 136 "Engineering notation causes powers of ten to expressed as a
multiple of 3 - the integer part may therefore range from 1 through
999." */
g = 1
if __Form.__Level == 'E' then do
/* Adjustment to make exponent a multiple of 3 */
g = Exponent3//3 /* Recursively using ArithOp as
an external routine. */
if g < 0 then g = g + 3
Exponent3 = Exponent3 - g
g = g + 1
if length(Mantissa3) < g then
Mantissa3 = left(Mantissa3,g,'0')
end /* Engineering */
/* Exact check on the exponent. */
if Exponent3 > __Limit_ExponentDigits then
call __Raise 'SYNTAX', 42.1, Number1, Operator, Number2
if -__Limit_ExponentDigits > Exponent3 then
call __Raise 'SYNTAX', 42.2, Number1, Operator, Number2
/* Insert any decimal [point. */
if length(Mantissa3) \= g then Mantissa3 = insert('.',Mantissa3,g)
/* Insert the E */
if Exponent3 >= 0 then Number3 = Mantissa3'E+'Exponent3
else Number3 = Mantissa3'E'Exponent3
end /* Exponent format */
else do /* 'pure number' notation */
p = length(Mantissa3) + Exponent3 /* Position of the point within
Mantissa */
/* Add extra zeros needed on the left of the point. */
if p < 1 then do
Mantissa3 = copies('0',1 - p)||Mantissa3
p = 1
end
/* Add needed zeros on the right. */
if p > length(Mantissa3) then
Mantissa3 = Mantissa3||copies('0',p-length(Mantissa3))
/* Format with decimal point. */
Number3 = Mantissa3
if p < length(Number3) then Number3 = insert('.',Mantissa3,p)
else Number3 = Mantissa3
end /* pure */
if Sign3 == '-' then Number3 = '-'Number3
end /* Non-Zero */
return
/* This tests whether exponential notation is needed. */
Floating:
/* The rule in the reference has been improved upon. */
t = ''
if Exponent3+length(Mantissa3) > __Digits.__Level then t = 'E'
if length(Mantissa3) + Exponent3 < -5 then t = 'E'
return t
/* Add, Subtract and Compare. */
AddSubComp: /* Page 130 */
/* This routine is used for comparisons since comparison is
defined in terms of subtraction. Page 134 */
/* "Numeric comparison is affected by subtracting the two numbers(calculating
the difference) and then comparing the result with '0'." */
NowDigits = __Digits.__Level
if Operator \=='+' & Operator \== '-' then do
Comparator = Operator
/* Page 135 "The effect of NUMERIC FUZZ is to temporarily reduce the value
of NUMERIC DIGITS by the NUMERIC FUZZ value for each numeric comparison" */
NowDigits = NowDigits - __Fuzz.__Level
end
/* Page 130 "If either number is zero then the other number ... is used as
the result (with sign adjustment as appropriate). */
if Mantissa2 == '0' then do /* Result is the 1st operand */
Sign3=Sign1; Mantissa3 = Mantissa1; Exponent3 = Exponent1
return ''
end
if Mantissa1 == '0' then do /* Result is the 2nd operand */
Sign3 = Sign2; Mantissa3 = Mantissa2; Exponent3 = Exponent2
if Operator \== '+' then if Sign3 = '+' then Sign3 = '-'
else Sign3 = '+'
return ''
end
/* The numbers may need to be shifted into alignment. */
/* Change to make the exponent to reflect a decimal point on the left,
so that right truncation/extension of mantissa doesn't alter exponent. */
Exponent1 = Exponent1 + length(Mantissa1)
Exponent2 = Exponent2 + length(Mantissa2)
/* Deduce the implied zeros on the left to provide alignment. */
Align1 = 0
Align2 = Exponent1 - Exponent2
if Align2 > 0 then do /* Arg 1 provides a more significant digit */
Align2 = min(Align2,NowDigits+1) /* No point in shifting further. */
/* Shift to give Arg2 the same exponent as Arg1 */
Mantissa2 = copies('0',Align2) || Mantissa2
Exponent2 = Exponent1
end
if Align2 < 0 then do /* Arg 2 provides a more significant digit */
/* Shift to give Arg1 the same exponent as Arg2 */
Align1 = -Align2
Align1 = min(Align1,NowDigits+1) /* No point in shifting further. */
Align2 = 0
Mantissa1 = copies('0',Align1) || Mantissa1
Exponent1 = Exponent2
end
/* Maximum working digits is NowDigits+1. Footnote 41. */
SigDigits = max(length(Mantissa1),length(Mantissa2))
SigDigits = min(SigDigits,NowDigits+1)
/* Extend a mantissa with right zeros, if necessary. */
Mantissa1 = left(Mantissa1,SigDigits,'0')
Mantissa2 = left(Mantissa2,SigDigits,'0')
/* The exponents are adjusted so that
the working numbers are integers, ie decimal point on the right. */
Exponent3 = Exponent1-SigDigits
Exponent1 = Exponent3
Exponent2 = Exponent3
if Operator = '+' then
Mantissa3 = (Sign1 || Mantissa1) + (Sign2 || Mantissa2)
else Mantissa3 = (Sign1 || Mantissa1) - (Sign2 || Mantissa2)
/* Separate the sign */
if Mantissa3 < 0 then do
Sign3 = '-'
Mantissa3 = substr(Mantissa3,2)
end
else Sign3 = '+'
/* "The result is then rounded to NUMERIC DIGITS digits if necessary,
taking into account any extra (carry) digit on the left after addition,
but otherwise counting from the position corresponding to the most
significant digit of the terms being added or subtracted." */
if length(Mantissa3) > SigDigits then SigDigits = SigDigits+1
d = SigDigits - NowDigits /* Digits to drop. */
if d <= 0 then return
t = length(Mantissa3) - d /* Digits to keep. */
/* Page 130. "values of 5 through 9 are rounded up, values of 0 through 4 are
rounded down." */
if t > 0 then do
/* 'traditional' rounding */
Mantissa3 = left(Mantissa3, t + 1) + 5
if length(Mantissa3) > t+1 then
/* There was 'carry' */
/* Keep the extra digit unless it takes us over the limit. */
if t < NowDigits then t = t+1
else Exponent3 = Exponent3+1
Mantissa3 = left(Mantissa3,t)
Exponent3 = Exponent3 + d
end /* Rounding */
else Mantissa3 = '0'
return /* From AddSubComp */
/* Multiply operation: */
Multiply: /* p 131 */
/* Note the sign of the result */
if Sign1 == Sign2 then Sign3 = '+'
else Sign3 = '-'
/* Note the exponent */
Exponent3 = Exponent1 + Exponent2
if Mantissa1 == '0' then do
Mantissa3 = '0'
return
end
/* Multiply the Mantissas */
Mantissa3 = ''
do q=1 to length(Mantissa2)
Mantissa3 = Mantissa3'0'
do substr(Mantissa2,q,1)
Mantissa3 = Mantissa3 + Mantissa1
end
end q
return /* From Multiply */
/* Types of Division: */
DivType: /* p 131 */
/* Check for divide-by-zero */
if Mantissa2 == '0' then call __Raise 'SYNTAX', 42.3
/* Note the exponent of the result */
Exponent3 = Exponent1 - Exponent2
/* Compute (one less than) how many digits will be in the integer
part of the result. */
IntDigits = length(Mantissa1) - Length(Mantissa2) + Exponent3
/* In some cases, the result is known to be zero. */
if Mantissa1 = 0 | (IntDigits < 0 & Operator = '%') then do
Mantissa3 = 0
Sign3 = '+'
Exponent3 = 0
return
end
/* In some cases, the result is known to be to be the first argument. */
if IntDigits < 0 & Operator == '//' then do
Mantissa3 = Mantissa1
Sign3 = Sign1
Exponent3 = Exponent1
return
end
/* Note the sign of the result. */
if Sign1 == Sign2 then Sign3 = '+'
else Sign3 = '-'
/* Make Mantissa1 at least as large as Mantissa2 so Mantissa2 can be
subtracted without causing leading zero to result. Page 131 */
a = 0
do while Mantissa2 > Mantissa1
Mantissa1 = Mantissa1'0'
Exponent3 = Exponent3 - 1
a = a + 1
end
/* Traditional divide */
Mantissa3 = ''
/* Subtract from part of Mantissa1 that has length of Mantissa2 */
x = left(Mantissa1,length(Mantissa2))
y = substr(Mantissa1,length(Mantissa2)+1)
do forever
/* Develop a single digit in z by repeated subtraction. */
z = 0
do forever
x = x - Mantissa2
if left(x,1) == '-' then leave
z = z + 1
end
x = x + Mantissa2 /* Recover from over-subtraction */
/* The digit becomes part of the result */
Mantissa3 = Mantissa3 || z
if Mantissa3 == '0' then Mantissa3 = '' /* A single leading
zero can happen. */
/* x||y is the current residue */
if y == '' then if x = 0 then leave /* Remainder is zero */
if length(Mantissa3) > __Digits.__Level then leave /* Enough digits
in the result */
/* Check type of division */
if Operator \== '/' then do
if IntDigits = 0 then leave
IntDigits = IntDigits - 1
end
/* Prepare for next digit */
/* Digits come from y, until that is exhausted. */
/* When y is exhausted an extra zero is added to Mantissa1 */
if y == '' then do
y = '0'
Exponent3 = Exponent3 - 1
a = a + 1
end
x = x || left(y,1)
y = substr(y,2)
end /* Iterate for next digit. */
Remainder = x || y
Exponent3 = Exponent3 + length(y) /* The loop may have been left early. */
/* Leading zeros are taken off the Remainder. */
do while length(Remainder) > 1 & Left(Remainder,1) == '0'
Remainder = substr(Remainder,2)
end
if Operator \== '/' then do
/* Check whether % would fail, even if operation is // */
/* Page 133. % could fail by needing exponential notation */
if Floating() == 'E' then do
if Operator == '%' then MsgNum = 26.11
else MsgNum = 26.12
call __Raise 'SYNTAX', MsgNum, Number1 , Number2, __Digits.__Level
end
end
if Operator == '//' then do
/* We need the remainder */
Sign3 = Sign1
Mantissa3 = Remainder
Exponent3 = Exponent1 - a
end
return /* From DivType */
/* The Power operation: */
Power: /* page 132 */
/* The second argument should be an integer */
if \WholeNumber2() then call __Raise 'SYNTAX', 26.8, Number2
/* Lhs to power zero is always 1 */
if Mantissa2 == '0' then do
Sign3 = '+'
Mantissa3 = '1'
Exponent3 = '0'
return
end
/* Pages 132-133 The Power algorithm */
Rhs = left(Mantissa2,length(Mantissa2)+Exponent2,'0')/* Explicit
integer form */
L = length(Rhs)
b = X2B(D2X(Rhs)) /* Makes Rhs in binary notation */
/* Ignore initial zeros */
do q = 1 by 1
if substr(b,q,1) \== '0' then leave
end q
a = 1
do forever
/* Page 133 "Using a precision of DIGITS+L+1" */
if substr(b,q,1) == '1' then do
a = Recursion('*',Sign1 || Mantissa1'E'Exponent1)
if left(a,2) == 'MN' then signal PowerFailed
end
/* Check for finished */
if q = length(b) then leave
/* Square a */
a = Recursion('*',a)
if left(a,2) == 'MN' then signal PowerFailed
q = q + 1
end
/* Divide into one for negative power */
if Sign2 == '-' then do
Sign2 = '+'
a = Recursion('/')
if left(a,2) == 'MN' then signal PowerFailed
end
/* Split the value up so that PostOp can put it together with rounding */
Parse value Prepare(a,__Digits.__Level+L+1) with Sign3 Mantissa3 Exponent3
return
PowerFailed:
/* Distinquish overflow and underflow */
RcWas = substr(a,4)
if Sign2 = '-' then if RcWas == '42.1' then RcWas = '42.2'
else RcWas = '42.1'
call __Raise 'SYNTAX', RcWas, Number1, '**', Number2
/* No return */
WholeNumber2:
numeric digits Digits
if __Form.__Level == 'S' then numeric form scientific
else numeric form engineering
return datatype(Number2,'W')
Recursion: /* Called only from '**' */
numeric digits __Digits.__Level + L + 1
signal on syntax name Overflowed
/* Uses ArithOp again under new numeric settings. */
if arg(1) == '/' then return 1 / a
else return a * arg(2)
Overflowed:
return 'MN '.MN
