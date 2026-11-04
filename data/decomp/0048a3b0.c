
void FUN_0048a3b0(void)

{
  uint uVar1;
  uint uVar2;
  uint *puVar3;
  uint uVar4;
  int iVar5;
  uint *puVar6;
  
  uVar1 = DAT_01147dd0 + DAT_01233514;
  uVar4 = (DAT_01147dc0 - DAT_01147dc8) + DAT_01233514;
  puVar6 = &DAT_01147dd8;
  iVar5 = 0x400;
  do {
    uVar2 = *puVar6;
    puVar3 = puVar6;
    while (uVar2 != 0) {
      uVar2 = *puVar3;
      if ((uVar2 < uVar1) || (uVar4 <= uVar2)) {
        puVar3 = (uint *)(uVar2 + 4);
      }
      else {
        *puVar3 = *(uint *)(uVar2 + 4);
      }
      uVar2 = *puVar3;
    }
    puVar6 = puVar6 + 1;
    iVar5 = iVar5 + -1;
  } while (iVar5 != 0);
  puVar6 = &DAT_01147dc4;
  uVar2 = DAT_01147dc4;
  while (uVar2 != 0) {
    uVar2 = *puVar6;
    if ((uVar2 < uVar1) || (uVar4 <= uVar2)) {
      puVar6 = (uint *)(uVar2 + 4);
    }
    else {
      *puVar6 = *(uint *)(uVar2 + 4);
    }
    uVar2 = *puVar6;
  }
  return;
}

