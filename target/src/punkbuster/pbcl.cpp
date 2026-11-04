// PunkBuster client glue (1.3). Names and layout from the Mac 1.3 STABS
// (PC/punkbuster/pbcl.cpp, stPbCl); bodies follow retail 1.3 0x4bb570-0x4bbfb0.
// Not yet written: PbClGameCommand, PbClGameQuery, PbClGameMsg, PbClSendToServer,
// PbClSendToAddrPort, PbTrapPreExecCmd, PbClientTrapConsole, PbClientConnecting,
// PbClientInitialize/ProcessEvents/CompleteCommand (callee names not confirmed).

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <direct.h>
extern "C" int __cdecl _chmod(const char *path, int mode);

struct stPbCl;

char *PbClGameCommand(char *Cmd, char *Result);
char *PbClGameQuery(int Qtype, char *Data);
char *PbClGameMsg(char *Msg, int Type);
char *PbClSendToServer(int DataLen, char *Data);
char *PbClSendToAddrPort(char *addr, unsigned short port, int DataLen, char *Data);

typedef char *(*tdPbGameCommand)(char *, char *);
typedef char *(*tdPbGameQuery)(int, char *);
typedef char *(*tdPbGameMsg)(char *, int);
typedef char *(*tdPbSendToServer)(int, char *);
typedef char *(*tdPbAddClEvent)(stPbCl *, int, int, char *, int);
typedef char *(*tdPbProcessPbEvents)(stPbCl *, int);
typedef char *(*tdPbSendToAddrPort)(char *, unsigned short, int, char *);
typedef char *(*tdPbClientConnect)(stPbCl *, int, char *, int *);
typedef char *(*tdPbTrapPreExecCmd)(stPbCl *, char *);
typedef void (*tdPbTrapConsole)(stPbCl *, char *, int);

// name unknown (no Mac symbol)
inline void pbChmod_813cbd4(char *path)
{
	_chmod(path, 0x180);
}

struct stPbCl
{
	unsigned long m_clId;
	void *m_Md5;
	HMODULE m_ClInstance;
	HMODULE m_AgInstance;
	int m_ReloadClient;
	char m_guid[33];
	char m_msgPrefix[32];
	char m_cwd[256];
	char m_CdKeyNums[17];
	int rk1;
	int rk2;
	int rk3;
	int rk4;
	tdPbGameCommand m_GameCommand;
	tdPbGameQuery m_GameQuery;
	tdPbGameMsg m_GameMsg;
	tdPbSendToServer m_SendToServer;
	tdPbAddClEvent m_AddPbEvent;
	tdPbProcessPbEvents m_ProcessPbEvents;
	tdPbSendToAddrPort m_SendToAddrPort;
	void *m_GlQuery;
	tdPbClientConnect m_ClientConnect;
	tdPbTrapPreExecCmd m_TrapPreExecCmd;
	tdPbTrapConsole m_TrapConsole;
	void *pbsvptr;

	void getHomePath()
	{
		if ( !m_GameQuery )
			return;
		m_GameQuery(103, strcpy(m_cwd, "fs_homepath"));
		if ( !*m_cwd )
			_getcwd(m_cwd, 255);
		if ( *m_cwd && m_cwd[strlen(m_cwd) - 1] != *"\\" )
			strcat(m_cwd, "\\");
		strcat(m_cwd, "pb\\");
	}

	char *makefn(char *buf, char *fn)
	{
		if ( !*m_cwd )
			getHomePath();
		strcpy(buf, m_cwd);
		strcat(buf, fn);
		return buf;
	}

	void UnloadAgentDll()
	{
		if ( m_AgInstance )
			FreeLibrary(m_AgInstance);
		m_AgInstance = 0;
	}

	void uninitialize()
	{
		m_GameCommand = 0;
		m_GameQuery = 0;
		m_GameMsg = 0;
		m_SendToServer = 0;
	}

	/* initialize() (4bb6b0) needs the PbCl* callbacks, not written yet */

