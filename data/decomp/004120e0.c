
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_004120e0(char *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  char *_Str1;
  int iVar4;
  char acStack_10008 [65535];
  undefined1 local_9;
  
  _strncpy(acStack_10008,param_1,0x10000);
  local_9 = 0;
  iVar1 = FUN_0046e370();
  if ((iVar1 < 1) && (DAT_0124a120 == '\0')) {
    iVar2 = FUN_0047d980("argc >= 1",".\\MainFrm.cpp",0x445,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a120 = '\x01';
    }
  }
  iVar2 = 1;
  if (1 < iVar1) {
    do {
      iVar3 = FUN_00412060();
      if (iVar3 == 0) {
        iVar3 = 1;
        _Str1 = (char *)FUN_00495d90();
        iVar4 = __stricmp(_Str1,".map");
        if (iVar4 == 0) {
          FUN_004683e0();
        }
      }
      iVar2 = iVar2 + iVar3;
    } while (iVar2 < iVar1);
  }
  return;
}

