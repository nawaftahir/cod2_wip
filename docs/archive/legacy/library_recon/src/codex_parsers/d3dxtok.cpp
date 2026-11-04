#define JOIN_(a, b) a##b
#define JOIN(a, b) JOIN_(a, b)
#define YY(n) JOIN(d3dxtok_, n)
#define PARSE d3dxtok_parse
#define PARSER_CLASS CPreProcessor
#define PARSER_INSTANCE s_pPP
#define TABLE_SIZE 369
#define FINAL_STATE 15
#define ACTIONS "d3dxtok_actions.inc"
#include "parser_core.h"
