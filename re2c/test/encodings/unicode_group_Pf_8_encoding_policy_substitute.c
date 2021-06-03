/* Generated by re2c */
#line 1 "encodings/unicode_group_Pf_8_encoding_policy_substitute.re"
// re2c $INPUT -o $OUTPUT -8 --encoding-policy substitute
#include <stdio.h>
#include "utf8.h"
#define YYCTYPE unsigned char
bool scan(const YYCTYPE * start, const YYCTYPE * const limit)
{
	__attribute__((unused)) const YYCTYPE * YYMARKER; // silence compiler warnings when YYMARKER is not used
#	define YYCURSOR start
Pf:
	
#line 14 "encodings/unicode_group_Pf_8_encoding_policy_substitute.c"
{
	YYCTYPE yych;
	yych = *YYCURSOR;
	switch (yych) {
	case 0xC2:	goto yy4;
	case 0xE2:	goto yy5;
	default:	goto yy2;
	}
yy2:
	++YYCURSOR;
yy3:
#line 14 "encodings/unicode_group_Pf_8_encoding_policy_substitute.re"
	{ return YYCURSOR == limit; }
#line 28 "encodings/unicode_group_Pf_8_encoding_policy_substitute.c"
yy4:
	yych = *++YYCURSOR;
	switch (yych) {
	case 0xBB:	goto yy6;
	default:	goto yy3;
	}
yy5:
	yych = *(YYMARKER = ++YYCURSOR);
	switch (yych) {
	case 0x80:	goto yy8;
	case 0xB8:	goto yy10;
	default:	goto yy3;
	}
yy6:
	++YYCURSOR;
#line 13 "encodings/unicode_group_Pf_8_encoding_policy_substitute.re"
	{ goto Pf; }
#line 46 "encodings/unicode_group_Pf_8_encoding_policy_substitute.c"
yy8:
	yych = *++YYCURSOR;
	switch (yych) {
	case 0x99:
	case 0x9D:
	case 0xBA:	goto yy6;
	default:	goto yy9;
	}
yy9:
	YYCURSOR = YYMARKER;
	goto yy3;
yy10:
	yych = *++YYCURSOR;
	switch (yych) {
	case 0x83:
	case 0x85:
	case 0x8A:
	case 0x8D:
	case 0x9D:
	case 0xA1:	goto yy6;
	default:	goto yy9;
	}
}
#line 15 "encodings/unicode_group_Pf_8_encoding_policy_substitute.re"

}
static const unsigned int chars_Pf [] = {0xbb,0xbb,  0x2019,0x2019,  0x201d,0x201d,  0x203a,0x203a,  0x2e03,0x2e03,  0x2e05,0x2e05,  0x2e0a,0x2e0a,  0x2e0d,0x2e0d,  0x2e1d,0x2e1d,  0x2e21,0x2e21,  0x0,0x0};
static unsigned int encode_utf8 (const unsigned int * ranges, unsigned int ranges_count, unsigned int * s)
{
	unsigned int * const s_start = s;
	for (unsigned int i = 0; i < ranges_count - 2; i += 2)
		for (unsigned int j = ranges[i]; j <= ranges[i + 1]; ++j)
			s += re2c::utf8::rune_to_bytes (s, j);
	re2c::utf8::rune_to_bytes (s, ranges[ranges_count - 1]);
	return s - s_start + 1;
}

int main ()
{
	unsigned int * buffer_Pf = new unsigned int [44];
	YYCTYPE * s = (YYCTYPE *) buffer_Pf;
	unsigned int buffer_len = encode_utf8 (chars_Pf, sizeof (chars_Pf) / sizeof (unsigned int), buffer_Pf);
	/* convert 32-bit code units to YYCTYPE; reuse the same buffer */
	for (unsigned int i = 0; i < buffer_len; ++i) s[i] = buffer_Pf[i];
	if (!scan (s, s + buffer_len))
		printf("test 'Pf' failed\n");
	delete [] buffer_Pf;
	return 0;
}
