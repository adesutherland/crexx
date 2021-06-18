/* LINES */
say "Look for LINES OK"
file="TEST FILE A"
call lineout file, "Line 1"
call lineout file, "Line 2"
call lineout file, "Line 3"
call lineout file, "Line 4"
call lineout file, "Line 5"
call lineout file
if lines(file)!=5 then              say 'failed in test          1'
Call linein file
if lines(file)!=4 then              say 'failed in test          2'
Call linein file
if lines(file)!=3 then              say 'failed in test          3'
Call linein file
if lines(file)!=2 then              say 'failed in test          4'
Call linein file
if lines(file)!=1 then              say 'failed in test          5'
Call linein file
if lines(file)!=0 then              say 'failed in test          6'
Call linein file
if lines(file)!=0 then              say 'failed in test          7'
call lineout file
'erase' file
say "LINES OK"
