// re2c $INPUT -o $OUTPUT  --empty-class error
/*!re2c

[]   { return 0; }
[^]  { return 1; }
[\000-\377] { return 2; }

*/
