/* LINEOUT */
say "Look for LINEOUT OK"
file="TEST FILE A"
call lineout file, "Line 1"
call lineout file, "Line 2"
call lineout file, "Line 3"
call lineout file, "Line 4"
call lineout file, "Line 5"
call lineout file
if lines(file)!=5 then              say 'failed in test          1'
if linein(file)!="Line 1" then      say 'failed in test          2'
if linein(file)!="Line 2" then      say 'failed in test          3'
if linein(file)!="Line 3" then      say 'failed in test          4'
if linein(file)!="Line 4" then      say 'failed in test          5'
if linein(file)!="Line 5" then      say 'failed in test          6'
if linein(file)!="" then            say 'failed in test          7'
call lineout file
call lineout file, "Done 3", 3
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
call lineout file "f 80", "Line 1"
call lineout file, "Line 2"
call lineout file, "Line 3"
call lineout file, "Line 4"
call lineout file, "Line 5"
call lineout file
if lines(file)!=5 then              say 'failed in test          15'
if linein(file)!="Line 1" then      say 'failed in test          16'
if linein(file)!="Line 2" then      say 'failed in test          17'
if linein(file)!="Line 3" then      say 'failed in test          18'
if linein(file)!="Line 4" then      say 'failed in test          19'
if linein(file)!="Line 5" then      say 'failed in test          20'
if linein(file)!="" then            say 'failed in test          21'
call lineout file
call lineout file, "Done 3 Long", 3
call lineout file
if lines(file)!=5 then              say 'failed in test          22'
if linein(file)!="Line 1" then      say 'failed in test          23'
if linein(file)!="Line 2" then      say 'failed in test          24'
if linein(file)!="Done 3 Long" then say 'failed in test          25'
if linein(file)!="Line 4" then      say 'failed in test          26'
if linein(file)!="Line 5" then      say 'failed in test          27'
if linein(file)!="" then            say 'failed in test          28'
call lineout file
"erase" file
say "LINEOUT OK"
