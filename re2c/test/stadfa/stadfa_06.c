/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --tags --stadfa

{
	YYCTYPE yych;
	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
	yych = *YYCURSOR;
	switch (yych) {
	case 'c':	goto yy3;
	default:	goto yy2;
	}
yy2:
	{}
yy3:
	yych = *(YYMARKER = ++YYCURSOR);
	switch (yych) {
	case 'b':	goto yy5;
	default:
		yyt1 = YYCURSOR;
		goto yy4;
	}
yy4:
	t = yyt1;
	{}
yy5:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'b':	goto yy7;
	default:	goto yy6;
	}
yy6:
	YYCURSOR = YYMARKER;
	yyt1 = YYCURSOR;
	goto yy4;
yy7:
	++YYCURSOR;
	yyt1 = NULL;
	goto yy4;
}

