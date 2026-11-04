// 10009820 size=156 FUN_10009820

undefined1 * FUN_10009820(void)

{
  undefined4 *puVar1;
  undefined1 *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  bool bVar7;
  
  puVar2 = (undefined1 *)*DAT_101ce5e4;
  *puVar2 = 0;
  DAT_101ce5e0 = DAT_101ce5e0 + -1;
  iVar4 = 1;
  iVar6 = 0;
  if (0 < DAT_101ce5e0) {
    bVar7 = SBORROW4(1,DAT_101ce5e0);
    iVar3 = 1 - DAT_101ce5e0;
    do {
      iVar5 = iVar4;
      if ((bVar7 != iVar3 < 0) &&
         ((float)DAT_101ce5e4[iVar4 * 2 + 3] < (float)DAT_101ce5e4[iVar4 * 2 + 1])) {
        iVar5 = iVar4 + 1;
      }
      puVar1 = DAT_101ce5e4 + iVar5 * 2;
      if ((float)DAT_101ce5e4[DAT_101ce5e0 * 2 + 1] < (float)puVar1[1] !=
          ((float)DAT_101ce5e4[DAT_101ce5e0 * 2 + 1] == (float)puVar1[1])) break;
      DAT_101ce5e4[iVar6 * 2] = *puVar1;
      DAT_101ce5e4[iVar6 * 2 + 1] = puVar1[1];
      iVar4 = iVar5 * 2 + 1;
      bVar7 = SBORROW4(iVar4,DAT_101ce5e0);
      iVar3 = iVar4 - DAT_101ce5e0;
      iVar6 = iVar5;
    } while (iVar4 <= DAT_101ce5e0);
  }
  puVar1 = DAT_101ce5e4;
  DAT_101ce5e4[iVar6 * 2] = DAT_101ce5e4[DAT_101ce5e0 * 2];
  DAT_101ce5e4[iVar6 * 2 + 1] = puVar1[DAT_101ce5e0 * 2 + 1];
  return puVar2;
}


