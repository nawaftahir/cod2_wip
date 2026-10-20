
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_0047d1b0(char *param_1)

{
  char cVar1;
  char *pcVar2;
  uint uVar3;
  HMODULE pHVar4;
  uint uVar5;
  char local_10c [4];
  undefined1 local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  uVar3 = (int)pcVar2 - (int)(param_1 + 1);
  uVar5 = uVar3;
  do {
    uVar5 = uVar5 - 1;
    if ((int)uVar5 < 0) goto LAB_0047d203;
    cVar1 = param_1[uVar5];
  } while (((cVar1 != '.') && (cVar1 != '/')) && (cVar1 != '\\'));
  if ((-1 < (int)uVar5) && (param_1[uVar5] == '.')) {
    uVar3 = uVar5;
  }
LAB_0047d203:
  pcVar2 = local_10c;
  for (uVar5 = uVar3 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(undefined4 *)pcVar2 = *(undefined4 *)param_1;
    param_1 = param_1 + 4;
    pcVar2 = pcVar2 + 4;
  }
  for (uVar5 = uVar3 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
    *pcVar2 = *param_1;
    param_1 = param_1 + 1;
    pcVar2 = pcVar2 + 1;
  }
  *(undefined4 *)(local_108 + (uVar3 - 4)) = DAT_00550b5c;
  local_108[uVar3] = DAT_00550b60;
  pHVar4 = GetModuleHandleA(local_10c);
  if (pHVar4 == (HMODULE)0x0) {
    *(undefined4 *)(local_108 + (uVar3 - 4)) = DAT_00550b54;
    local_108[uVar3] = DAT_00550b58;
    GetModuleHandleA(local_10c);
  }
  return;
}

