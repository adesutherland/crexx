#ifndef _RE2C_IR_DFA_DFA_
#define _RE2C_IR_DFA_DFA_

#include "src/ir/dfa/action.h"
#include "src/ir/dfa/state.h"
#include "src/util/forbid_copy.h"

namespace re2c
{

struct Skeleton;

class DFA
{
	accept_t accepts;
	Skeleton * skeleton;

public:
	const std::string cond;
	const uint32_t line;

	uint32_t lbChar;
	uint32_t ubChar;
	uint32_t nStates;
	State * head;
	State ** tail;
	State * toDo;
	const Ins * free_ins;
	const Char * free_rep;

public:
	DFA
		( const std::string &
		, uint32_t
		, Ins *
		, uint32_t
		, uint32_t
		, uint32_t
		, const Char *
		);
	~DFA ();
	void addState (State **, State *);
	State * findState (Ins **, Ins **);
	void split (State *);

	void findSCCs ();
	void findBaseState ();
	void prepare (OutputFile & o, uint32_t &);
	void count_used_labels (std::set<label_t> & used, label_t prolog, label_t start, bool force_start) const;
	void emit (Output &, uint32_t &, bool, bool &);

	friend std::ostream & operator << (std::ostream &, const DFA &);

	FORBID_COPY (DFA);
};

} // namespace re2c

#endif // _RE2C_IR_DFA_DFA_
