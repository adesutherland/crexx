/* Generated by re2c */
#line 1 "encodings/unicode_group_Lt_8_encoding_policy_ignore.re"
// re2c $INPUT -o $OUTPUT -8 --encoding-policy ignore
#include <stdio.h>
#include "utf8.h"
#define YYCTYPE unsigned char
bool scan(const YYCTYPE * start, const YYCTYPE * const limit)
{
	__attribute__((unused)) const YYCTYPE * YYMARKER; // silence compiler warnings when YYMARKER is not used
#	define YYCURSOR start
Lt:
	
#line 14 "encodings/unicode_group_Lt_8_encoding_policy_ignore.c"
{
	YYCTYPE yych;
	yych = *YYCURSOR;
	switch (yych) {
	case 0xC7:	goto yy4;
	case 0xE1:	goto yy5;
	default:	goto yy2;
	}
yy2:
	++YYCURSOR;
yy3:
#line 14 "encodings/unicode_group_Lt_8_encoding_policy_ignore.re"
	{ return YYCURSOR == limit; }
#line 28 "encodings/unicode_group_Lt_8_encoding_policy_ignore.c"
yy4:
	yych = *++YYCURSOR;
	switch (yych) {
	case 0x85:
	case 0x88:
	case 0x8B:
	case 0xB2:	goto yy6;
	default:	goto yy3;
	}
yy5:
	yych = *(YYMARKER = ++YYCURSOR);
	switch (yych) {
	case 0xBE:	goto yy8;
	case 0xBF:	goto yy10;
	default:	goto yy3;
	}
yy6:
	++YYCURSOR;
#line 13 "encodings/unicode_group_Lt_8_encoding_policy_ignore.re"
	{ goto Lt; }
#line 49 "encodings/unicode_group_Lt_8_encoding_policy_ignore.c"
yy8:
	yych = *++YYCURSOR;
	switch (yych) {
	case 0x88:
	case 0x89:
	case 0x8A:
	case 0x8B:
	case 0x8C:
	case 0x8D:
	case 0x8E:
	case 0x8F:
	case 0x98:
	case 0x99:
	case 0x9A:
	case 0x9B:
	case 0x9C:
	case 0x9D:
	case 0x9E:
	case 0x9F:
	case 0xA8:
	case 0xA9:
	case 0xAA:
	case 0xAB:
	case 0xAC:
	case 0xAD:
	case 0xAE:
	case 0xAF:
	case 0xBC:	goto yy6;
	default:	goto yy9;
	}
yy9:
	YYCURSOR = YYMARKER;
	goto yy3;
yy10:
	yych = *++YYCURSOR;
	switch (yych) {
	case 0x8C:
	case 0xBC:	goto yy6;
	default:	goto yy9;
	}
}
#line 15 "encodings/unicode_group_Lt_8_encoding_policy_ignore.re"

}
static const unsigned int chars_Lt [] = {0x1c5,0x1c5,  0x1c8,0x1c8,  0x1cb,0x1cb,  0x1f2,0x1f2,  0x1f88,0x1f8f,  0x1f98,0x1f9f,  0x1fa8,0x1faf,  0x1fbc,0x1fbc,  0x1fcc,0x1fcc,  0x1ffc,0x1ffc,  0x0,0x0};
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
	unsigned int * buffer_Lt = new unsigned int [128];
	YYCTYPE * s = (YYCTYPE *) buffer_Lt;
	unsigned int buffer_len = encode_utf8 (chars_Lt, sizeof (chars_Lt) / sizeof (unsigned int), buffer_Lt);
	/* convert 32-bit code units to YYCTYPE; reuse the same buffer */
	for (unsigned int i = 0; i < buffer_len; ++i) s[i] = buffer_Lt[i];
	if (!scan (s, s + buffer_len))
		printf("test 'Lt' failed\n");
	delete [] buffer_Lt;
	return 0;
}
