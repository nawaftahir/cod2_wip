
uint * __thiscall FUN_004becd0(uint *param_1,int *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  uint uVar3;
  
  if (param_1[2] == 0) {
    puVar2 = (undefined4 *)FUN_004ff450(0x114);
    if (puVar2 == (undefined4 *)0x0) {
      puVar2 = (undefined4 *)0x0;
    }
    else {
      *puVar2 = &PTR_FUN_00529cc0;
      puVar2[0x15] = 0;
      puVar2[0x14] = 0;
      puVar2[0x13] = &DAT_00598c80;
      puVar2[0x18] = 0;
      puVar2[0x17] = 0;
      puVar2[0x16] = &DAT_00598c80;
    }
    param_1[2] = (uint)puVar2;
  }
  if (*param_1 == 0) {
    uVar3 = param_1[2];
    *(undefined4 *)(uVar3 + 0x50) = 0;
    *(uint *)(uVar3 + 4) = uVar3;
    *(undefined4 *)(uVar3 + 8) = 0;
    *(undefined4 *)(uVar3 + 0x70) = 0;
    *(undefined4 *)(uVar3 + 100) = 0;
  }
  uVar3 = *param_2 >> 0x1c & 0xf;
  if ((int)*param_1 <= (int)uVar3) {
    *param_1 = uVar3;
    param_1[1] = (uint)*(byte *)((int)param_2 + 2);
  }
  uVar3 = param_1[2];
  if (*(int *)(uVar3 + 8) == 8) {
    *(undefined4 *)(uVar3 + 8) = 7;
  }
  iVar1 = *(int *)(uVar3 + 8);
  *(int *)(uVar3 + 0xc + iVar1 * 8) = *param_2;
  *(int *)(uVar3 + 0x10 + iVar1 * 8) = param_2[1];
  *(int *)(uVar3 + 8) = *(int *)(uVar3 + 8) + 1;
  *(int *)(uVar3 + 100) = param_2[1];
  return param_1;
}

