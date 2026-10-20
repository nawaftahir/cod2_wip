
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0046bbf0(int param_1,char *param_2)

{
  int iVar1;
  char local_4008 [16384];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar1 = __vsnprintf(local_4008,0x4000,param_2,&stack0x0000000c);
  if (0 < iVar1) {
    (**(code **)(**(int **)(param_1 + 4) + 0x38))(local_4008,iVar1);
  }
  return;
}

