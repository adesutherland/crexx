/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i

{
	YYCTYPE yych;
yyFillLabel0:
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':	goto yy4;
	default:
		if (YYLIMIT <= YYCURSOR) {
			if (YYFILL() == 0) goto yyFillLabel0;
			goto yy6;
		}
		goto yy2;
	}
yy2:
	++YYCURSOR;
	{ return FAIL; }
yy4:
	++YYCURSOR;
	{ return OK; }
yy6:
	{ return EOF; }
}



{
	YYCTYPE yych;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':	goto yy11;
	default:	goto yy9;
	}
yy9:
	++YYCURSOR;
	{ return FAIL; }
yy11:
	++YYCURSOR;
	{ return OK; }
}



{
	YYCTYPE yych;
yyFillLabel1:
	yych = *YYCURSOR;
	switch (yych) {
	case 'b':	goto yy17;
	default:
		if (YYLIMIT <= YYCURSOR) {
			if (YYFILL() == 0) goto yyFillLabel1;
			goto yy19;
		}
		goto yy15;
	}
yy15:
	++YYCURSOR;
	{ return FAIL; }
yy17:
	++YYCURSOR;
	{ return OK; }
yy19:
	{ return EOF; }
}



{
	YYCTYPE yych;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'b':	goto yy24;
	default:	goto yy22;
	}
yy22:
	++YYCURSOR;
	{ return FAIL; }
yy24:
	++YYCURSOR;
	{ return OK; }
}

