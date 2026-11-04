// 10020f10 size=92 R_RenderScene

void R_RenderScene(void)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 8) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    uRam00000004 = 0;
    return;
  }
  *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 8;
  puVar1 = (undefined2 *)(iVar2 + iVar3);
  *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
  *(undefined2 **)(iVar3 + 0x30008) = puVar1;
  *puVar1 = 1;
  puVar1[1] = 8;
  *(undefined4 *)(puVar1 + 2) = 0;
  return;
}


