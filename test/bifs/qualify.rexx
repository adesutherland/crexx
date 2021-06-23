/* */
parse version x

if pos('REXX-ooRexx_5.0.0',x) > 0 then
  do
    say "Look for path prefix."
    say qualify("qualify.cmd")
  end