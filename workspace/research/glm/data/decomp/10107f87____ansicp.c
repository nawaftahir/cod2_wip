// 10107f87 size=67 ___ansicp

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    ___ansicp
   
   Library: Visual Studio 2003 Release */

long ___ansicp(LCID param_1)

{
  int iVar1;
  long lVar2;
  CHAR local_10 [6];
  undefined1 local_a;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  local_a = 0;
  iVar1 = GetLocaleInfoA(param_1,0x1004,local_10,6);
  if (iVar1 == 0) {
    lVar2 = -1;
  }
  else {
    lVar2 = _atol(local_10);
  }
  return lVar2;
}


