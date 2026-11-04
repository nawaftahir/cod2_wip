// 10060d10 size=241 FUN_10060d10

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

char * FUN_10060d10(int param_1)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  int iVar4;
  char *in_ECX;
  uint uVar5;
  char local_2000 [8188];
  undefined4 uStack_4;
  
  uStack_4 = 0x10060d1a;
  if ((in_ECX == (char *)0x0) || (param_1 == 0)) {
    return "";
  }
  pcVar3 = in_ECX;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  if (0x1fff < (uint)((int)pcVar3 - (int)(in_ECX + 1))) {
    FUN_10061cd0(1,&DAT_1019bbd0);
  }
  uVar5 = DAT_1076a838 ^ 1;
  DAT_1076a838 = uVar5;
  if (*in_ECX == '\\') {
    in_ECX = in_ECX + 1;
  }
  while( true ) {
    pcVar3 = local_2000;
    cVar2 = *in_ECX;
    while (cVar2 != '\\') {
      if (cVar2 == '\0') goto LAB_10060dd6;
      *pcVar3 = cVar2;
      pcVar1 = in_ECX + 1;
      pcVar3 = pcVar3 + 1;
      in_ECX = in_ECX + 1;
      cVar2 = *pcVar1;
    }
    cVar2 = in_ECX[1];
    *pcVar3 = '\0';
    pcVar3 = &DAT_10766808 + uVar5 * 0x2000;
    while ((cVar2 != '\\' && (cVar2 != '\0'))) {
      *pcVar3 = cVar2;
      pcVar3 = pcVar3 + 1;
      cVar2 = in_ECX[2];
      in_ECX = in_ECX + 1;
    }
    *pcVar3 = '\0';
    iVar4 = FUN_10060950();
    if (iVar4 == 0) {
      return &DAT_10766808 + uVar5 * 0x2000;
    }
    if (in_ECX[1] == '\0') break;
    in_ECX = in_ECX + 2;
  }
LAB_10060dd6:
  return "";
}


