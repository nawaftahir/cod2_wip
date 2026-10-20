
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_0048b200(undefined4 param_1,char *param_2,char *param_3,undefined4 param_4)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  char local_88 [64];
  char local_48 [64];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar4 = 0;
  iVar2 = -(int)param_2;
  do {
    cVar1 = *param_2;
    if (cVar1 == '\0') break;
    if ((cVar1 == '\\') || (cVar1 == ':')) {
      param_2[(int)(local_88 + iVar2)] = '/';
    }
    else {
      param_2[(int)(local_88 + iVar2)] = cVar1;
    }
    iVar4 = iVar4 + 1;
    param_2 = param_2 + 1;
  } while (iVar4 < 0x3f);
  iVar3 = 0;
  local_88[iVar4] = '\0';
  iVar2 = -(int)param_3;
  do {
    cVar1 = *param_3;
    if (cVar1 == '\0') break;
    if ((cVar1 == '\\') || (cVar1 == ':')) {
      param_3[(int)(local_48 + iVar2)] = '/';
    }
    else {
      param_3[(int)(local_48 + iVar2)] = cVar1;
    }
    iVar3 = iVar3 + 1;
    param_3 = param_3 + 1;
  } while (iVar3 < 0x3f);
  local_48[iVar3] = '\0';
  FUN_0048afb0(local_48,param_4);
  return;
}

