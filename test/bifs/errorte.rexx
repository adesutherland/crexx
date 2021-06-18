/* ERRORTEXT */
say "Look for ERRORTEXT OK"
/* These from the Rexx book. */
if errortext(16) \== 'Label not found' then exit
if errortext(60) \== '' then exit
/* These from Mark Hessling. */
if errortext(10) \== "Unexpected or unmatched END" then exit
if errortext(40) \== "Incorrect call to routine" then exit
/* There is a 50 these days
if errortext(50) \== "" then exit
*/
if errortext( 1) \== "" then exit
say "ERRORTEXT OK"
