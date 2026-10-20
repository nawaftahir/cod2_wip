
void FUN_00475350(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  
  DAT_010c2d7c = 0;
  DAT_010c4d80 = 0;
  puVar3 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      iVar4 = 0;
      if (0 < (int)puVar3[6]) {
        iVar2 = 0;
        do {
          FUN_004752c0(*(int *)(puVar3[5] + 0x3c) + iVar2);
          iVar4 = iVar4 + 1;
          iVar2 = iVar2 + 0xa8;
        } while (iVar4 < (int)puVar3[6]);
      }
      puVar1 = puVar3 + 1;
      puVar3 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  return;
}

