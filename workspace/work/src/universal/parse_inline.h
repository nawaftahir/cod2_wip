#pragma once
#include <stddef.h>

#ifdef _MSC_VER
// PINNED 1005f3f0: store tokenPos at45c4 from prevTokenPos at45c8.
typedef char parse_token_offset[(offsetof(ParseThreadInfo, tokenPos) == 0x45c4) ? 1 : -1];
typedef char parse_previous_token_offset[(offsetof(ParseThreadInfo, prevTokenPos) == 0x45c8) ? 1 : -1];
#endif

ParseThreadInfo *Com_GetParseThreadInfo();
void Com_ScriptErrorDrop(const char *message, ...);

// Shared source for retail's inline pushback and public entry.
static __forceinline void Com_UngetTokenInternal()
{
    ParseThreadInfo *parse = Com_GetParseThreadInfo();
    parseInfo_t *info = &parse->parseInfo[parse->parseInfoNum];
    if (info->ungetToken)
        Com_ScriptErrorDrop("UngetToken called twice");
    info->ungetToken = true;
    parse->tokenPos = parse->prevTokenPos;
}

char *Com_ParseExt(const char **text, int allowLineBreaks);

static __forceinline char *Com_ParseInternal( const char **data_p )
{
	ParseThreadInfo *parse;
	parseInfo_t *pi;

	parse = Com_GetParseThreadInfo();
	pi = &parse->parseInfo[parse->parseInfoNum];

	if ( pi->ungetToken )
	{
		pi->ungetToken = false;
		*data_p = pi->backup_text;
		pi->lines = pi->backup_lines;
	}

	return Com_ParseExt( data_p, 1 );
}

