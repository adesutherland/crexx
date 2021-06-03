#line 1 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
#include <assert.h>
#include "ragel/common.c"

const char *delim = "\n";


#line 35 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"



#line 13 "gen/ragel/13__alt2_2.c"
static const int m_start = 5;
static const int m_first_final = 5;
static const int m_error = 0;

static const int m_en_main = 5;


#line 37 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"


static void lex(Input *in, Output *out)
{
	char *p = in->p;
	char *pe = in->pe;
	const char
	*a1, *b1,
	*a2, *b2,
	*a3, *b3,
	*a4, *b4;
	int cs;
	
	
#line 36 "gen/ragel/13__alt2_2.c"
	{
		cs = (int)m_start;
	}
	
#line 50 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
	
	
#line 44 "gen/ragel/13__alt2_2.c"
	{
		switch ( cs ) {
			case 5:
			goto st_case_5;
			case 0:
			goto st_case_0;
			case 1:
			goto st_case_1;
			case 2:
			goto st_case_2;
			case 3:
			goto st_case_3;
			case 4:
			goto st_case_4;
		}
		_ctr2:
		{
#line 20 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a2 = p; b1 = b2 = NULL; }
		
#line 65 "gen/ragel/13__alt2_2.c"
		
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b3 = p; }
		
#line 71 "gen/ragel/13__alt2_2.c"
		
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b4 = p; a3 = a4 = NULL; }
		
#line 77 "gen/ragel/13__alt2_2.c"
		
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a3 = p; }
		
#line 83 "gen/ragel/13__alt2_2.c"
		
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a4 = p; b3 = b4 = NULL; }
		
#line 89 "gen/ragel/13__alt2_2.c"
		
		{
#line 26 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			
			if (a1)      { outc(out, 'A'); outs(out, a1, a2); }
			else if (b1) { outc(out, 'B'); outs(out, b1, b2); }
			if (a3)      { outc(out, 'A'); outs(out, a3, a4); }
			else if (b3) { outc(out, 'B'); outs(out, b3, b4); }
			outc(out, '\n');
		}
		
#line 101 "gen/ragel/13__alt2_2.c"
		
		goto _st5;
		_ctr5:
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b4 = p; a3 = a4 = NULL; }
		
#line 109 "gen/ragel/13__alt2_2.c"
		
		{
#line 26 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			
			if (a1)      { outc(out, 'A'); outs(out, a1, a2); }
			else if (b1) { outc(out, 'B'); outs(out, b1, b2); }
			if (a3)      { outc(out, 'A'); outs(out, a3, a4); }
			else if (b3) { outc(out, 'B'); outs(out, b3, b4); }
			outc(out, '\n');
		}
		
#line 121 "gen/ragel/13__alt2_2.c"
		
		goto _st5;
		_ctr7:
		{
#line 19 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b2 = p; a1 = a2 = NULL; }
		
#line 129 "gen/ragel/13__alt2_2.c"
		
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b3 = p; }
		
#line 135 "gen/ragel/13__alt2_2.c"
		
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b4 = p; a3 = a4 = NULL; }
		
#line 141 "gen/ragel/13__alt2_2.c"
		
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a3 = p; }
		
#line 147 "gen/ragel/13__alt2_2.c"
		
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a4 = p; b3 = b4 = NULL; }
		
#line 153 "gen/ragel/13__alt2_2.c"
		
		{
#line 26 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			
			if (a1)      { outc(out, 'A'); outs(out, a1, a2); }
			else if (b1) { outc(out, 'B'); outs(out, b1, b2); }
			if (a3)      { outc(out, 'A'); outs(out, a3, a4); }
			else if (b3) { outc(out, 'B'); outs(out, b3, b4); }
			outc(out, '\n');
		}
		
#line 165 "gen/ragel/13__alt2_2.c"
		
		goto _st5;
		_ctr10:
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a4 = p; b3 = b4 = NULL; }
		
#line 173 "gen/ragel/13__alt2_2.c"
		
		{
#line 26 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			
			if (a1)      { outc(out, 'A'); outs(out, a1, a2); }
			else if (b1) { outc(out, 'B'); outs(out, b1, b2); }
			if (a3)      { outc(out, 'A'); outs(out, a3, a4); }
			else if (b3) { outc(out, 'B'); outs(out, b3, b4); }
			outc(out, '\n');
		}
		
