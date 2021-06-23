/* REVERSE */
say "Look for REVERSE OK"
/* These from the Rexx book. */
if reverse('ABc.') \== '.cBA' then say 'failed in test 1 '
if reverse('XYZ ') \== ' ZYX' then say 'failed in test 2 '
if reverse('Tranquility') \== 'ytiliuqnarT' then say 'failed in test 3 '
/* These from Mark Hessling. */
if reverse("foobar") \== "raboof" then say 'failed in test 4 '
if reverse("") \== "" then say 'failed in test 5 '
if reverse("fubar") \== "rabuf" then say 'failed in test 6 '
if reverse("f") \== "f" then say 'failed in test 7 '
if reverse(" foobar ") \== " raboof " then say 'failed in test 8 '
say "REVERSE OK"
