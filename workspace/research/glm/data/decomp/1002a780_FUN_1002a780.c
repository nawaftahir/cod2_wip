// 1002a780 size=223 FUN_1002a780

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002a780(void)

{
  int in_EAX;
  undefined4 uVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  undefined4 *puVar4;
  
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    iVar2 = 1;
    DAT_10696cd0 = 1;
    if (1 < in_EAX) {
      do {
        iVar2 = iVar2 * 2;
        DAT_10696cd0 = iVar2;
      } while (iVar2 * iVar2 < in_EAX);
    }
    DAT_10696cd4 = DAT_10696cd0;
    if (in_EAX * 2 <= DAT_10696cd0 * DAT_10696cd0) {
      DAT_10696cd4 = DAT_10696cd0 + 1 >> 1;
    }
    uVar3 = DAT_10696cd4 * DAT_10696cd0;
    _DAT_10696cd8 = 1.0 / (float)(DAT_10696cd0 * 2);
    _DAT_10696cdc = 1.0 / (float)(DAT_10696cd4 * 2);
    DAT_10696ce0 = (undefined4 *)(*(code *)RI_Hunk_AllocateTempMemoryInternal)(uVar3 * 0x20);
    puVar4 = DAT_10696ce0;
    for (iVar2 = (uVar3 & 0x7ffffff) << 3; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar4 = 0x80808080;
      puVar4 = puVar4 + 1;
    }
    for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined1 *)puVar4 = 0x80;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
    }
    return;
  }
  uVar1 = (*(code *)RI_Hunk_AllocInternal)(in_EAX * 0x60);
  *(undefined4 *)(in_ECX + 300) = uVar1;
  uVar1 = (*(code *)RI_Hunk_AllocInternal)(in_EAX * 4);
  *(undefined4 *)(in_ECX + 0x130) = uVar1;
  return;
}


