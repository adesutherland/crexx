/* These from TRL */
say "Look for INSERT OK"
if insert(' ','abcdef',3) \== 'abc def' then
  say 'failed in test 1'
/* if insert('123','abc',5,6) \== 'abc 123 ' */
/*   then say 'failed in test 2' */
if insert('123','abc',5,6,'+') \== 'abc++123+++' then
  say 'failed in test 3'
if insert('123','abc') \== '123abc' then
  say 'failed in test 4'
if insert('123','abc',,5,'-') \== '123--abc' then
  say 'failed in test 5'
/* These from Mark Hessling. */
if insert("abc","def") \== "abcdef" then
  say 'failed in test 6'
if insert("abc","def",2) \== "deabcf" then
  say 'failed in test 7'
if insert("abc","def",3) \== "defabc" then
  say 'failed in test 8'
/* if insert("abc","def",5) \== "def abc" */
/* then say 'failed in test 9' */
if insert("abc","def",5,,'*') \== "def**abc" then
  say 'failed in test 10'
if insert("abc" ,"def",5,4,'*') \== "def**abc*" then
  say 'failed in test 11'
if insert("abc","def",,0) \== "def" then
  say 'failed in test 12'
if insert("abc","def",2,1) \== "deaf" then
  say 'failed in test 13'
say "INSERT OK"
