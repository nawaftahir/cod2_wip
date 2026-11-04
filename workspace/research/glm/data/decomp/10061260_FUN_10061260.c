// 10061260 size=464 FUN_10061260

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10061260(char *param_1,int param_2)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  uint uVar4;
  char *in_ECX;
  int iVar5;
  uint uVar6;
  int iVar7;
  char local_4000 [8192];
  char local_2000 [8188];
  undefined4 uStack_4;
  
  uStack_4 = 0x1006126a;
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  if (0x1fff < (uint)((int)pcVar2 - (int)(param_1 + 1))) {
    FUN_10061c80(&DAT_1019bb50);
    return;
  }
  iVar7 = 0;
  iVar5 = 0;
  do {
    cVar1 = *(char *)(iVar5 + param_2);
    if (cVar1 == '\0') break;
    if (((cVar1 != '\\') && (cVar1 != ';')) && (cVar1 != '\"')) {
      local_4000[iVar7] = cVar1;
      iVar7 = iVar7 + 1;
    }
    iVar5 = iVar5 + 1;
  } while (iVar5 < 0x1fff);
  local_4000[iVar7] = '\0';
  pcVar2 = _strchr(in_ECX,0x5c);
  if (pcVar2 != (char *)0x0) {
    FUN_10061c80(&DAT_1019bb20);
    return;
  }
  pcVar2 = _strchr(in_ECX,0x3b);
  if (pcVar2 != (char *)0x0) {
    FUN_10061c80(&DAT_1019bae8);
    return;
  }
  pcVar2 = _strchr(in_ECX,0x22);
  if (pcVar2 != (char *)0x0) {
    FUN_10061c80(&DAT_1019bab8);
    return;
  }
  FUN_10060f60();
  if (local_4000[0] != '\0') {
    iVar5 = FUN_10060c10("\\%s\\%s");
    if (iVar5 < 1) {
      FUN_10061c80(&DAT_1019ba68);
      return;
    }
    pcVar2 = local_2000;
    do {
      cVar1 = *pcVar2;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    pcVar3 = param_1;
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    if ((char *)0x400 < pcVar2 + (int)(pcVar3 + (-(int)(param_1 + 1) - (int)(local_2000 + 1)))) {
      FUN_10061c80(&DAT_1019ba20);
      return;
    }
    pcVar2 = local_2000;
    do {
      cVar1 = *pcVar2;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    uVar4 = (int)pcVar2 - (int)local_2000;
    param_1 = param_1 + -1;
    do {
      pcVar2 = param_1 + 1;
      param_1 = param_1 + 1;
    } while (*pcVar2 != '\0');
    pcVar2 = local_2000;
    for (uVar6 = uVar4 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
      *(undefined4 *)param_1 = *(undefined4 *)pcVar2;
      pcVar2 = pcVar2 + 4;
      param_1 = param_1 + 4;
    }
    for (uVar4 = uVar4 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
      *param_1 = *pcVar2;
      pcVar2 = pcVar2 + 1;
      param_1 = param_1 + 1;
    }
  }
  return;
}


