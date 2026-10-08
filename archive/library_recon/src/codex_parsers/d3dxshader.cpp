#define JOIN_(a, b) a##b
#define JOIN(a, b) JOIN_(a, b)
#define YY(n) JOIN(d3dxshader_, n)
#define PARSE d3dxshader_parse
#define PARSER_CLASS CParse
#define PARSER_INSTANCE s_pParse
#define TABLE_SIZE 3464
#define FINAL_STATE 40
#define ACTIONS "d3dxshader_actions.inc"
#include "parser_core.h"