	void UnloadClientDll()
	{
		m_ProcessPbEvents = 0;
		m_AddPbEvent = 0;
		m_ClientConnect = 0;
		m_TrapPreExecCmd = 0;
		m_TrapConsole = 0;
		if ( m_ClInstance )
			FreeLibrary(m_ClInstance);
		m_ClInstance = 0;
	}

	char *LoadClientDll()
	{
		char fn[512];
		char extrafn[512];
		FILE *f;

		if ( m_ClInstance )
			return NULL;
		m_ProcessPbEvents = 0;
		m_AddPbEvent = 0;
		m_ClientConnect = 0;
		m_TrapPreExecCmd = 0;
		m_TrapConsole = 0;
		f = fopen(makefn(fn, "pbclnew.dll"), "rb");
		if ( f )
		{
			fclose(f);
			pbChmod_813cbd4(makefn(fn, "pbclold.dll"));
			remove(makefn(fn, "pbclold.dll"));
			rename(makefn(fn, "pbcl.dll"), makefn(extrafn, "pbclold.dll"));
			pbChmod_813cbd4(makefn(fn, "pbcl.dll"));
			remove(makefn(fn, "pbcl.dll"));
			rename(makefn(fn, "pbclnew.dll"), makefn(extrafn, "pbcl.dll"));
		}
		m_ClInstance = LoadLibraryA(makefn(fn, "pbcl.dll"));
		if ( !m_ClInstance )
			return "PB Error: Client DLL Load Failure";
		m_ProcessPbEvents = (tdPbProcessPbEvents)GetProcAddress(m_ClInstance, "ca");
		m_AddPbEvent = (tdPbAddClEvent)GetProcAddress(m_ClInstance, "cb");
		if ( !m_ProcessPbEvents || !m_AddPbEvent )
		{
			UnloadClientDll();
			return "PB Error: Client DLL Get Procedure Failure";
		}
		m_ReloadClient = 0;
		return NULL;
	}

	char *AddPbEvent(int type, int datalen, char *data, int retry)
	{
		if ( !m_GameCommand )
			return NULL;
		if ( m_ReloadClient || !m_ClInstance )
		{
			if ( m_ClInstance )
			{
				UnloadClientDll();
				return NULL;
			}
			char *res = LoadClientDll();
			if ( res )
			{
				if ( type == 0x71 || type == 0x72 )
					return NULL;
				return res;
			}
		}
		return m_AddPbEvent(this, type, datalen, data, retry);
	}

	char *ProcessPbEvents(int n)
	{
		if ( !m_GameCommand )
			return NULL;
		if ( !m_ClInstance )
		{
			if ( m_ReloadClient )
				AddPbEvent(16, 0, "", 0);
			return NULL;
		}
		if ( m_ReloadClient )
		{
			UnloadClientDll();
			return NULL;
		}
		return m_ProcessPbEvents(this, n);
	}

	stPbCl()
	{
		memset(this, 0, sizeof(*this));
		m_clId = 0x264b8baf;
		strcpy(m_msgPrefix, "PunkBuster Client");
		m_AgInstance = 0;
		m_ClInstance = 0;
		uninitialize();
		m_Md5 = 0;
		m_AddPbEvent = 0;
		m_ProcessPbEvents = 0;
		m_SendToAddrPort = 0;
		m_GlQuery = 0;
		m_ClientConnect = 0;
		m_TrapPreExecCmd = 0;
		m_TrapConsole = 0;
		m_ReloadClient = 1;
	}

	~stPbCl()
	{
		UnloadClientDll();
		UnloadAgentDll();
	}
};

stPbCl pbcl;

extern "C" int __cdecl _stricmp(const char *, const char *);
extern void set_cl_punkbuster(char *value);
extern void PBget_cl_cdkey(char *out);
extern void CL_SendPbPacket(int len, char *data);
extern struct dvar_s *Dvar_FindMalleableVar(const char *name);
extern struct dvar_s *Dvar_RegisterString(const char *name, const char *value, unsigned short flags);
enum DvarSetSource { DVAR_SOURCE_INTERNAL };
extern void Dvar_SetFromStringFromSource(struct dvar_s *dvar, const char *value, DvarSetSource source);
extern void Sys_PBSendUdpPacket(char *addr, unsigned short port, int len, char *data);