#line 185 "gen/ragel/13__alt2_2.c"
		
		goto _st5;
		_ctr12:
		{
#line 19 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b1 = p; }
		
#line 193 "gen/ragel/13__alt2_2.c"
		
		{
#line 19 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b2 = p; a1 = a2 = NULL; }
		
#line 199 "gen/ragel/13__alt2_2.c"
		
		{
#line 20 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a1 = p; }
		
#line 205 "gen/ragel/13__alt2_2.c"
		
		{
#line 20 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a2 = p; b1 = b2 = NULL; }
		
#line 211 "gen/ragel/13__alt2_2.c"
		
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b3 = p; }
		
#line 217 "gen/ragel/13__alt2_2.c"
		
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b4 = p; a3 = a4 = NULL; }
		
#line 223 "gen/ragel/13__alt2_2.c"
		
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a3 = p; }
		
#line 229 "gen/ragel/13__alt2_2.c"
		
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a4 = p; b3 = b4 = NULL; }
		
#line 235 "gen/ragel/13__alt2_2.c"
		
		{
#line 26 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			
			if (a1)      { outc(out, 'A'); outs(out, a1, a2); }
			else if (b1) { outc(out, 'B'); outs(out, b1, b2); }
			if (a3)      { outc(out, 'A'); outs(out, a3, a4); }
			else if (b3) { outc(out, 'B'); outs(out, b3, b4); }
			outc(out, '\n');
		}
		
#line 247 "gen/ragel/13__alt2_2.c"
		
		goto _st5;
		_st5:
		p+= 1;
		st_case_5:
		if ( p == pe )
			goto _out5;
		switch( ( (*( p))) ) {
			case 10: {
				goto _ctr12;
			}
			case 97: {
				goto _ctr13;
			}
			case 98: {
				goto _ctr14;
			}
		}
		goto _st0;
		_st0:
		st_case_0:
		goto _out0;
		_ctr13:
		{
#line 20 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a1 = p; }
		
#line 275 "gen/ragel/13__alt2_2.c"
		
		goto _st1;
		_st1:
		p+= 1;
		st_case_1:
		if ( p == pe )
			goto _out1;
		switch( ( (*( p))) ) {
			case 10: {
				goto _ctr2;
			}
			case 97: {
				goto _st1;
			}
			case 98: {
				goto _ctr3;
			}
		}
		goto _st0;
		_ctr3:
		{
#line 20 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a2 = p; b1 = b2 = NULL; }
		
#line 300 "gen/ragel/13__alt2_2.c"
		
		{
#line 23 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b3 = p; }
		
#line 306 "gen/ragel/13__alt2_2.c"
		
		goto _st2;
		_st2:
		p+= 1;
		st_case_2:
		if ( p == pe )
			goto _out2;
		switch( ( (*( p))) ) {
			case 10: {
				goto _ctr5;
			}
			case 98: {
				goto _st2;
			}
		}
		goto _st0;
		_ctr14:
		{
#line 19 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b1 = p; }
		
#line 328 "gen/ragel/13__alt2_2.c"
		
		goto _st3;
		_st3:
		p+= 1;
		st_case_3:
		if ( p == pe )
			goto _out3;
		switch( ( (*( p))) ) {
			case 10: {
				goto _ctr7;
			}
			case 97: {
				goto _ctr8;
			}
			case 98: {
				goto _st3;
			}
		}
		goto _st0;
		_ctr8:
		{
#line 19 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			b2 = p; a1 = a2 = NULL; }
		
#line 353 "gen/ragel/13__alt2_2.c"
		
		{
#line 24 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
			a3 = p; }
		
#line 359 "gen/ragel/13__alt2_2.c"
		
		goto _st4;
		_st4:
		p+= 1;
		st_case_4:
		if ( p == pe )
			goto _out4;
		switch( ( (*( p))) ) {
			case 10: {
				goto _ctr10;
			}
			case 97: {
				goto _st4;
			}
		}
		goto _st0;
		_out5: cs = 5; goto _out; 
		_out0: cs = 0; goto _out; 
		_out1: cs = 1; goto _out; 
		_out2: cs = 2; goto _out; 
		_out3: cs = 3; goto _out; 
		_out4: cs = 4; goto _out; 
		_out: {}
	}
	
#line 51 "../../../benchmarks/submatch_dfa_aot/src/ragel/13__alt2_2.rl"
	
	
	in->p = p;
	in->pe = pe;
}
