// Perforce client helpers: the p4api 2005.1 client (headers copied under p4/) driven from the file menu.
#include "stdafx.h"
#define OS_NT
#include "p4/clientapi.h"

// This TU is built with frame pointer omission; the shared flags force /Oy-.

extern int DAT_012334b4;

// Message-box UI. StdClientUser is the RTTI name; DAT_012334b4 is set when the server reports an error.
class StdClientUser : public ClientUser
{
public:
  virtual void OutputError(const char *errBuf);
  virtual void OutputInfo(char level, const char *data);
  virtual void OutputText(const char *data, int length);
};

void StdClientUser::OutputError(const char *errBuf)
{
  HWND wnd = ::GetActiveWindow();
  ::MessageBoxA(wnd, errBuf, "Perforce Error", MB_ICONERROR);
  DAT_012334b4 = 1;
}

void StdClientUser::OutputInfo(char level, const char *data)
{
  HWND wnd = ::GetActiveWindow();
  ::MessageBoxA(wnd, data, "Perforce Info", MB_ICONINFORMATION);
}

void StdClientUser::OutputText(const char *data, int length)
{
  HWND wnd = ::GetActiveWindow();
  ::MessageBoxA(wnd, data, "Perforce Text", MB_ICONINFORMATION);
}

// Show the error text; true when there was an error.
static bool FUN_004251c0(Error *e)
{
  if (!e->Test())
    return false;
  HWND wnd = ::GetActiveWindow();
  StrBuf text;
  e->Fmt(&text);
  ::MessageBoxA(wnd, text.Text(), "Perforce Error", MB_ICONERROR);
  return true;
}

#define P4_COMMAND(name, command) \
bool name(int *file) \
{ \
  StdClientUser ui; \
  ClientApi client; \
  Error e; \
  client.Init(&e); \
  if (FUN_004251c0(&e)) \
    return false; \
  char *argv[1] = { (char *)file }; \
  client.SetArgv(1, argv); \
  client.Run(command, &ui); \
  if (DAT_012334b4) \
  { \
    DAT_012334b4 = 0; \
    return false; \
  } \
  client.Final(&e); \
  if (FUN_004251c0(&e)) \
    return false; \
  return true; \
}

P4_COMMAND(FUN_00425260, "edit")
P4_COMMAND(FUN_004253d0, "add")
P4_COMMAND(FUN_00425500, "submit")
