
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __thiscall FUN_00408510(char *param_1,char *param_2)

{
  char cVar1;
  uint uVar2;
  char *pcVar3;
  uint uVar4;
  int iVar5;
  char local_88 [128];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (*param_1 != '/') {
    pcVar3 = param_1;
    do {
      cVar1 = *pcVar3;
      pcVar3[(int)(local_88 + -(int)param_1)] = cVar1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    iVar5 = (int)param_1 - (int)param_2;
    do {
      cVar1 = *param_2;
      param_2[iVar5] = cVar1;
      param_2 = param_2 + 1;
    } while (cVar1 != '\0');
    pcVar3 = local_88;
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    uVar2 = (int)pcVar3 - (int)local_88;
    param_1 = param_1 + -1;
    do {
      pcVar3 = param_1 + 1;
      param_1 = param_1 + 1;
    } while (*pcVar3 != '\0');
    pcVar3 = local_88;
    for (uVar4 = uVar2 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
      *(undefined4 *)param_1 = *(undefined4 *)pcVar3;
      pcVar3 = pcVar3 + 4;
      param_1 = param_1 + 4;
    }
    for (uVar2 = uVar2 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
      *param_1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
      param_1 = param_1 + 1;
    }
  }
  return;
}

