/* Generated by re2c */
#line 1 "encodings/utf32_0x10000.re"
// re2c $INPUT -o $OUTPUT -u

#line 6 "encodings/utf32_0x10000.c"
{
	YYCTYPE yych;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	if (yych == 0x00010000) goto yy3;
yy3:
	++YYCURSOR;
#line 3 "encodings/utf32_0x10000.re"
	{}
#line 16 "encodings/utf32_0x10000.c"
}
#line 4 "encodings/utf32_0x10000.re"

encodings/utf32_0x10000.re:4:2: warning: control flow is undefined for strings that match '[\x0-\xFFFF\x10001-\x10FFFF]', use default rule '*' [-Wundefined-control-flow]
