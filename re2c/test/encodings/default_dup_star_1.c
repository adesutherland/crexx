/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -ic

{
	YYCTYPE yych;
	switch (YYGETCONDITION()) {
	case yycc1:
		goto yyc_c1;
	case yycc2:
		goto yyc_c2;
	case yycc3:
		goto yyc_c3;
	}
/* *********************************** */
yyc_c1:
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR++;
	{ return DEFAULT-1; }
/* *********************************** */
yyc_c2:
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR++;
	{ return DEFAULT-2; }
/* *********************************** */
yyc_c3:
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR++;
	{ return DEFAULT-*; }
}

encodings/default_dup_star_1.re:5:9: warning: unreachable rule in condition 'c3' (shadowed by rule at line 6) [-Wunreachable-rules]
