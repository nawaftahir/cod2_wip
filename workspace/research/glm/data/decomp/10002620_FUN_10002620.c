// 10002620 size=108 FUN_10002620

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10002620(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  int *unaff_EDI;
  
  iVar3 = *unaff_EDI;
  DAT_101ae3a4 = FUN_10001940();
  puVar1 = (undefined4 *)(*(code *)RI_Hunk_AllocInternal)(*(undefined4 *)(iVar3 + 0x18));
  puVar2 = (undefined4 *)(*(int *)(iVar3 + 0x1c) + unaff_EDI[1]);
  iVar3 = 0;
  _DAT_101ae3a8 = puVar1;
  if (0 < DAT_101ae3a4) {
    do {
      *puVar1 = *puVar2;
      *(undefined1 *)(puVar1 + 1) = *(undefined1 *)(puVar2 + 1);
      *(undefined1 *)((int)puVar1 + 5) = *(undefined1 *)((int)puVar2 + 5);
      *(undefined2 *)((int)puVar1 + 6) = *(undefined2 *)((int)puVar2 + 6);
      iVar3 = iVar3 + 1;
      puVar2 = puVar2 + 2;
      puVar1 = puVar1 + 2;
    } while (iVar3 < DAT_101ae3a4);
  }
  return;
}


