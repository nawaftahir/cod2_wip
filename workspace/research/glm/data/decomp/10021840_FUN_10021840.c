// 10021840 size=79 FUN_10021840

void FUN_10021840(void)

{
  int *piVar1;
  undefined2 *puVar2;
  int iVar3;
  int iVar4;
  undefined4 unaff_ESI;
  
  iVar4 = DAT_1042e778;
  iVar3 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar3 < 8) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    uRam00000004 = unaff_ESI;
    return;
  }
  puVar2 = (undefined2 *)(iVar3 + DAT_1042e778);
  *(int *)(DAT_1042e778 + 0x30000) = iVar3 + 8;
  piVar1 = (int *)(iVar4 + 0x30004);
  *piVar1 = *piVar1 + 8;
  *(undefined2 **)(iVar4 + 0x30008) = puVar2;
  *puVar2 = 0xe;
  puVar2[1] = 8;
  *(undefined4 *)(puVar2 + 2) = unaff_ESI;
  return;
}


