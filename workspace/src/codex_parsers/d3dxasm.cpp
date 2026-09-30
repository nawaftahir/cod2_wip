#define JOIN_(a, b) a##b
#define JOIN(a, b) JOIN_(a, b)
#define YY(n) JOIN(d3dxasm_, n)
#define PARSE d3dxasm_parse
#define PARSER_CLASS CAssembler
#define PARSER_INSTANCE s_pAsm
#define TABLE_SIZE 295
#define FINAL_STATE 16
#define ACTIONS "d3dxasm_actions.inc"
#include "parser_core.h"
