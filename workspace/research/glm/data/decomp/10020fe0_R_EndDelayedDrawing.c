// 10020fe0 size=91 R_EndDelayedDrawing

void R_EndDelayedDrawing(int param_1)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 8) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    iRam00000004 = iVar3 + 8 + param_1;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 8;
  *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
  *(undefined2 **)(iVar3 + 0x30008) = puVar1;
  *puVar1 = 2;
  puVar1[1] = 8;
  *(int *)(puVar1 + 2) = iVar3 + 8 + param_1;
  return;
}


