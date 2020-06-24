extern const char *help;
const char *help =
"              Show help message.\n"
"\n"
"       -1 --single-pass\n"
"              Deprecated. Does nothing (single pass is the default now).\n"
"\n"
"       -8 --utf-8\n"
"              Generate a lexer that reads input in UTF-8 encoding.  re2c assumes that character range is 0 -- 0x10FFFF and character size is 1 byte.\n"
"\n"
"       -b --bit-vectors\n"
"              Optimize conditional jumps using bit masks. Implies -s.\n"
"\n"
"       -c --conditions --start-conditions\n"
"              Enable support of Flex-like \"conditions\": multiple interrelated lexers within one block. Option --start-conditions is a legacy alias; use --conditions instead.\n"
"\n"
"       --case-insensitive\n"
"              Treat single-quoted and double-quoted strings as case-insensitive.\n"
"\n"
"       --case-inverted\n"
"              Invert the meaning of single-quoted and double-quoted strings: treat single-quoted strings as case-sensitive and double-quoted strings as case-insensitive.\n"
"\n"
"       --case-ranges\n"
"              Collapse  consecutive  cases  in  a switch statements into a range of the form case low ... high:. This syntax is an extension of the C/C++ language, supported by compilers\n"
"              like GCC, Clang and Tcc. The main advantage over using single cases is smaller generated C code and faster generation time, although for some compilers  like  Tcc  it  also\n"
"              results in smaller binary size.  This option doesn't work for the Go backend.\n"
"\n"
"       -e --ecb\n"
"              Generate a lexer that reads input in EBCDIC encoding.  re2c assumes that character range is 0 -- 0xFF an character size is 1 byte.\n"
"\n"
"       --empty-class <match-empty | match-none | error>\n"
"              Define  the  way  re2c  treats  empty  character  classes.  With  match-empty  (the default) empty class matches empty input (which is illogical, but backwards-compatible).\n"
"              With``match-none`` empty class always fails to match.  With error empty class raises a compilation error.\n"
"\n"
"       --encoding-policy <fail | substitute | ignore>\n"
"              Define the way re2c treats Unicode surrogates.  With fail re2c aborts with an error when a surrogate is encountered.  With substitute re2c silently replaces surrogates with\n"
"              the  error  code point 0xFFFD. With ignore (the default) re2c treats surrogates as normal code points. The Unicode standard says that standalone surrogates are invalid, but\n"
"              real-world libraries and programs behave in different ways.\n"
"\n"
"       -f --storable-state\n"
"              Generate a lexer which can store its inner state.  This is useful in push-model lexers which are stopped by an outer program when  there  is  not  enough  input,  and  then\n"
"              resumed when more input becomes available. In this mode users should additionally define YYGETSTATE() and YYSETSTATE(state) macros and variables yych, yyaccept and state as\n"
"              part of the lexer state.\n"
"\n"
"       -F --flex-syntax\n"
"              Partial support for Flex syntax: in this mode named definitions don't need the equal sign and the terminating semicolon, and when used they  must  be  surrounded  by  curly\n"
"              braces. Names without curly braces are treated as double-quoted strings.\n"
"\n"
"       -g --computed-gotos\n"
"              Optimize  conditional  jumps  using non-standard \"computed goto\" extension (which must be supported by the C/C++ compiler). re2c generates jump tables only in complex cases\n"
"              with a lot of conditional branches. Complexity threshold can be configured with cgoto:threshold configuration. This option implies -b. This option doesn't work for  the  Go\n"
"              backend.\n"
"\n"
"       -I PATH\n"
"              Add  PATH  to  the list of locations which are used when searching for include files. This option is useful in combination with /*!include:re2c ... */ directive. Re2c looks\n"
"              for FILE in the directory of including file and in the list of include paths specified by -I option.\n"
"\n"
"       -i --no-debug-info\n"
"              Do not output #line information. This is useful when the generated code is tracked by some version control system or IDE.\n"
"\n"
"       --input <default | custom>\n"
"              Specify the API used by the generated code to interface with used-defined code. Option default is the C API based on pointer arithmetic (it is the default for the  C  back‐\n"
"              end). Option custom is the generic API (it is the default for the Go backend).\n"
"\n"
"       --input-encoding <ascii | utf8>\n"
"              Specify  the  way  re2c  parses  regular  expressions.  With ascii (the default) re2c handles input as ASCII-encoded: any sequence of code units is a sequence of standalone\n"
"              1-byte characters.  With utf8 re2c handles input as UTF8-encoded and recognizes multibyte characters.\n"
"\n"
"       --lang <c | go>\n"
"              Specify the output language. Supported languages are C and Go (the default is C).\n"
"\n"
"       --location-format <gnu | msvc>\n"
"              Specify location format in messages.  With gnu locations are printed as 'filename:line:column: ...'.  With  msvc  locations  are  printed  as  'filename(line,column)  ...'.\n"
"              Default is gnu.\n"
"\n"
"       --no-generation-date\n"
"              Suppress date output in the generated file.\n"
"\n"
"       --no-version\n"
"              Suppress version output in the generated file.\n"
"\n"
"       -o OUTPUT --output=OUTPUT\n"
"              Specify the OUTPUT file.\n"
"\n"
"       -P --posix-captures\n"
"              Enable submatch extraction with POSIX-style capturing groups.\n"
"\n"
"       -r --reusable\n"
"              Allows  reuse  of  re2c rules with /*!rules:re2c */ and /*!use:re2c */ blocks. Exactly one rules-block must be present. The rules are saved and used by every use-block that\n"
"              follows, which may add its own rules and configurations.\n"
"\n"
"       -S --skeleton\n"
"              Ignore user-defined interface code and generate a self-contained \"skeleton\" program. Additionally, generate input files with strings derived from the  regular  grammar  and\n"
"              compressed match results that are used to verify \"skeleton\" behavior on all inputs. This option is useful for finding bugs in optimizations and code generation. This option\n"
"              doesn't work for the Go backend.\n"
"\n"
"       -s --nested-ifs\n"
"              Use nested if statements instead of switch statements in conditional jumps. This usually results in more efficient code with non-optimizing C/C++ compilers.\n"
"\n"
"       -T --tags\n"
"              Enable submatch extraction with tags.\n"
"\n"
"       -t HEADER --type-header=HEADER\n"
"              Generate a HEADER file that contains enum with condition names.  Requires -c option.\n"
"\n"
"       -u --unicode\n"
"              Generate a lexer that reads UTF32-encoded input. Re2c assumes that character range is 0 -- 0x10FFFF and character size is 4 bytes. This option implies -s.\n"
"\n"
"       -V --vernum\n"
"              Show version information in MMmmpp format (major, minor, patch).\n"
"\n"
"       --verbose\n"
"              Output a short message in case of success.\n"
"\n"
"       -v --version\n"
"              Show version information.\n"
"\n"
"       -w --wide-chars\n"
"              Generate a lexer that reads UCS2-encoded input. Re2c assumes that character range is 0 -- 0xFFFF and character size is 2 bytes. This option implies -s.\n"
"\n"
"       -x --utf-16\n"
"              Generate a lexer that reads UTF16-encoded input. Re2c assumes that character range is 0 -- 0x10FFFF and character size is 2 bytes. This option implies -s.\n"
"\n"
"DEBUG OPTIONS\n"
"       The following options allow to visualize and debug the generated programs; most of them are enabled only in debug builds.\n"
"\n"
"       -D --emit-dot\n"
"              Instead of normal output generate lexer graph in .dot format.  The output can be converted to an image with the help of Graphviz (e.g. something like  dot  -Tpng  -odfa.png\n"
"              dfa.dot).\n"
"\n"
"       -d --debug-output\n"
"              Emit YYDEBUG in the generated code.  YYDEBUG should be defined by the user in the form of a void function with two parameters: state (lexer state or -1) and symbol (current\n"
"              input symbol of type YYCTYPE).\n"
"\n"
"       --dump-adfa\n"
"              Debug option: output DFA after tunneling (in .dot format).\n"
"\n"
"       --dump-cfg\n"
"              Debug option: output control flow graph of tag variables (in .dot format).\n"
"\n"
"       --dump-closure-stats\n"
"              Debug option: output statistics on the number of states in closure.\n"
"\n"
"       --dump-dfa-det\n"
"              Debug option: output DFA immediately after determinization (in .dot format).\n"
"\n"
"       --dump-dfa-min\n"
"              Debug option: output DFA after minimization (in .dot format).\n"
"\n"
"       --dump-dfa-tagopt\n"
"              Debug option: output DFA after tag optimizations (in .dot format).\n"
"\n"
"       --dump-dfa-tree\n"
"              Debug option: output DFA under construction with states represented as tag history trees (in .dot format).\n"
"\n"
"       --dump-dfa-raw\n"
"              Debug option: output DFA under construction with expanded state-sets (in .dot format).\n"
"\n"
"       --dump-interf\n"
"              Debug option: output interference table produced by liveness analysis of tag variables.\n"
"\n"
"       --dump-nfa\n"
"              Debug option: output NFA (in .dot format).\n"
"\n"
"INTERNAL OPTIONS\n"
"       The following options are primarily intended for re2c developers; they are unstable and control re2c internals.\n"
"\n"
"       --dfa-minimization <moore | table>\n"
"              Internal option: DFA minimization algorithm used by re2c. The moore option is the Moore algorithm (it is the default). The table option is the  \"table  filling\"  algorithm.\n"
"              Both algorithms should produce the same DFA up to states relabeling; table filling is simpler and much slower and serves as a reference implementation.\n"
"\n"
"       --eager-skip\n"
"              Internal option: make the generated lexer advance the input position eagerly -- immediately after reading the input symbol. This changes the default behavior when the input\n"
"              position is advanced lazily -- after transition to the next state. This option is implied by --no-lookahead.\n"
"\n"
"       --no-lookahead\n"
"              Internal option: use TDFA(0) instead of TDFA(1).  This option has effect only with --tags or --posix-captures options.\n"
"\n"
"       --no-optimize-tags\n"
"              Internal optionL: suppress optimization of tag variables (useful for debugging).\n"
"\n"
"       --posix-closure <gor1 | gtop>\n"
"              Internal option: specify shortest-path algorithm used for the construction of epsilon-closure with POSIX disambiguation semantics:  gor1  (the  default)  stands  for  Gold‐\n"
"              berg-Radzik algorithm, and gtop stands for \"global topological order\" algorithm.\n"
"\n"
"       --posix-prectable <complex | naive>\n"
"              Internal  option: specify the algorithm used to compute POSIX precedence table. The complex algorithm computes precedence table in one traversal of tag history tree and has\n"
"              quadratic complexity in the number of TNFA states; it is the default. The naive algorithm has worst-case cubic complexity in the number of TNFA states, but it is much  sim‐\n"
"              pler than complex and may be slightly faster in non-pathological cases.\n"
"\n"
"       --stadfa\n"
"              Internal option: use staDFA algorithm for submatch extraction. The main difference with TDFA is that tag operations in staDFA are placed in states, not on transitions.\n"
"\n"
"       -W     Turn on all warnings.\n"
"\n"
"       -Werror\n"
"              Turn  warnings  into  errors.  Note that this option alone doesn't turn on any warnings; it only affects those warnings that have been turned on so far or will be turned on\n"
"              later.\n"
"\n"
"       -W<warning>\n"
"              Turn on warning.\n"
"\n"
"       -Wno-<warning>\n"
"              Turn off warning.\n"
"\n"
"       -Werror-<warning>\n"
"              Turn on warning and treat it as an error (this implies -W<warning>).\n"
"\n"
"       -Wno-error-<warning>\n"
"              Don't treat this particular warning as an error. This doesn't turn off the warning itself.\n"
"\n"
"       -Wcondition-order\n"
"              Warn if the generated program makes implicit assumptions about condition numbering. One should use either the -t, --type-header option or the /*!types:re2c*/  directive  to\n"
"              generate a mapping of condition names to numbers and then use the autogenerated condition names.\n"
"\n"
"       -Wempty-character-class\n"
"              Warn if a regular expression contains an empty character class. Trying to match an empty character class makes no sense: it should always fail.  However, for backwards com‐\n"
"              patibility reasons re2c allows empty character classes and treats them as empty strings. Use the --empty-class option to change the default behavior.\n"
"\n"
"       -Wmatch-empty-string\n"
"              Warn if a rule is nullable (matches an empty string).  If the lexer runs in a loop and the empty match is unintentional, the lexer may  unexpectedly  hang  in  an  infinite\n"
"              loop.\n"
"\n"
"       -Wswapped-range\n"
"              Warn if the lower bound of a range is greater than its upper bound. The default behavior is to silently swap the range bounds.\n"
"\n"
"       -Wundefined-control-flow\n"
"              Warn  if some input strings cause undefined control flow in the lexer (the faulty patterns are reported). This is the most dangerous and most common mistake. It can be eas‐\n"
"              ily fixed by adding the default rule * which has the lowest priority, matches any code unit, and consumes exactly one code unit.\n"
"\n"
"       -Wunreachable-rules\n"
"              Warn about rules that are shadowed by other rules and will never match.\n"
"\n"
"       -Wuseless-escape\n"
"              Warn if a symbol is escaped when it shouldn't be.  By default, re2c silently ignores such escapes, but this may as well indicate a typo or an error in the escape sequence.\n"
"\n"
"       -Wnondeterministic-tags\n"
"              Warn if a tag has n-th degree of nondeterminism, where n is greater than 1.\n"
"\n"
"       -Wsentinel-in-midrule\n"
"              Warn if the sentinel symbol occurs in the middle of a rule --- this may cause reads past the end of buffer, crashes or memory corruption in the generated lexer. This  warn‐\n"
;
