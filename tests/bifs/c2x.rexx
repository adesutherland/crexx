/* C2X */
say "Look for C2X OK"
/* These from the Rexx book. */
/* EBCDIC
if c2x('72s') \== 'F7F2A2' then say 'failed in test */
if c2x('0123'x) \== '0123' then say 'failed in test 2 '
/* These from Mark Hessling. */
/* if c2x( 'foobar') \== '666F6F626172' then say 'failed in test 3 ' EBCDIC */
if c2x( '' )\== '' then say 'failed in test 4 '
if c2x( '101'x )\== '0101' then say 'failed in test 5 '
if c2x( '0123456789abcdef'x )\== '0123456789ABCDEF' then say 'failed in test 6 '
if c2x( 'ffff'x )\== 'FFFF' then say 'failed in test 7 '
if c2x( 'ffffffff'x )\== 'FFFFFFFF' then say 'failed in test 8 '
say "C2X OK"
