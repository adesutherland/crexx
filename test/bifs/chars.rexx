/* CHARS */
say "Look for CHARS OK"
file="TEST FILE A"
call lineout file "F 80", "Line 1"
call lineout file, "Line 2"
call lineout file
if chars(file)!=162 then            say 'failed in test          1'
Call charin file, 30
if chars(file)!=132 then            say 'failed in test          2'
call lineout file
'erase' file
say "CHARS OK"
