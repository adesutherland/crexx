/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --flex-syntax

{
	YYCTYPE yych;
	if ((YYLIMIT - YYCURSOR) < 4) YYFILL(4);
	yych = *(YYMARKER = YYCURSOR);
	switch (yych) {
	case 'a':
		yyt1 = YYCURSOR;
		goto yy3;
	default:	goto yy2;
	}
yy2:
	yynmatch = 1;
	yypmatch[0] = YYCURSOR;
	yypmatch[1] = YYCURSOR;
	{}
yy3:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'a':
		yyt2 = NULL;
		yyt3 = YYCURSOR;
		goto yy5;
	case 'b':	goto yy7;
	default:	goto yy4;
	}
yy4:
	YYCURSOR = YYMARKER;
	goto yy2;
yy5:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'b':	goto yy8;
	default:
		yyt4 = NULL;
		goto yy6;
	}
yy6:
	yynmatch = 5;
	yypmatch[2] = yyt1;
	yypmatch[5] = yyt2;
	yypmatch[6] = yyt3;
	yypmatch[9] = yyt4;
	yypmatch[0] = yyt1;
	yypmatch[1] = YYCURSOR;
	yypmatch[3] = yyt3;
	yypmatch[4] = yyt2;
	if (yyt2 != NULL) yypmatch[4] -= 1;
	yypmatch[7] = YYCURSOR;
	yypmatch[8] = yyt4;
	if (yyt4 != NULL) yypmatch[8] -= 1;
	{}
yy7:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'a':
		yyt2 = yyt3 = YYCURSOR;
		goto yy5;
	default:	goto yy4;
	}
yy8:
	++YYCURSOR;
	yyt4 = YYCURSOR;
	goto yy6;
}

posix_captures/glennfowler/35.re:7:7: warning: rule matches empty string [-Wmatch-empty-string]
