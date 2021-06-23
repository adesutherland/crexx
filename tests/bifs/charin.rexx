/* LINEIN */
say "Look for CHARIN OK"
file="TEST FILE A"
cr = '0D'x
call lineout file, "Line 1"
call lineout file, "Line 2"
call lineout file, "Line 3"
call lineout file, "Line 4"
call lineout file, "Line 5"
call lineout file
if charin(file)!="L" then           say 'failed in test          1'
if charin(file,,6)!="ine 1"cr then  say 'failed in test        2'
if charin(file,,7)!="Line 2"cr then say 'failed in test          3'
if charin(file,,7)!="Line 3"cr then say 'failed in test          4'
if charin(file,,7)!="Line 4"cr then say 'failed in test          5'
if charin(file,,7)!="Line 5"cr then say 'failed in test          6'
if charin(file)!="" then            say 'failed in test          7'
call lineout file
"erase" file
say "CHARIN OK"
