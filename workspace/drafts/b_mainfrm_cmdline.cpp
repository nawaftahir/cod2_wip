/* Lane B r25 drafts for MainFrm.cpp 0x412060/0x4120e0 (see ledger/defer.tsv). */
// 0x00412060: runs a "+Command" argument; returns how many arguments it used
int FUN_00412060(char **arg)
{
  if (**arg == '+')
  {
    const char *name = *arg + 1;
    for (int i = 0; i < g_nCommandCount; i++)
    {
      if (!_stricmp(g_Commands[i].m_strCommand, name))
      {
        AfxGetMainWnd()->PostMessage(WM_COMMAND, g_Commands[i].m_nCommand, 0);
        return 1;
      }
    }
  }
  return 0;
}

void Map_LoadFile(const char *filename);
int ParseCommandLine(char *cmdLine, char **argv, int maxArgs);
const char *Com_GetExtensionSubString(const char *filename);

void FUN_004120e0(const char *cmdLine)
{
  char *argv[128];
  char buf[0x10000];

  strncpy(buf, cmdLine, sizeof(buf));
  buf[sizeof(buf) - 1] = 0;
  int argc = ParseCommandLine(buf, argv, 128);
#line 1093
  assert(argc >= 1);
  int n;
  for (int i = 1; i < argc; i += n)
  {
    n = FUN_00412060(&argv[i]);
    if (!n)
    {
      n = 1;
      if (!_stricmp(Com_GetExtensionSubString(argv[1]), ".map"))
        Map_LoadFile(argv[1]);
    }
  }
}

