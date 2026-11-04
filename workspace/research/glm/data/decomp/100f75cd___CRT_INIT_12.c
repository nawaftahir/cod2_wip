// 100f75cd size=385 __CRT_INIT@12

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Library Function - Single Match
    __CRT_INIT@12
   
   Library: Visual Studio 2003 Release */

undefined4 __CRT_INIT_12(undefined4 param_1,int param_2)

{
  BOOL BVar1;
  int iVar2;
  _ptiddata _Ptd;
  DWORD DVar3;
  DWORD local_9c;
  DWORD local_98;
  DWORD local_94;
  uint local_90;
  DWORD local_8c;
  CHAR aCStack_18 [4];
  pthreadlocinfo _Locale;
  
  if (param_2 == 1) {
    local_9c = 0x94;
    BVar1 = GetVersionExA((LPOSVERSIONINFOA)&local_9c);
    if (BVar1 != 0) {
      DAT_101ae00c = local_8c;
      DAT_101ae018 = local_98;
      _DAT_101ae01c = local_94;
      _DAT_101ae010 = local_90 & 0x7fff;
      if (local_8c != 2) {
        _DAT_101ae010 = _DAT_101ae010 | 0x8000;
      }
      _DAT_101ae014 = local_98 * 0x100 + local_94;
      iVar2 = __heap_init();
      if (iVar2 != 0) {
        iVar2 = __mtinit();
        if (iVar2 != 0) {
          __RTC_Initialize();
          DAT_1076bdcc = GetCommandLineA();
          DAT_101add80 = ___crtGetEnvironmentStringsA();
          iVar2 = __ioinit();
          if (-1 < iVar2) {
            iVar2 = __setargv();
            if (((-1 < iVar2) && (iVar2 = __setenvp(), -1 < iVar2)) &&
               (iVar2 = __cinit(0), iVar2 == 0)) {
              DAT_101add7c = DAT_101add7c + 1;
              return 1;
            }
            __ioterm();
          }
          __mtterm();
        }
        __heap_term();
      }
    }
  }
  else if (param_2 == 0) {
    if (0 < DAT_101add7c) {
      DAT_101add7c = DAT_101add7c + -1;
      if (DAT_101ae048 == 0) {
        __cexit();
      }
      __ioterm();
      __mtterm();
      __heap_term();
      return 1;
    }
  }
  else {
    if (param_2 != 2) {
      if (param_2 != 3) {
        return 1;
      }
      __freeptd((_ptiddata)0x0);
      return 1;
    }
    _Ptd = _calloc(1,0x8c);
    if (_Ptd != (_ptiddata)0x0) {
      _Locale = DAT_101a4898;
      iVar2 = (*DAT_101addc0)();
      if (iVar2 != 0) {
        builtin_memcpy(aCStack_18,"\x1dw\x0f\x10",4);
        __initptd(_Ptd,_Locale);
        DVar3 = GetCurrentThreadId();
        _Ptd->_thandle = 0xffffffff;
        _Ptd->_tid = DVar3;
        return 1;
      }
      builtin_memcpy(aCStack_18,"1w\x0f\x10",4);
      _free(_Ptd);
    }
  }
  return 0;
}


