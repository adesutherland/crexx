/* LINEIN */
say "Look for LINEIN OK"
file="TEST FILE A"
cr = '0D'x
call lineout file, "Line 1"
call lineout file, "Line 2"
call lineout file, "Line 3"
call lineout file, "Line 4"
call lineout file, "Line 5"
call lineout file
if linein(file)!="Line 1" then say 'failed in test          1'
if linein(file)!="Line 2" then say 'failed in test          2'
if linein(file)!="Line 3" then say 'failed in test          3'
if linein(file)!="Line 4" then say 'failed in test          4'
if linein(file)!="Line 5" then say 'failed in test          5'
if linein(file)!="" then       say 'failed in test          6'
if linein(file,3)!="Line 3" then say 'failed in test        7'
if linein(file,2,2)!="Line 2"cr"Line 3"cr then say 'failed in test        8'
call lineout file
"erase" file
say "LINEIN OK"
