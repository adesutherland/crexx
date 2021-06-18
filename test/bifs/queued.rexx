/* QUEUED */
say "Look for QUEUED OK"
if queued() \= 0 then say 'failed in test 1 '
push 'xyz'
q = queued()
pull .
if q \= 1 then say 'failed in test 2 '
say "QUEUED OK"
