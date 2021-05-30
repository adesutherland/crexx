/* Generated by re2c */
#line 1 "encodings/unicode_group_Lt_x_encoding_policy_fail.re"
// re2c $INPUT -o $OUTPUT -x --encoding-policy fail
#include <stdio.h>
#include "utf16.h"
#define YYCTYPE unsigned short
bool scan(const YYCTYPE * start, const YYCTYPE * const limit)
{
	__attribute__((unused)) const YYCTYPE * YYMARKER; // silence compiler warnings when YYMARKER is not used
#	define YYCURSOR start
Lt:
	
#line 14 "encodings/unicode_group_Lt_x_encoding_policy_fail.c"
{
	YYCTYPE yych;
	yych = *YYCURSOR;
	if (yych <= 0x1F8F) {
		if (yych <= 0x01CA) {
			if (yych <= 0x01C5) {
				if (yych >= 0x01C5) goto yy4;
			} else {
				if (yych == 0x01C8) goto yy4;
			}
		} else {
			if (yych <= 0x01F1) {
				if (yych <= 0x01CB) goto yy4;
			} else {
				if (yych <= 0x01F2) goto yy4;
				if (yych >= 0x1F88) goto yy4;
			}
		}
	} else {
		if (yych <= 0x1FBB) {
			if (yych <= 0x1F9F) {
				if (yych >= 0x1F98) goto yy4;
			} else {
				if (yych <= 0x1FA7) goto yy2;
				if (yych <= 0x1FAF) goto yy4;
			}
		} else {
			if (yych <= 0x1FCC) {
				if (yych <= 0x1FBC) goto yy4;
				if (yych >= 0x1FCC) goto yy4;
			} else {
				if (yych == 0x1FFC) goto yy4;
			}
		}
	}
yy2:
	++YYCURSOR;
#line 14 "encodings/unicode_group_Lt_x_encoding_policy_fail.re"
	{ return YYCURSOR == limit; }
#line 54 "encodings/unicode_group_Lt_x_encoding_policy_fail.c"
yy4:
	++YYCURSOR;
#line 13 "encodings/unicode_group_Lt_x_encoding_policy_fail.re"
	{ goto Lt; }
#line 59 "encodings/unicode_group_Lt_x_encoding_policy_fail.c"
}
#line 15 "encodings/unicode_group_Lt_x_encoding_policy_fail.re"

}
static const unsigned int chars_Lt [] = {0x1c5,0x1c5,  0x1c8,0x1c8,  0x1cb,0x1cb,  0x1f2,0x1f2,  0x1f88,0x1f8f,  0x1f98,0x1f9f,  0x1fa8,0x1faf,  0x1fbc,0x1fbc,  0x1fcc,0x1fcc,  0x1ffc,0x1ffc,  0x0,0x0};
static unsigned int encode_utf16 (const unsigned int * ranges, unsigned int ranges_count, unsigned int * s)
{
	unsigned int * const s_start = s;
	for (unsigned int i = 0; i < ranges_count; i += 2)
		for (unsigned int j = ranges[i]; j <= ranges[i + 1]; ++j)
		{
			if (j <= re2c::utf16::MAX_1WORD_RUNE)
				*s++ = j;
			else
			{
				*s++ = re2c::utf16::lead_surr(j);
				*s++ = re2c::utf16::trail_surr(j);
			}
		}
	return s - s_start;
}

int main ()
{
	unsigned int * buffer_Lt = new unsigned int [64];
	YYCTYPE * s = (YYCTYPE *) buffer_Lt;
	unsigned int buffer_len = encode_utf16 (chars_Lt, sizeof (chars_Lt) / sizeof (unsigned int), buffer_Lt);
	/* convert 32-bit code units to YYCTYPE; reuse the same buffer */
	for (unsigned int i = 0; i < buffer_len; ++i) s[i] = buffer_Lt[i];
	if (!scan (s, s + buffer_len))
		printf("test 'Lt' failed\n");
	delete [] buffer_Lt;
	return 0;
}
