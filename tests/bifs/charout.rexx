/* CHAROUT */

say "Look for CHAROUT OK"
cr = '0D'x
file="TEST FILE A"
call charout file "F 6", "Line 1"cr
call charout file, "Line 2"cr
call charout file, "Line 3"cr
call charout file, "Line 4"cr
call charout file, "Line 5"cr
call lineout file
if lines(file)!=5 then              say 'failed in test          1'
if linein(file)!="Line 1" then      say 'failed in test          2'
if linein(file)!="Line 2" then      say 'failed in test          3'
if linein(file)!="Line 3" then      say 'failed in test          4'
if linein(file)!="Line 4" then      say 'failed in test          5'
if linein(file)!="Line 5" then      say 'failed in test          6'
if linein(file)!="" then            say 'failed in test          7'
call lineout file
call charout file, "Done 3", 15
call lineout file
if lines(file)!=5 then              say 'failed in test          8'
if linein(file)!="Line 1" then      say 'failed in test          9'
if linein(file)!="Line 2" then      say 'failed in test          10'
if linein(file)!="Done 3" then      say 'failed in test          11'
if linein(file)!="Line 4" then      say 'failed in test          12'
if linein(file)!="Line 5" then      say 'failed in test          13'
if linein(file)!="" then            say 'failed in test          14'
call lineout file
"erase" file
say "CHAROUT OK"
exit 0
