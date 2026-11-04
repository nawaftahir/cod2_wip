
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_0046d0f0(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int local_40c;
  char local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar1 = FUN_00480440(DAT_01233508,param_1,0,&local_40c,10);
  FUN_0047a5b0("Scanning AI types folder: %s/*%s\n");
  iVar2 = 0;
  if (0 < local_40c) {
    do {
      _sprintf(local_408,"%s\\%s");
      FUN_00463ea0(local_408,1);
      iVar2 = iVar2 + 1;
    } while (iVar2 < local_40c);
  }
  if (iVar1 != 0) {
    FUN_00480d00(iVar1,10);
  }
  return;
}