// retail 0x4bbaa0
char *PbClGameCommand(char *Cmd, char *Result)
{
	char *value;

	value = Result;
	while ( *value == ' ' )
		value++;
	while ( *value && *value != ' ' )
		value++;
	while ( *value == ' ' )
		value++;

	if ( !_stricmp(Cmd, "set_cl_punkbuster") )
	{
		set_cl_punkbuster(Result);
		return NULL;
	}
	if ( _stricmp(Cmd, "Cvar_Set") && _stricmp(Cmd, "Dvar_Set") )
	{
		if ( !_stricmp(Cmd, "get_pb_cdkey") )
			PBget_cl_cdkey(Result);
		return NULL;
	}
	if ( Dvar_FindMalleableVar(Result) )
	{
		struct dvar_s *dvar = Dvar_FindMalleableVar(Result);
		if ( !dvar )
			Dvar_RegisterString(Result, value, 0x4000);
		else
			Dvar_SetFromStringFromSource(dvar, value, DVAR_SOURCE_INTERNAL);
	}
	return NULL;
}

// retail 0x4bbf40
char *PbClSendToServer(int DataLen, char *Data)
{
	CL_SendPbPacket(DataLen, Data);
	return NULL;
}

// retail 0x4bbf90
char *PbClSendToAddrPort(char *addr, unsigned short port, int DataLen, char *Data)
{
	Sys_PBSendUdpPacket(addr, port, DataLen, Data);
	return NULL;
}

void PbClAddEvent(int type, int datalen, char *data)
{
	pbcl.AddPbEvent(type, datalen, data, 0);
}

char *PbTrapPreExecCmd(char *cmd)
{
	if ( !pbcl.m_TrapPreExecCmd )
		return NULL;
	return pbcl.m_TrapPreExecCmd(&pbcl, cmd);
}

void PbClientTrapConsole(char *text, int len)
{
	if ( pbcl.m_TrapConsole )
		pbcl.m_TrapConsole(&pbcl, text, len);
}

struct MD5_CTX
{
	unsigned long i[2];
	unsigned long buf[4];
	unsigned char in[64];
	unsigned char digest[16];
};
extern void MD5Init(MD5_CTX *mdContext, unsigned long pseudoRandomNumber);
extern void MD5Update(MD5_CTX *mdContext, unsigned char *inBuf, unsigned int inLen);
extern void MD5Final(MD5_CTX *mdContext);

// retail 0x4bc160, name unknown: digest as 32 hex characters
void pbMd5ToHex_4bc160(MD5_CTX *ctx, char *out)
{
	sprintf(out, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
		ctx->digest[0], ctx->digest[1], ctx->digest[2], ctx->digest[3],
		ctx->digest[4], ctx->digest[5], ctx->digest[6], ctx->digest[7],
		ctx->digest[8], ctx->digest[9], ctx->digest[10], ctx->digest[11],
		ctx->digest[12], ctx->digest[13], ctx->digest[14], ctx->digest[15]);
}

// retail 0x4bc1d0, name unknown: two seeded MD5 rounds, result kept in m_guid
char *pbMakeGuid_4bc1d0(char *data, int len)
{
	MD5_CTX ctx;

	MD5Init(&ctx, 0xb684a3);
	MD5Update(&ctx, (unsigned char *)data, len);
	MD5Final(&ctx);
	pbMd5ToHex_4bc160(&ctx, pbcl.m_guid);

	MD5Init(&ctx, 0x51a56);
	MD5Update(&ctx, (unsigned char *)pbcl.m_guid, strlen(pbcl.m_guid));
	MD5Final(&ctx);
	pbMd5ToHex_4bc160(&ctx, pbcl.m_guid);
	return pbcl.m_guid;
}

void EnablePbCl()
{
	pbcl.AddPbEvent(0x75, 0, 0, 0);
}

void DisablePbCl()
{
	pbcl.AddPbEvent(0x76, 0, 0, 0);
}
