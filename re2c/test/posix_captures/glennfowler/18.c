/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --flex-syntax

{
	YYCTYPE yych;
	if ((YYLIMIT - YYCURSOR) < 4) YYFILL(4);
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':
		yyt1 = yyt2 = YYCURSOR;
		goto yy3;
	case 'b':
		yyt4 = NULL;
		yyt1 = yyt2 = yyt3 = YYCURSOR;
		goto yy4;
	default:
		yyt4 = NULL;
		yyt1 = yyt2 = yyt3 = YYCURSOR;
		goto yy2;
	}
yy2:
	yynmatch = 4;
	yypmatch[2] = yyt1;
	yypmatch[4] = yyt2;
	yypmatch[5] = yyt3;
	yypmatch[7] = yyt4;
	yypmatch[0] = yyt1;
	yypmatch[1] = YYCURSOR;
	yypmatch[3] = yyt2;
	yypmatch[6] = yyt4;
	if (yyt4 != NULL) yypmatch[6] -= 2;
	{}
yy3:
	yych = *(YYMARKER = ++YYCURSOR);
	switch (yych) {
	case 'a':
		yyt3 = YYCURSOR;
		goto yy5;
	case 'b':
		yyt4 = NULL;
		yyt3 = YYCURSOR;
		goto yy7;
	default:
		yyt4 = NULL;
		yyt2 = yyt3 = YYCURSOR;
		goto yy2;
	}
yy4:
	++YYCURSOR;
	goto yy2;
yy5:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'b':	goto yy8;
	default:	goto yy6;
	}
yy6:
	YYCURSOR = YYMARKER;
	yyt4 = NULL;
	yyt2 = yyt3 = YYCURSOR;
	goto yy2;
yy7:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'b':
		yyt3 = yyt4 = YYCURSOR;
		goto yy4;
	default:
		yyt2 = yyt3;
		goto yy2;
	}
yy8:
	yych = *++YYCURSOR;
	yyt2 = yyt3;
	yyt3 = yyt4 = YYCURSOR;
	switch (yych) {
	case 'b':	goto yy4;
	default:	goto yy2;
	}
}

posix_captures/glennfowler/18.re:6:4: warning: rule matches empty string [-Wmatch-empty-string]
posix_captures/glennfowler/18.re:7:7: warning: rule matches empty string [-Wmatch-empty-string]
posix_captures/glennfowler/18.re:7:7: warning: unreachable rule (shadowed by rule at line 6) [-Wunreachable-rules]
