/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --flex-syntax --stadfa

{
	YYCTYPE yych;
	if ((YYLIMIT - YYCURSOR) < 4) YYFILL(4);
	yych = *(YYMARKER = YYCURSOR);
	switch (yych) {
	case 'a':	goto yy3;
	default:	goto yy2;
	}
yy2:
	yynmatch = 1;
	yypmatch[0] = YYCURSOR;
	yypmatch[1] = YYCURSOR;
	{}
yy3:
	yych = *++YYCURSOR;
	yyt1 = yyt2 = YYCURSOR - 1;
	switch (yych) {
	case 'a':	goto yy5;
	case 'b':	goto yy7;
	default:	goto yy4;
	}
yy4:
	YYCURSOR = YYMARKER;
	goto yy2;
yy5:
	++YYCURSOR;
	yyt2 = YYCURSOR - 1;
yy6:
	yynmatch = 3;
	yypmatch[2] = yyt1;
	yypmatch[4] = yyt2;
	yypmatch[0] = yyt1;
	yypmatch[1] = YYCURSOR;
	yypmatch[3] = yyt2;
	yypmatch[5] = YYCURSOR;
	{}
yy7:
	yych = *++YYCURSOR;
	yyt1 = yyt2;
	switch (yych) {
	case 'a':	goto yy5;
	case 'b':	goto yy8;
	default:	goto yy4;
	}
yy8:
	yych = *++YYCURSOR;
	yyt1 = yyt2;
	yyt2 = YYCURSOR - 1;
	switch (yych) {
	case 'a':	goto yy9;
	default:	goto yy4;
	}
yy9:
	++YYCURSOR;
	goto yy6;
}

posix_captures/glennfowler/21_stadfa.re:7:7: warning: rule matches empty string [-Wmatch-empty-string]
