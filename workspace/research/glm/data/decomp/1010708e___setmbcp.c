// 1010708e size=327 __setmbcp

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    __setmbcp
   
   Library: Visual Studio 2003 Release */

int __cdecl __setmbcp(int _CodePage)

{
  int *_Memory;
  int iVar1;
  int local_24;
  
  local_24 = -1;
  __lock(0xd);
  DAT_101ae1d8 = 0;
  if (_CodePage == -2) {
    DAT_101ae1d8 = 1;
    _CodePage = GetOEMCP();
  }
  else if (_CodePage == -3) {
    DAT_101ae1d8 = 1;
    _CodePage = GetACP();
  }
  else if (_CodePage == -4) {
    DAT_101ae1d8 = 1;
    _CodePage = DAT_101ae1a8;
  }
  if (_CodePage == DAT_1076ab44) {
    local_24 = 0;
  }
  else {
    if ((DAT_1076aa34 == (int *)0x0) || (_Memory = DAT_1076aa34, *DAT_1076aa34 != 0)) {
      _Memory = _malloc(0x220);
    }
    if ((_Memory != (int *)0x0) && (local_24 = __setmbcp_lk(_CodePage), local_24 == 0)) {
      *_Memory = 0;
      _Memory[1] = DAT_1076ab44;
      _Memory[2] = DAT_1076aa38;
      _Memory[3] = DAT_1076aa30;
      for (iVar1 = 0; iVar1 < 5; iVar1 = iVar1 + 1) {
        *(undefined2 *)((int)_Memory + iVar1 * 2 + 0x10) = (&DAT_1076ab50)[iVar1];
      }
      for (iVar1 = 0; iVar1 < 0x101; iVar1 = iVar1 + 1) {
        *(undefined1 *)(iVar1 + 0x1c + (int)_Memory) = (&DAT_1076aa40)[iVar1];
      }
      for (iVar1 = 0; DAT_1076aa34 = _Memory, iVar1 < 0x100; iVar1 = iVar1 + 1) {
        *(undefined1 *)(iVar1 + 0x11d + (int)_Memory) = (&DAT_1076ab60)[iVar1];
      }
    }
    if ((local_24 == -1) && (_Memory != DAT_1076aa34)) {
      _free(_Memory);
    }
  }
  FUN_101071d5();
  return local_24;
}


