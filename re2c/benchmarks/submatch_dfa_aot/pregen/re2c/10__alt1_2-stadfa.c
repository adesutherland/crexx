/* Generated by re2c */
#line 1 "../../../benchmarks/submatch_dfa_aot/src/re2c/10__alt1_2.re"
#include <assert.h>
#include <stdlib.h>
#include "common.h"

#line 15 "../../../benchmarks/submatch_dfa_aot/src/re2c/common.re"


typedef struct taglist_t {
    struct taglist_t *pred;
    long dist;
} taglist_t;

typedef struct taglistpool_t {
    taglist_t *head;
    taglist_t *next;
    taglist_t *last;
} taglistpool_t;

typedef struct {
    char *buf;
    char *lim;
    char *cur;
    char *mar;
    char *tok;
    char *yyt1;
char *yyt2;
char *yyt3;
char *yyt4;

    
    taglistpool_t tlp;
    int eof;
} input_t;

static inline void taglistpool_clear(taglistpool_t *tlp, input_t *in)
{
    tlp->next = tlp->head;
    
}

static inline void taglistpool_init(taglistpool_t *tlp)
{
    static const unsigned size = 1024 * 1024;
    tlp->head = (taglist_t*)malloc(size * sizeof(taglist_t));
    tlp->next = tlp->head;
    tlp->last = tlp->head + size;
}

static inline void taglistpool_free(taglistpool_t *tlp)
{
    free(tlp->head);
    tlp->head = tlp->next = tlp->last = NULL;
}

static inline void taglist(taglist_t **ptl, const char *b, const char *t, taglistpool_t *tlp)
{
#ifdef GROW_MTAG_LIST
    if (tlp->next >= tlp->last) {
        const unsigned size = tlp->last - tlp->head;
        taglist_t *head = (taglist_t*)malloc(2 * size * sizeof(taglist_t));
        memcpy(head, tlp->head, size * sizeof(taglist_t));
        free(tlp->head);
        tlp->head = head;
        tlp->next = head + size;
        tlp->last = head + size * 2;
    }
#else
    assert(tlp->next < tlp->last);
#endif
    taglist_t *tl = tlp->next++;
    tl->pred = *ptl;
    tl->dist = t - b;
    *ptl = tl;
}

#line 4 "../../../benchmarks/submatch_dfa_aot/src/re2c/include/fill.re"


#define YYMAXFILL 2


static inline int fill(input_t *in, size_t need)
{
    size_t free;
    if (in->eof) return 1;

    free = in->tok - in->buf;
    assert(free >= need);

    memmove(in->buf, in->tok, in->lim - in->tok);
    in->lim -= free;
    in->cur -= free;
    in->mar -= free;
    in->tok -= free;
    if (in->yyt1) in->yyt1 -= free;
if (in->yyt2) in->yyt2 -= free;
if (in->yyt3) in->yyt3 -= free;
if (in->yyt4) in->yyt4 -= free;


    in->lim += fread(in->lim, 1, free, stdin);

    if (in->lim < in->buf + SIZE) {
        in->eof = 1;
        memset(in->lim, 0, YYMAXFILL);
        in->lim += YYMAXFILL;
    }

    return 0;
}

static inline void init_input(input_t *in)
{
    in->buf = (char*) malloc(SIZE + YYMAXFILL);
    in->lim = in->buf + SIZE;
    in->cur = in->lim;
    in->mar = in->lim;
    in->tok = in->lim;
    in->yyt1 = 0;
in->yyt2 = 0;
in->yyt3 = 0;
in->yyt4 = 0;

    
    taglistpool_init(&in->tlp);
    in->eof = 0;
}


static inline void free_input(input_t *in)
{
    free(in->buf);
    taglistpool_free(&in->tlp);
}

static int lex(input_t *in, Output *out);

int main(int argc, char **argv)
{
    PRE;
    input_t in;
    Output out;

    init_input(&in);
    init_output(&out);

    switch (lex(&in, &out)) {
        case 0:  break;
        case 1:  fprintf(stderr, "*** %s: syntax error\n", argv[0]); break;
        case 2:  fprintf(stderr, "*** %s: yyfill error\n", argv[0]); break;
        default: fprintf(stderr, "*** %s: panic\n", argv[0]); break;
    }

    flush(&out);
    free_output(&out);
    free_input(&in);

    POST;
    return 0;
}


static int lex(input_t *in, Output *out)
{
    const char
        *a1, *b1,
        *a2, *b2;
loop:
    in->tok = in->cur;

#line 174 "gen/re2c/10__alt1_2-stadfa.c"
{
	char yych;
	if ((in->lim - in->cur) < 2) if (fill(in, 2) != 0) return 1;
	yych = *in->cur;
	switch (yych) {
	case 0x00:	goto yy2;
	case '\n':	goto yy6;
	case 'a':	goto yy8;
	case 'b':	goto yy9;
	default:	goto yy4;
	}
yy2:
	++in->cur;
#line 3 "../../../benchmarks/submatch_dfa_aot/src/re2c/include/fill.re"
	{ return 0; }
#line 190 "gen/re2c/10__alt1_2-stadfa.c"
yy4:
	++in->cur;
yy5:
#line 11 "../../../benchmarks/submatch_dfa_aot/src/re2c/10__alt1_2.re"
	{ return 1; }
#line 196 "gen/re2c/10__alt1_2-stadfa.c"
yy6:
	++in->cur;
	in->yyt3 = in->yyt4 = NULL;
	in->yyt1 = in->yyt2 = in->cur - 1;
yy7:
	a1 = in->yyt1;
	a2 = in->yyt2;
	b1 = in->yyt3;
	b2 = in->yyt4;
#line 16 "../../../benchmarks/submatch_dfa_aot/src/re2c/10__alt1_2.re"
	{
        if (a1)      { outc(out, 'A'); outs(out, a1, a2); }
        else if (b1) { outc(out, 'B'); outs(out, b1, b2); }
        outc(out, '\n');
        goto loop;
    }
#line 213 "gen/re2c/10__alt1_2-stadfa.c"
yy8:
	yych = *(in->mar = ++in->cur);
	in->yyt1 = in->cur - 1;
	switch (yych) {
	case '\n':	goto yy10;
	case 'a':	goto yy11;
	default:	goto yy5;
	}
yy9:
	yych = *(in->mar = ++in->cur);
	in->yyt3 = in->cur - 1;
	switch (yych) {
	case '\n':	goto yy14;
	case 'b':	goto yy15;
	default:	goto yy5;
	}
yy10:
	++in->cur;
	in->yyt3 = in->yyt4 = NULL;
	in->yyt2 = in->cur - 1;
	goto yy7;
yy11:
	++in->cur;
	if (in->lim <= in->cur) if (fill(in, 1) != 0) return 1;
	yych = *in->cur;
	switch (yych) {
	case '\n':	goto yy10;
	case 'a':	goto yy11;
	default:	goto yy13;
	}
yy13:
	in->cur = in->mar;
	goto yy5;
yy14:
	++in->cur;
	in->yyt1 = in->yyt2 = NULL;
	in->yyt4 = in->cur - 1;
	goto yy7;
yy15:
	++in->cur;
	if (in->lim <= in->cur) if (fill(in, 1) != 0) return 1;
	yych = *in->cur;
	switch (yych) {
	case '\n':	goto yy14;
	case 'b':	goto yy15;
	default:	goto yy13;
	}
}
#line 22 "../../../benchmarks/submatch_dfa_aot/src/re2c/10__alt1_2.re"

}
