// 100fb114 size=113 __getptd

/* Library Function - Single Match
    __getptd
   
   Library: Visual Studio 2003 Release */

_ptiddata __cdecl __getptd(void)

{
  DWORD dwErrCode;
  _ptiddata p_Var1;
  int iVar2;
  DWORD DVar3;
  
  dwErrCode = GetLastError();
  p_Var1 = (_ptiddata)(*DAT_101addbc)(DAT_101a4898);
  if (p_Var1 == (_ptiddata)0x0) {
    p_Var1 = _calloc(1,0x8c);
    if (p_Var1 != (_ptiddata)0x0) {
      iVar2 = (*DAT_101addc0)(DAT_101a4898,p_Var1);
      if (iVar2 != 0) {
        p_Var1->_initaddr = &DAT_101a4e88;
        p_Var1->_holdrand = 1;
        DVar3 = GetCurrentThreadId();
        p_Var1->_thandle = 0xffffffff;
        p_Var1->_tid = DVar3;
        goto LAB_100fb179;
      }
    }
    __amsg_exit(0x10);
  }
LAB_100fb179:
  SetLastError(dwErrCode);
  return p_Var1;
}


