
void FUN_004a50e0(int param_1,int *param_2)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  int local_8;
  
  local_8 = 0;
  if (*(char *)(param_1 + 0x18) != '\0') {
    puVar4 = (undefined4 *)(param_1 + 0x1c);
    do {
      puVar1 = (undefined4 *)*puVar4;
      iVar3 = (int)*(short *)*puVar1;
      if (0 < iVar3) {
        iVar2 = 0;
        do {
          *param_2 = puVar1[0x18] + iVar2;
          iVar2 = iVar2 + 0x28;
          param_2 = param_2 + 1;
          iVar3 = iVar3 + -1;
        } while (iVar3 != 0);
      }
      local_8 = local_8 + 1;
      puVar4 = puVar4 + 1;
    } while (local_8 < (int)(uint)*(byte *)(param_1 + 0x18));
  }
  return;
}

