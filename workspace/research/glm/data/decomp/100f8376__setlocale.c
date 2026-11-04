// 100f8376 size=337 _setlocale

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    _setlocale
   
   Library: Visual Studio 2003 Release */

char * __cdecl _setlocale(int _Category,char *_Locale)

{
  undefined4 *_Memory;
  int iVar1;
  char *local_20;
  undefined1 local_14 [8];
  undefined4 uStack_c;
  undefined *local_8;
  
  local_8 = &DAT_1017c690;
  uStack_c = 0x100f8382;
  if ((_Category < 0) || (5 < _Category)) {
    local_20 = (char *)0x0;
  }
  else {
    __lock(0xc);
    local_8 = (undefined *)0x0;
    if (_Locale == (char *)0x0) {
      local_20 = (char *)__setlocale_lk();
      __local_unwind2(local_14,0xffffffff);
    }
    else {
      _Memory = _malloc(0x54);
      if (_Memory == (undefined4 *)0x0) {
        local_20 = (char *)0x0;
      }
      else {
        local_20 = (char *)__setlocale_lk();
        if (local_20 != (char *)0x0) {
          *_Memory = 0;
          _Memory[1] = DAT_101ae1a8;
          _Memory[2] = DAT_101ae1ac;
          for (iVar1 = 0; iVar1 < 6; iVar1 = iVar1 + 1) {
            _Memory[iVar1 + 3] = (&DAT_101ae190)[iVar1];
          }
          _Memory[9] = DAT_101a50d4;
          _Memory[10] = DAT_101a50e0;
          _Memory[0xb] = DAT_1076ac8c;
          _Memory[0xc] = DAT_1076ac90;
          _Memory[0xd] = DAT_1076ac88;
          _Memory[0xe] = PTR_PTR_101a50cc;
          _Memory[0xf] = DAT_101ae168;
          _Memory[0x10] = DAT_1076ac84;
          _Memory[0x11] = DAT_1076ac80;
          _Memory[0x12] = PTR_DAT_101a5090;
          _Memory[0x13] = PTR_PTR_101a4fd0;
          _Memory[0x14] = DAT_101ae164;
          if ((*(int *)PTR_DAT_101a4684 == 0) && ((undefined4 *)PTR_DAT_101a4684 != &DAT_101a4630))
          {
            ___freetlocinfo(PTR_DAT_101a4684);
          }
          PTR_DAT_101a4684 = (undefined *)_Memory;
          ___updatetlocinfo_lk();
        }
      }
      if ((local_20 == (char *)0x0) && (_Memory != (undefined4 *)0x0)) {
        _free(_Memory);
      }
      local_8 = (undefined *)0xffffffff;
      FUN_100f84bf();
    }
  }
  return local_20;
}


