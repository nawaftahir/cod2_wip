#pragma once

#include "../universal/q_shared.h"
#include "../universal/assertive.h"

enum errorParm_t
{
	ERR_FATAL = 0x0,
	ERR_DROP = 0x1,
	ERR_SERVERDISCONNECT = 0x2,
	ERR_DISCONNECT = 0x3,
	ERR_SCRIPT = 0x4,
	ERR_SCRIPT_DROP = 0x5,
	ERR_LOCALIZATION = 0x6,
	ERR_MAPLOADERRORSUMMARY = 0x7,
};

void Com_Error(errorParm_t code, const char *fmt, ...);

#define MAX_VASTRINGS 2

struct va_info_t
{
	char va_string[MAX_VASTRINGS][MAX_STRING_CHARS];
	int index;
};

enum ThreadValue
{
	THREAD_VALUE_PROF_STACK,
	THREAD_VALUE_VA,
	THREAD_VALUE_COM_ERROR,
	THREAD_VALUE_TRACE,
	THREAD_VALUE_COUNT
};

void *Sys_GetValue(int valueIndex);

void Com_Printf(const char *fmt, ...);
void Com_DPrintf(const char *fmt, ...);
enum conChannel_t
{
	CON_CHANNEL_DONT_FILTER = 0x0,
	CON_CHANNEL_ERROR = 0x1,
	CON_CHANNEL_GAMENOTIFY = 0x2,
	CON_CHANNEL_BOLDGAME = 0x3,
	CON_CHANNEL_LOGFILEONLY = 0x4,
};


void Com_PrintMessage(conChannel_t channel, const char *msg);

enum CriticalSection
{
	CRITSECT_EXEC,
	CRITSECT_COUNT
};

void Sys_EnterCriticalSection(int section);
void Sys_LeaveCriticalSection(int section);

void Sys_OutOfMemErrorInternal(const char *filename, int line);
int Sys_MilliSeconds(void);

typedef void (*xcommand_t)(void);
void Cmd_AddCommand(const char *cmd_name, xcommand_t function);

#define MAXPRINTMSG 4096
