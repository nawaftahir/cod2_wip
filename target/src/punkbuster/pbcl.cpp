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
	chmod(path, 0777);
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
		UnloadClientDll();
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
		m_ReloadClient = 1;
	}

	~stPbCl()
	{
		UnloadClientDll();
		UnloadAgentDll();
	}
};

stPbCl pbcl;

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

void EnablePbCl()
{
	pbcl.AddPbEvent(0x75, 0, 0, 0);
}

void DisablePbCl()
{
	pbcl.AddPbEvent(0x76, 0, 0, 0);
}
