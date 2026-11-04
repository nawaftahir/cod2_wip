// 100c4a15 size=118 FUN_100c4a15

undefined4 FUN_100c4a15(int param_1,uint *param_2)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int in_ECX;
  
  uVar3 = 0;
  if (*(int *)(param_1 + 0x14) != -1) {
    iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(param_1 + 0x14) * 4);
    if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 4) & 8) != 0) {
      iVar2 = *(int *)(iVar1 + 0x10);
      uVar4 = *(uint *)(iVar1 + 0xc) & 0x7ff;
      uVar3 = uVar4 | 0xb0001000;
      if (iVar2 != 0) {
        if (iVar2 == 1) {
          uVar3 = uVar4 | 0xb0551000;
        }
        else if (iVar2 == 2) {
          uVar3 = uVar4 | 0xb0aa1000;
        }
        else if (iVar2 == 3) {
          uVar3 = uVar4 | 0xb0ff1000;
        }
      }
      if (*(int *)(param_1 + 0x18) == 0) {
        uVar3 = uVar3 | 0xd000000;
      }
    }
  }
  if (param_2 != (uint *)0x0) {
    *param_2 = uVar3;
  }
  return 0;
}


