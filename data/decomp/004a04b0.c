
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __thiscall FUN_004a04b0(int param_1,char *param_2,char *param_3)

{
  int iVar1;
  char acStack_10008 [65540];
  
  iVar1 = _vsprintf(acStack_10008,param_3,&stack0x0000000c);
  if ((param_1 <= iVar1) && (DAT_0124a629 == '\0')) {
    iVar1 = FUN_0047d980("len < size","\\trees\\cod2src\\src\\universal\\splines\\util_str.cpp",
                         0x1a4,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a629 = '\x01';
    }
  }
  _strncpy(param_2,acStack_10008,param_1 - 1);
  return;
}

