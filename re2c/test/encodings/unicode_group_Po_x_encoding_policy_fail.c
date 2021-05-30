/* Generated by re2c */
#line 1 "encodings/unicode_group_Po_x_encoding_policy_fail.re"
// re2c $INPUT -o $OUTPUT -x --encoding-policy fail
#include <stdio.h>
#include "utf16.h"
#define YYCTYPE unsigned short
bool scan(const YYCTYPE * start, const YYCTYPE * const limit)
{
	__attribute__((unused)) const YYCTYPE * YYMARKER; // silence compiler warnings when YYMARKER is not used
#	define YYCURSOR start
Po:
	
#line 14 "encodings/unicode_group_Po_x_encoding_policy_fail.c"
{
	YYCTYPE yych;
	yych = *YYCURSOR;
	if (yych <= 0x203A) {
		if (yych <= 0x0970) {
			if (yych <= 0x0589) {
				if (yych <= '\\') {
					if (yych <= ',') {
						if (yych <= '\'') {
							if (yych <= ' ') goto yy2;
							if (yych != '$') goto yy4;
						} else {
							if (yych == '*') goto yy4;
							if (yych >= ',') goto yy4;
						}
					} else {
						if (yych <= ';') {
							if (yych <= '-') goto yy2;
							if (yych <= '/') goto yy4;
							if (yych >= ':') goto yy4;
						} else {
							if (yych <= '>') goto yy2;
							if (yych <= '@') goto yy4;
							if (yych >= '\\') goto yy4;
						}
					}
				} else {
					if (yych <= 0x00BF) {
						if (yych <= 0x00A7) {
							if (yych == 0x00A1) goto yy4;
							if (yych >= 0x00A7) goto yy4;
						} else {
							if (yych <= 0x00B5) goto yy2;
							if (yych <= 0x00B7) goto yy4;
							if (yych >= 0x00BF) goto yy4;
						}
					} else {
						if (yych <= 0x0387) {
							if (yych == 0x037E) goto yy4;
							if (yych >= 0x0387) goto yy4;
						} else {
							if (yych <= 0x0559) goto yy2;
							if (yych <= 0x055F) goto yy4;
							if (yych >= 0x0589) goto yy4;
						}
					}
				}
			} else {
				if (yych <= 0x061F) {
					if (yych <= 0x05F4) {
						if (yych <= 0x05C3) {
							if (yych == 0x05C0) goto yy4;
							if (yych >= 0x05C3) goto yy4;
						} else {
							if (yych == 0x05C6) goto yy4;
							if (yych >= 0x05F3) goto yy4;
						}
					} else {
						if (yych <= 0x060D) {
							if (yych <= 0x0608) goto yy2;
							if (yych != 0x060B) goto yy4;
						} else {
							if (yych == 0x061B) goto yy4;
							if (yych >= 0x061E) goto yy4;
						}
					}
				} else {
					if (yych <= 0x07F9) {
						if (yych <= 0x06D4) {
							if (yych <= 0x0669) goto yy2;
							if (yych <= 0x066D) goto yy4;
							if (yych >= 0x06D4) goto yy4;
						} else {
							if (yych <= 0x06FF) goto yy2;
							if (yych <= 0x070D) goto yy4;
							if (yych >= 0x07F7) goto yy4;
						}
					} else {
						if (yych <= 0x085E) {
							if (yych <= 0x082F) goto yy2;
							if (yych <= 0x083E) goto yy4;
							if (yych >= 0x085E) goto yy4;
						} else {
							if (yych <= 0x0963) goto yy2;
							if (yych <= 0x0965) goto yy4;
							if (yych >= 0x0970) goto yy4;
						}
					}
				}
			}
		} else {
			if (yych <= 0x17D6) {
				if (yych <= 0x0FD4) {
					if (yych <= 0x0E5B) {
						if (yych <= 0x0DF4) {
							if (yych == 0x0AF0) goto yy4;
							if (yych >= 0x0DF4) goto yy4;
						} else {
							if (yych == 0x0E4F) goto yy4;
							if (yych >= 0x0E5A) goto yy4;
						}
					} else {
						if (yych <= 0x0F14) {
							if (yych <= 0x0F03) goto yy2;
							if (yych != 0x0F13) goto yy4;
						} else {
							if (yych == 0x0F85) goto yy4;
							if (yych >= 0x0FD0) goto yy4;
						}
					}
				} else {
					if (yych <= 0x1368) {
						if (yych <= 0x104F) {
							if (yych <= 0x0FD8) goto yy2;
							if (yych <= 0x0FDA) goto yy4;
							if (yych >= 0x104A) goto yy4;
						} else {
							if (yych == 0x10FB) goto yy4;
							if (yych >= 0x1360) goto yy4;
						}
					} else {
						if (yych <= 0x16ED) {
							if (yych <= 0x166C) goto yy2;
							if (yych <= 0x166E) goto yy4;
							if (yych >= 0x16EB) goto yy4;
						} else {
							if (yych <= 0x1734) goto yy2;
							if (yych <= 0x1736) goto yy4;
							if (yych >= 0x17D4) goto yy4;
						}
					}
				}
			} else {
				if (yych <= 0x1B60) {
					if (yych <= 0x1945) {
						if (yych <= 0x1805) {
							if (yych <= 0x17D7) goto yy2;
							if (yych <= 0x17DA) goto yy4;
							if (yych >= 0x1800) goto yy4;
						} else {
							if (yych <= 0x1806) goto yy2;
							if (yych <= 0x180A) goto yy4;
							if (yych >= 0x1944) goto yy4;
						}
					} else {
						if (yych <= 0x1AA6) {
							if (yych <= 0x1A1D) goto yy2;
							if (yych <= 0x1A1F) goto yy4;
							if (yych >= 0x1AA0) goto yy4;
						} else {
							if (yych <= 0x1AA7) goto yy2;
							if (yych <= 0x1AAD) goto yy4;
							if (yych >= 0x1B5A) goto yy4;
						}
					}
				} else {
					if (yych <= 0x1CC7) {
						if (yych <= 0x1C3F) {
							if (yych <= 0x1BFB) goto yy2;
							if (yych <= 0x1BFF) goto yy4;
							if (yych >= 0x1C3B) goto yy4;
						} else {
							if (yych <= 0x1C7D) goto yy2;
							if (yych <= 0x1C7F) goto yy4;
							if (yych >= 0x1CC0) goto yy4;
						}
					} else {
						if (yych <= 0x2017) {
							if (yych == 0x1CD3) goto yy4;
							if (yych >= 0x2016) goto yy4;
						} else {
							if (yych <= 0x2027) {
								if (yych >= 0x2020) goto yy4;
							} else {
								if (yych <= 0x202F) goto yy2;
								if (yych <= 0x2038) goto yy4;
							}
						}
					}
				}
			}
		}
	} else {
		if (yych <= 0xA9C0) {
			if (yych <= 0x2E2F) {
				if (yych <= 0x2DFF) {
					if (yych <= 0x2054) {
						if (yych <= 0x2046) {
							if (yych <= 0x203E) goto yy4;
							if (yych <= 0x2040) goto yy2;
							if (yych <= 0x2043) goto yy4;
						} else {
							if (yych == 0x2052) goto yy2;
							if (yych <= 0x2053) goto yy4;
						}
					} else {
						if (yych <= 0x2CFD) {
							if (yych <= 0x205E) goto yy4;
							if (yych <= 0x2CF8) goto yy2;
							if (yych <= 0x2CFC) goto yy4;
						} else {
							if (yych <= 0x2CFF) goto yy4;
							if (yych == 0x2D70) goto yy4;
						}
					}
				} else {
					if (yych <= 0x2E17) {
						if (yych <= 0x2E0A) {
							if (yych <= 0x2E01) goto yy4;
							if (yych <= 0x2E05) goto yy2;
							if (yych <= 0x2E08) goto yy4;
						} else {
							if (yych <= 0x2E0B) goto yy4;
							if (yych <= 0x2E0D) goto yy2;
							if (yych <= 0x2E16) goto yy4;
						}
					} else {
						if (yych <= 0x2E1D) {
							if (yych == 0x2E1A) goto yy2;
							if (yych <= 0x2E1B) goto yy4;
						} else {
							if (yych <= 0x2E1F) goto yy4;
							if (yych <= 0x2E29) goto yy2;
							if (yych <= 0x2E2E) goto yy4;
						}
					}
				}
			} else {
				if (yych <= 0xA672) {
					if (yych <= 0x303C) {
						if (yych <= 0x2E40) {
							if (yych <= 0x2E39) goto yy4;
							if (yych <= 0x2E3B) goto yy2;
							if (yych <= 0x2E3F) goto yy4;
						} else {
							if (yych <= 0x2E41) goto yy4;
							if (yych <= 0x3000) goto yy2;
							if (yych <= 0x3003) goto yy4;
						}
					} else {
						if (yych <= 0xA4FD) {
							if (yych <= 0x303D) goto yy4;
							if (yych == 0x30FB) goto yy4;
						} else {
							if (yych <= 0xA4FF) goto yy4;
							if (yych <= 0xA60C) goto yy2;
							if (yych <= 0xA60F) goto yy4;
						}
					}
				} else {
					if (yych <= 0xA8CD) {
						if (yych <= 0xA6F1) {
							if (yych <= 0xA673) goto yy4;
							if (yych == 0xA67E) goto yy4;
						} else {
							if (yych <= 0xA6F7) goto yy4;
							if (yych <= 0xA873) goto yy2;
							if (yych <= 0xA877) goto yy4;
						}
					} else {
						if (yych <= 0xA92D) {
							if (yych <= 0xA8CF) goto yy4;
							if (yych <= 0xA8F7) goto yy2;
							if (yych <= 0xA8FA) goto yy4;
						} else {
							if (yych <= 0xA92F) goto yy4;
							if (yych == 0xA95F) goto yy4;
						}
					}
				}
			}
		} else {
			if (yych <= 0xFE46) {
				if (yych <= 0xD803) {
					if (yych <= 0xAAEF) {
						if (yych <= 0xAA5B) {
							if (yych <= 0xA9CD) goto yy4;
							if (yych <= 0xA9DD) goto yy2;
							if (yych <= 0xA9DF) goto yy4;
						} else {
							if (yych <= 0xAA5F) goto yy4;
							if (yych <= 0xAADD) goto yy2;
							if (yych <= 0xAADF) goto yy4;
						}
					} else {
						if (yych <= 0xD7FF) {
							if (yych <= 0xAAF1) goto yy4;
							if (yych == 0xABEB) goto yy4;
						} else {
							if (yych <= 0xD800) goto yy6;
							if (yych <= 0xD801) goto yy7;
							if (yych <= 0xD802) goto yy8;
						}
					}
				} else {
					if (yych <= 0xD82F) {
						if (yych <= 0xD809) {
							if (yych <= 0xD804) goto yy9;
							if (yych <= 0xD805) goto yy10;
							if (yych >= 0xD809) goto yy11;
						} else {
							if (yych == 0xD81A) goto yy12;
							if (yych >= 0xD82F) goto yy13;
						}
					} else {
						if (yych <= 0xFE19) {
							if (yych <= 0xFE0F) goto yy2;
							if (yych <= 0xFE16) goto yy4;
							if (yych >= 0xFE19) goto yy4;
						} else {
							if (yych == 0xFE30) goto yy4;
							if (yych >= 0xFE45) goto yy4;
						}
					}
				}
			} else {
				if (yych <= 0xFF07) {
					if (yych <= 0xFE61) {
						if (yych <= 0xFE52) {
							if (yych <= 0xFE48) goto yy2;
							if (yych <= 0xFE4C) goto yy4;
							if (yych >= 0xFE50) goto yy4;
						} else {
							if (yych <= 0xFE53) goto yy2;
							if (yych <= 0xFE57) goto yy4;
							if (yych >= 0xFE5F) goto yy4;
						}
					} else {
						if (yych <= 0xFE6B) {
							if (yych == 0xFE68) goto yy4;
							if (yych >= 0xFE6A) goto yy4;
						} else {
							if (yych <= 0xFF00) goto yy2;
							if (yych != 0xFF04) goto yy4;
						}
					}
				} else {
					if (yych <= 0xFF1B) {
						if (yych <= 0xFF0C) {
							if (yych == 0xFF0A) goto yy4;
							if (yych >= 0xFF0C) goto yy4;
						} else {
							if (yych <= 0xFF0D) goto yy2;
							if (yych <= 0xFF0F) goto yy4;
							if (yych >= 0xFF1A) goto yy4;
						}
					} else {
						if (yych <= 0xFF3C) {
							if (yych <= 0xFF1E) goto yy2;
							if (yych <= 0xFF20) goto yy4;
							if (yych >= 0xFF3C) goto yy4;
						} else {
							if (yych <= 0xFF61) {
								if (yych >= 0xFF61) goto yy4;
							} else {
								if (yych <= 0xFF63) goto yy2;
								if (yych <= 0xFF65) goto yy4;
							}
						}
					}
				}
			}
		}
	}
yy2:
	++YYCURSOR;
yy3:
#line 14 "encodings/unicode_group_Po_x_encoding_policy_fail.re"
	{ return YYCURSOR == limit; }
#line 384 "encodings/unicode_group_Po_x_encoding_policy_fail.c"
yy4:
	++YYCURSOR;
#line 13 "encodings/unicode_group_Po_x_encoding_policy_fail.re"
	{ goto Po; }
#line 389 "encodings/unicode_group_Po_x_encoding_policy_fail.c"
yy6:
	yych = *++YYCURSOR;
	if (yych <= 0xDF9E) {
		if (yych <= 0xDCFF) goto yy3;
		if (yych <= 0xDD02) goto yy4;
		goto yy3;
	} else {
		if (yych <= 0xDF9F) goto yy4;
		if (yych == 0xDFD0) goto yy4;
		goto yy3;
	}
yy7:
	yych = *++YYCURSOR;
	if (yych == 0xDD6F) goto yy4;
	goto yy3;
yy8:
	yych = *++YYCURSOR;
	if (yych <= 0xDE58) {
		if (yych <= 0xDD1F) {
			if (yych == 0xDC57) goto yy4;
			if (yych <= 0xDD1E) goto yy3;
			goto yy4;
		} else {
			if (yych == 0xDD3F) goto yy4;
			if (yych <= 0xDE4F) goto yy3;
			goto yy4;
		}
	} else {
		if (yych <= 0xDEF6) {
			if (yych == 0xDE7F) goto yy4;
			if (yych <= 0xDEEF) goto yy3;
			goto yy4;
		} else {
			if (yych <= 0xDF3F) {
				if (yych <= 0xDF38) goto yy3;
				goto yy4;
			} else {
				if (yych <= 0xDF98) goto yy3;
				if (yych <= 0xDF9C) goto yy4;
				goto yy3;
			}
		}
	}
yy9:
	yych = *++YYCURSOR;
	if (yych <= 0xDD43) {
		if (yych <= 0xDCBC) {
			if (yych <= 0xDC46) goto yy3;
			if (yych <= 0xDC4D) goto yy4;
			if (yych <= 0xDCBA) goto yy3;
			goto yy4;
		} else {
			if (yych <= 0xDCBD) goto yy3;
			if (yych <= 0xDCC1) goto yy4;
			if (yych <= 0xDD3F) goto yy3;
			goto yy4;
		}
	} else {
		if (yych <= 0xDDC8) {
			if (yych <= 0xDD73) goto yy3;
			if (yych <= 0xDD75) goto yy4;
			if (yych <= 0xDDC4) goto yy3;
			goto yy4;
		} else {
			if (yych <= 0xDDCD) {
				if (yych <= 0xDDCC) goto yy3;
				goto yy4;
			} else {
				if (yych <= 0xDE37) goto yy3;
				if (yych <= 0xDE3D) goto yy4;
				goto yy3;
			}
		}
	}
yy10:
	yych = *++YYCURSOR;
	if (yych <= 0xDDC0) {
		if (yych == 0xDCC6) goto yy4;
		goto yy3;
	} else {
		if (yych <= 0xDDC9) goto yy4;
		if (yych <= 0xDE40) goto yy3;
		if (yych <= 0xDE43) goto yy4;
		goto yy3;
	}
yy11:
	yych = *++YYCURSOR;
	if (yych <= 0xDC6F) goto yy3;
	if (yych <= 0xDC74) goto yy4;
	goto yy3;
yy12:
	yych = *++YYCURSOR;
	if (yych <= 0xDEF5) {
		if (yych <= 0xDE6D) goto yy3;
		if (yych <= 0xDE6F) goto yy4;
		if (yych <= 0xDEF4) goto yy3;
		goto yy4;
	} else {
		if (yych <= 0xDF3B) {
			if (yych <= 0xDF36) goto yy3;
			goto yy4;
		} else {
			if (yych == 0xDF44) goto yy4;
			goto yy3;
		}
	}
yy13:
	yych = *++YYCURSOR;
	if (yych == 0xDC9F) goto yy4;
	goto yy3;
}
#line 15 "encodings/unicode_group_Po_x_encoding_policy_fail.re"

}
static const unsigned int chars_Po [] = {0x21,0x23,  0x25,0x27,  0x2a,0x2a,  0x2c,0x2c,  0x2e,0x2f,  0x3a,0x3b,  0x3f,0x40,  0x5c,0x5c,  0xa1,0xa1,  0xa7,0xa7,  0xb6,0xb7,  0xbf,0xbf,  0x37e,0x37e,  0x387,0x387,  0x55a,0x55f,  0x589,0x589,  0x5c0,0x5c0,  0x5c3,0x5c3,  0x5c6,0x5c6,  0x5f3,0x5f4,  0x609,0x60a,  0x60c,0x60d,  0x61b,0x61b,  0x61e,0x61f,  0x66a,0x66d,  0x6d4,0x6d4,  0x700,0x70d,  0x7f7,0x7f9,  0x830,0x83e,  0x85e,0x85e,  0x964,0x965,  0x970,0x970,  0xaf0,0xaf0,  0xdf4,0xdf4,  0xe4f,0xe4f,  0xe5a,0xe5b,  0xf04,0xf12,  0xf14,0xf14,  0xf85,0xf85,  0xfd0,0xfd4,  0xfd9,0xfda,  0x104a,0x104f,  0x10fb,0x10fb,  0x1360,0x1368,  0x166d,0x166e,  0x16eb,0x16ed,  0x1735,0x1736,  0x17d4,0x17d6,  0x17d8,0x17da,  0x1800,0x1805,  0x1807,0x180a,  0x1944,0x1945,  0x1a1e,0x1a1f,  0x1aa0,0x1aa6,  0x1aa8,0x1aad,  0x1b5a,0x1b60,  0x1bfc,0x1bff,  0x1c3b,0x1c3f,  0x1c7e,0x1c7f,  0x1cc0,0x1cc7,  0x1cd3,0x1cd3,  0x2016,0x2017,  0x2020,0x2027,  0x2030,0x2038,  0x203b,0x203e,  0x2041,0x2043,  0x2047,0x2051,  0x2053,0x2053,  0x2055,0x205e,  0x2cf9,0x2cfc,  0x2cfe,0x2cff,  0x2d70,0x2d70,  0x2e00,0x2e01,  0x2e06,0x2e08,  0x2e0b,0x2e0b,  0x2e0e,0x2e16,  0x2e18,0x2e19,  0x2e1b,0x2e1b,  0x2e1e,0x2e1f,  0x2e2a,0x2e2e,  0x2e30,0x2e39,  0x2e3c,0x2e3f,  0x2e41,0x2e41,  0x3001,0x3003,  0x303d,0x303d,  0x30fb,0x30fb,  0xa4fe,0xa4ff,  0xa60d,0xa60f,  0xa673,0xa673,  0xa67e,0xa67e,  0xa6f2,0xa6f7,  0xa874,0xa877,  0xa8ce,0xa8cf,  0xa8f8,0xa8fa,  0xa92e,0xa92f,  0xa95f,0xa95f,  0xa9c1,0xa9cd,  0xa9de,0xa9df,  0xaa5c,0xaa5f,  0xaade,0xaadf,  0xaaf0,0xaaf1,  0xabeb,0xabeb,  0xfe10,0xfe16,  0xfe19,0xfe19,  0xfe30,0xfe30,  0xfe45,0xfe46,  0xfe49,0xfe4c,  0xfe50,0xfe52,  0xfe54,0xfe57,  0xfe5f,0xfe61,  0xfe68,0xfe68,  0xfe6a,0xfe6b,  0xff01,0xff03,  0xff05,0xff07,  0xff0a,0xff0a,  0xff0c,0xff0c,  0xff0e,0xff0f,  0xff1a,0xff1b,  0xff1f,0xff20,  0xff3c,0xff3c,  0xff61,0xff61,  0xff64,0xff65,  0x10100,0x10102,  0x1039f,0x1039f,  0x103d0,0x103d0,  0x1056f,0x1056f,  0x10857,0x10857,  0x1091f,0x1091f,  0x1093f,0x1093f,  0x10a50,0x10a58,  0x10a7f,0x10a7f,  0x10af0,0x10af6,  0x10b39,0x10b3f,  0x10b99,0x10b9c,  0x11047,0x1104d,  0x110bb,0x110bc,  0x110be,0x110c1,  0x11140,0x11143,  0x11174,0x11175,  0x111c5,0x111c8,  0x111cd,0x111cd,  0x11238,0x1123d,  0x114c6,0x114c6,  0x115c1,0x115c9,  0x11641,0x11643,  0x12470,0x12474,  0x16a6e,0x16a6f,  0x16af5,0x16af5,  0x16b37,0x16b3b,  0x16b44,0x16b44,  0x1bc9f,0x1bc9f,  0x0,0x0};
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
	unsigned int * buffer_Po = new unsigned int [970];
	YYCTYPE * s = (YYCTYPE *) buffer_Po;
	unsigned int buffer_len = encode_utf16 (chars_Po, sizeof (chars_Po) / sizeof (unsigned int), buffer_Po);
	/* convert 32-bit code units to YYCTYPE; reuse the same buffer */
	for (unsigned int i = 0; i < buffer_len; ++i) s[i] = buffer_Po[i];
	if (!scan (s, s + buffer_len))
		printf("test 'Po' failed\n");
	delete [] buffer_Po;
	return 0;
}
