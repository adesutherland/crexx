/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --tags
// ensure 'r+' (one or more repetitions) expansion does not duplicate 'r'
// this is crucial if 'r' contains tags (tag duplication is forbidden)


{
	YYCTYPE yych;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':
		yyt1 = YYCURSOR;
		goto yy4;
	default:	goto yy2;
	}
yy2:
	++YYCURSOR;
	{ d }
yy4:
	++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':
		yyt1 = YYCURSOR;
		goto yy4;
	default:	goto yy6;
	}
yy6:
	p = yyt1;
	{ p }
}

