/* Generated by re2c 2.1.1 on Wed Apr 28 22:34:04 2021 */
#line 1 "../lib/test_helper.re"
#include "lib/test_helper.h"


static inline regoff_t parse_offset(const char *s, const char *e)
{
    regoff_t n = 0;
    for (; s < e; ++s) {
        n = n * 10 + (*s - '0');
    }
    return n;
}

bool parse_submatch(const char *s, std::vector<std::vector<regoff_t> > &result)
{
    result.clear();
    if (!s) return true;

    std::vector<regoff_t> *v;
    const char *n1, *n2, *m1, *m2, *YYMARKER, *YYCURSOR = s;
    const char *yyt1;const char *yyt2;

next:
    result.push_back(std::vector<regoff_t>());
    v = &result.back();

loop:
    
#line 31 "lib/test_helper.cc"
{
	char yych;
	static const unsigned char yybm[] = {
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		128, 128, 128, 128, 128, 128, 128, 128, 
		128, 128,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
		  0,   0,   0,   0,   0,   0,   0,   0, 
	};
	yych = *YYCURSOR;
	if (yych <= '(') {
		if (yych <= 0x00) goto yy2;
		if (yych <= '\'') goto yy4;
		goto yy6;
	} else {
		if (yych == ',') goto yy7;
		goto yy4;
	}
yy2:
	++YYCURSOR;
#line 33 "../lib/test_helper.re"
	{ return true; }
#line 81 "lib/test_helper.cc"
yy4:
	++YYCURSOR;
yy5:
#line 32 "../lib/test_helper.re"
	{ return false; }
#line 87 "lib/test_helper.cc"
yy6:
	yych = *(YYMARKER = ++YYCURSOR);
	if (yych <= '/') goto yy5;
	if (yych <= '9') {
		yyt1 = YYCURSOR;
		goto yy9;
	}
	if (yych == '?') goto yy12;
	goto yy5;
yy7:
	++YYCURSOR;
#line 34 "../lib/test_helper.re"
	{ goto next; }
#line 101 "lib/test_helper.cc"
yy9:
	yych = *++YYCURSOR;
	if (yybm[0+yych] & 128) {
		goto yy9;
	}
	if (yych == ',') goto yy13;
yy11:
	YYCURSOR = YYMARKER;
	goto yy5;
yy12:
	yych = *++YYCURSOR;
	if (yych == ',') goto yy14;
	goto yy11;
yy13:
	yych = *++YYCURSOR;
	if (yych <= '/') goto yy11;
	if (yych <= '9') {
		yyt2 = YYCURSOR;
		goto yy15;
	}
	goto yy11;
yy14:
	yych = *++YYCURSOR;
	if (yych == '?') goto yy17;
	goto yy11;
yy15:
	yych = *++YYCURSOR;
	if (yych == ')') goto yy18;
	if (yych <= '/') goto yy11;
	if (yych <= '9') goto yy15;
	goto yy11;
yy17:
	yych = *++YYCURSOR;
	if (yych == ')') goto yy20;
	goto yy11;
yy18:
	++YYCURSOR;
	n1 = yyt1;
	m1 = yyt2;
	n2 = yyt2 - 1;
	m2 = YYCURSOR - 1;
#line 42 "../lib/test_helper.re"
	{
            v->push_back(parse_offset(n1, n2));
            v->push_back(parse_offset(m1, m2));
            goto loop;
        }
#line 149 "lib/test_helper.cc"
yy20:
	++YYCURSOR;
#line 36 "../lib/test_helper.re"
	{
            v->push_back(-1);
            v->push_back(-1);
            goto loop;
        }
#line 158 "lib/test_helper.cc"
}
#line 47 "../lib/test_helper.re"

}
