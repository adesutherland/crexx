/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --flex-syntax

{
	YYCTYPE yych;
	if ((YYLIMIT - YYCURSOR) < 4) YYFILL(4);
	yych = *(YYMARKER = YYCURSOR);
	switch (yych) {
	case 'a':
		yyt1 = yyt2 = YYCURSOR;
		goto yy3;
	case 'b':
		yyt1 = yyt2 = YYCURSOR;
		goto yy5;
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
	case 'b':
		yyt3 = YYCURSOR;
		goto yy9;
	default:	goto yy8;
	}
yy4:
	YYCURSOR = YYMARKER;
	goto yy2;
yy5:
	yych = *++YYCURSOR;
	yyt3 = YYCURSOR;
	goto yy11;
yy6:
	yynmatch = 5;
	yypmatch[4] = yyt1;
	yypmatch[6] = yyt2;
	yypmatch[8] = yyt3;
	yypmatch[0] = yyt1;
	yypmatch[1] = YYCURSOR;
	yypmatch[2] = yyt1;
	yypmatch[3] = yyt3;
	yypmatch[5] = yyt2;
	yypmatch[7] = yyt3;
	yypmatch[9] = YYCURSOR;
	{}
yy7:
	++YYCURSOR;
	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
	yych = *YYCURSOR;
yy8:
	switch (yych) {
	case 'a':
		yyt3 = YYCURSOR;
		goto yy7;
	case 'b':
		yyt2 = yyt3;
		yyt3 = YYCURSOR;
		goto yy9;
	default:	goto yy4;
	}
yy9:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'c':	goto yy5;
	default:
		yyt2 = yyt3;
		yyt3 = YYCURSOR;
		goto yy6;
	}
yy10:
	++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
yy11:
	switch (yych) {
	case 'c':	goto yy10;
	default:	goto yy6;
	}
}

posix_captures/forcedassoc/15.re:7:7: warning: rule matches empty string [-Wmatch-empty-string]
