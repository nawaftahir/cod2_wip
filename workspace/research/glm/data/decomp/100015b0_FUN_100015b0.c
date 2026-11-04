// 100015b0 size=217 FUN_100015b0

void FUN_100015b0(void)

{
  uint uVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  
  DAT_101d7e94 = (*(code *)RI_Hunk_AllocInternal)(*(int *)(DAT_101d1b9c + 0xf4) << 3);
  DAT_101d7e98 = (*(code *)RI_Hunk_AllocInternal)(*(int *)(DAT_101d1b9c + 0x10) << 2);
  DAT_101d7e9c = (*(code *)RI_Hunk_AllocInternal)(*(int *)(DAT_101d1b9c + 0xec) << 2);
  iVar4 = 0;
  if (0 < *(int *)(DAT_101d1b9c + 0xf4)) {
    do {
      iVar3 = DAT_101d7e94 + iVar4 * 8;
      uVar1 = FUN_100296a0();
      puVar2 = (undefined4 *)(*(code *)RI_Hunk_AllocAlignInternal)(uVar1 << 4,4);
      *(undefined4 **)(iVar3 + 4) = puVar2;
      for (iVar3 = (uVar1 & 0xfffffff) << 2; iVar3 != 0; iVar3 = iVar3 + -1) {
        *puVar2 = 0;
        puVar2 = puVar2 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(undefined1 *)puVar2 = 0;
        puVar2 = (undefined4 *)((int)puVar2 + 1);
      }
      iVar4 = iVar4 + 1;
    } while (iVar4 < *(int *)(DAT_101d1b9c + 0xf4));
  }
  return;
}


