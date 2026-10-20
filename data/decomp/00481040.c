
undefined * FUN_00481040(void)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  char *unaff_EBX;
  undefined4 *puVar6;
  
  uVar5 = DAT_0124a39c ^ 1;
  pcVar2 = unaff_EBX;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0124a39c = uVar5;
  if ((uint)((int)pcVar2 - (int)(unaff_EBX + 1)) < 10) {
    (&DAT_0124a980)[uVar5 * 0x40] = 0;
    return &DAT_0124a980 + uVar5 * 0x40;
  }
  puVar6 = (undefined4 *)(&DAT_0124a980 + uVar5 * 0x40);
  for (iVar4 = 0x10; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  iVar4 = 10;
  do {
    if (unaff_EBX[iVar4] == '\0') break;
    iVar3 = _isalpha((int)unaff_EBX[iVar4]);
    uVar5 = DAT_0124a39c;
    if (iVar3 == 0) break;
    *(char *)(DAT_0124a39c * 0x40 + 0x124a976 + iVar4) = unaff_EBX[iVar4];
    iVar4 = iVar4 + 1;
  } while (iVar4 < 0x40);
  return &DAT_0124a980 + uVar5 * 0x40;
}

