/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --flex-syntax --stadfa

{
	YYCTYPE yych;
	if ((YYLIMIT - YYCURSOR) < 7) YYFILL(7);
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
	yyt4 = YYCURSOR - 1;
	switch (yych) {
	case 'b':	goto yy5;
	case 'c':	goto yy6;
	default:	goto yy4;
	}
yy4:
	YYCURSOR = YYMARKER;
	goto yy2;
yy5:
	yych = *++YYCURSOR;
	yyt2 = YYCURSOR - 1;
	switch (yych) {
	case 'b':	goto yy8;
	case 'c':	goto yy9;
	default:	goto yy4;
	}
yy6:
	yych = *++YYCURSOR;
	yyt1 = YYCURSOR - 1;
	switch (yych) {
	case 'd':	goto yy10;
	default:
		yyt3 = YYCURSOR;
		yyt2 = yyt1;
		yyt1 = yyt4;
		goto yy7;
	}
yy7:
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
yy8:
	yych = *++YYCURSOR;
	yyt2 = YYCURSOR - 1;
	switch (yych) {
	case 'c':	goto yy11;
	default:	goto yy4;
	}
yy9:
	yych = *++YYCURSOR;
	yyt1 = YYCURSOR - 1;
	switch (yych) {
	case 'd':	goto yy12;
	default:
		yyt3 = YYCURSOR;
		yyt2 = yyt1;
		yyt1 = yyt4;
		goto yy7;
	}
yy10:
	yych = *++YYCURSOR;
	yyt2 = YYCURSOR - 1;
	switch (yych) {
	case 'd':	goto yy13;
	default:
		yyt3 = yyt2;
		yyt2 = yyt1;
		yyt1 = yyt4;
		goto yy7;
	}
yy11:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'd':	goto yy12;
	default:	goto yy4;
	}
yy12:
	yych = *++YYCURSOR;
	yyt1 = yyt2;
	switch (yych) {
	case 'd':	goto yy10;
	default:
		yyt3 = YYCURSOR;
		yyt2 = yyt1;
		yyt1 = yyt4;
		goto yy7;
	}
yy13:
	++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'd':	goto yy13;
	default:
		yyt3 = yyt2;
		yyt2 = yyt1;
		yyt1 = yyt4;
		goto yy7;
	}
}

posix_captures/forcedassoc/07_stadfa.re:7:7: warning: rule matches empty string [-Wmatch-empty-string]
