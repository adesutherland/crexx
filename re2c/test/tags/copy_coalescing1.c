/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --tags
// This test demonstrates the need for copy coalescing during
// allocation of tag variables: low interference allows for many
// ways of partitioning tag versions into equivalence classes.

// Without copy coalescing the choice is arbitrary: operands of
// copy command may or may not get into the same class.
// Coalescing adds bias to this choice: we first try to merge
// copy operands, then examine the rest of tags.

yyt1


{
	YYCTYPE yych;
	unsigned int yyaccept = 0;
	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':	goto yy4;
	default:	goto yy2;
	}
yy2:
	++YYCURSOR;
yy3:
	{}
yy4:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'c':	goto yy5;
	case 'd':	goto yy7;
	default:	goto yy3;
	}
yy5:
	yyaccept = 0;
	YYMARKER = ++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':	goto yy9;
	default:
		yyt1 = YYCURSOR;
		goto yy6;
	}
yy6:
	q = yyt1;
	p = yyt1;
	if (yyt1 != NULL) p -= 1;
	{ p q }
yy7:
	yyaccept = 1;
	YYMARKER = ++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':	goto yy11;
	default:
		yyt1 = YYCURSOR;
		goto yy8;
	}
yy8:
	s = yyt1;
	r = yyt1;
	if (yyt1 != NULL) r -= 1;
	{ r s }
yy9:
	++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'c':	goto yy5;
	default:	goto yy10;
	}
yy10:
	YYCURSOR = YYMARKER;
	if (yyaccept == 0) {
		yyt1 = YYCURSOR;
		goto yy6;
	} else {
		yyt1 = YYCURSOR;
		goto yy8;
	}
yy11:
	++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'd':	goto yy7;
	default:	goto yy10;
	}
}

tags/copy_coalescing1.re:13:21: warning: rule matches empty string [-Wmatch-empty-string]
tags/copy_coalescing1.re:14:21: warning: rule matches empty string [-Wmatch-empty-string]
