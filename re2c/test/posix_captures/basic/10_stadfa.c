/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --flex-syntax --stadfa

{
	YYCTYPE yych;
	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
	yych = *(YYMARKER = YYCURSOR);
	switch (yych) {
	case 'a':	goto yy3;
	case 'c':	goto yy5;
	default:	goto yy2;
	}
yy2:
	yynmatch = 1;
	yypmatch[0] = YYCURSOR;
	yypmatch[1] = YYCURSOR;
	{}
yy3:
	yych = *++YYCURSOR;
	yyt2 = yyt3 = NULL;
	yyt1 = YYCURSOR - 1;
	switch (yych) {
	case 'b':	goto yy6;
	case 'e':	goto yy8;
	default:	goto yy4;
	}
yy4:
	YYCURSOR = YYMARKER;
	goto yy2;
yy5:
	yych = *++YYCURSOR;
	yyt2 = NULL;
	yyt1 = YYCURSOR - 1;
	switch (yych) {
	case 'd':	goto yy9;
	default:	goto yy4;
	}
yy6:
	++YYCURSOR;
	yyt3 = yyt4 = NULL;
	yyt2 = YYCURSOR;
yy7:
	yynmatch = 4;
	yypmatch[0] = yyt1;
	yypmatch[3] = yyt2;
	yypmatch[5] = yyt3;
	yypmatch[7] = yyt4;
	yypmatch[1] = YYCURSOR;
	yypmatch[2] = yyt2;
	if (yyt2 != NULL) yypmatch[2] -= 1;
	yypmatch[4] = yyt3;
	if (yyt3 != NULL) yypmatch[4] -= 1;
	yypmatch[6] = yyt4;
	if (yyt4 != NULL) yypmatch[6] -= 1;
	{}
yy8:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'f':	goto yy10;
	default:	goto yy4;
	}
yy9:
	++YYCURSOR;
	yyt4 = NULL;
	yyt3 = YYCURSOR;
	goto yy7;
yy10:
	++YYCURSOR;
	yyt4 = YYCURSOR - 1;
	goto yy7;
}

posix_captures/basic/10_stadfa.re:7:7: warning: rule matches empty string [-Wmatch-empty-string]
