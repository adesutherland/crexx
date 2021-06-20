/* All error msgs to standard output. */
do j=0 to 90
call SayIt(j)
do k=1 to 50
if k//10 \=0 then
call Sayit(j'.'k)
end k
end j
say "ERRORTEXT OK"
exit
Sayit:
text = errortext(arg(1))
if text \== '' then say left(arg(1),6)'['text']'
return
