/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -ci --input custom

{
	YYCTYPE yych;
	switch (YYGETCONDITION()) {
	case yycc1:
		goto yyc_c1;
	case yycc2:
		goto yyc_c2;
	}
/* *********************************** */
yyc_c1:
	if (YYLESSTHAN(3)) YYFILL(3);
	yych = YYPEEK();
	switch (yych) {
	case 'a':	goto yy4;
	default:	goto yy2;
	}
yy2:
	YYSKIP();
	{}
yy4:
	YYSKIP();
	yych = YYPEEK();
	YYBACKUPCTX();
	switch (yych) {
	case 'b':	goto yy6;
	default:	goto yy5;
	}
yy5:
	YYRESTORECTX();
	{}
yy6:
	YYSKIP();
	yych = YYPEEK();
	switch (yych) {
	case 'b':	goto yy8;
	case 'c':
		YYBACKUPCTX();
		goto yy10;
	default:
		YYBACKUPCTX();
		goto yy7;
	}
yy7:
	YYRESTORECTX();
	{}
yy8:
	YYSKIP();
	if (YYLESSTHAN(1)) YYFILL(1);
	yych = YYPEEK();
	switch (yych) {
	case 'b':	goto yy8;
	default:	goto yy5;
	}
yy10:
	YYSKIP();
	if (YYLESSTHAN(1)) YYFILL(1);
	yych = YYPEEK();
	switch (yych) {
	case 'c':	goto yy10;
	default:	goto yy7;
	}
/* *********************************** */
yyc_c2:
	if (YYLESSTHAN(2)) YYFILL(2);
	yych = YYPEEK();
	switch (yych) {
	case 'a':	goto yy16;
	default:	goto yy14;
	}
yy14:
	YYSKIP();
	{}
yy16:
	YYSKIP();
	yych = YYPEEK();
	YYBACKUPCTX();
	switch (yych) {
	case 'b':	goto yy18;
	default:	goto yy22;
	}
yy17:
	YYRESTORECTX();
	{}
yy18:
	YYSKIP();
	if (YYLESSTHAN(1)) YYFILL(1);
	yych = YYPEEK();
	switch (yych) {
	case 'b':	goto yy18;
	default:	goto yy20;
	}
yy20:
	YYRESTORECTX();
	{}
yy21:
	YYSKIP();
	if (YYLESSTHAN(1)) YYFILL(1);
	yych = YYPEEK();
yy22:
	switch (yych) {
	case 'c':	goto yy21;
	default:	goto yy17;
	}
}

