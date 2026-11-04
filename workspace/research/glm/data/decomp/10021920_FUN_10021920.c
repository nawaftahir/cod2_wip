// 10021920 size=87 FUN_10021920

void FUN_10021920(void)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  undefined4 unaff_ESI;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 8) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    uRam00000004 = unaff_ESI;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 8;
  *(undefined2 **)(iVar3 + 0x30008) = puVar1;
  *puVar1 = 0x18;
  puVar1[1] = 8;
  *(undefined4 *)(puVar1 + 2) = unaff_ESI;
  return;
}


