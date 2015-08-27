#ifndef _RE2C_CONF_WARN_
#define _RE2C_CONF_WARN_

#include <vector>

#include "src/util/c99_stdint.h"

namespace re2c {

#define RE2C_WARNING_TYPES \
	W (CONDITION_ORDER,       "condition-order"), \
	W (EMPTY_CHARACTER_CLASS, "empty-character-class"), \
	W (MATCH_EMPTY_STRING,    "match-empty-string"), \
	W (NAKED_DEFAULT,         "naked-default"), \
	W (SWAPPED_RANGE,         "swapped-range"), \
	W (USELESS_ESCAPE,        "useless-escape"),

class Warn
{
public:
	enum type_t
	{
#define W(x, y) x
		RE2C_WARNING_TYPES
#undef W
		TYPES // count
	};
	enum option_t
	{
		W,
		WNO,
		WERROR,
		WNOERROR
	};

private:
	static const uint32_t SILENT;
	static const uint32_t WARNING;
	static const uint32_t ERROR;
	static const char * names [TYPES];
	uint32_t mask[TYPES];
	bool error_accuml;

public:
	Warn ();
	bool error () const;
	void set (type_t t, option_t o);
	void set_all ();
	void set_all_error ();
	void condition_order (uint32_t line);
	void empty_class (uint32_t line);
	void match_empty_string (uint32_t line);
	void naked_default (uint32_t line, const std::vector<std::pair<uint32_t, uint32_t> > & stray_cunits, const std::string & cond);
	void swapped_range (uint32_t line, uint32_t l, uint32_t u);
	void useless_escape (uint32_t line, uint32_t col, char c);
};

} // namespace re2c

#endif // _RE2C_CONF_WARN_
