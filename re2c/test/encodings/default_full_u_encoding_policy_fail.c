/* Generated by re2c */
#line 1 "encodings/default_full_u_encoding_policy_fail.re"
// re2c $INPUT -o $OUTPUT -u --encoding-policy fail

#line 6 "encodings/default_full_u_encoding_policy_fail.c"
{
	YYCTYPE yych;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	if (yych <= 0x0000D7FF) goto yy2;
	if (yych <= 0x0000DFFF) goto yy4;
yy2:
	++YYCURSOR;
#line 4 "encodings/default_full_u_encoding_policy_fail.re"
	{ return FULL; }
#line 17 "encodings/default_full_u_encoding_policy_fail.c"
yy4:
	++YYCURSOR;
#line 3 "encodings/default_full_u_encoding_policy_fail.re"
	{ return DEFAULT; }
#line 22 "encodings/default_full_u_encoding_policy_fail.c"
}
#line 5 "encodings/default_full_u_encoding_policy_fail.re"

