// 1006dd5c size=87 FUN_1006dd5c

uint FUN_1006dd5c(uint param_1,uint param_2,int param_3)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  
  iVar1 = *(int *)(*(int *)(param_3 + 8) + 0x14);
  iVar2 = *(int *)(iVar1 + *(int *)(*(int *)(param_3 + 0x18) + param_1 * 4) * 4);
  iVar1 = *(int *)(iVar1 + *(int *)(*(int *)(param_3 + 0x18) + param_2 * 4) * 4);
  uVar3 = *(uint *)(iVar2 + 0x6c);
  uVar4 = *(uint *)(iVar1 + 0x6c);
  if (uVar4 <= uVar3) {
    if (uVar4 < uVar3) {
      return 1;
    }
    uVar3 = *(uint *)(iVar2 + 0x10);
    uVar4 = *(uint *)(iVar1 + 0x10);
    if (uVar4 <= uVar3) {
      if (uVar3 != uVar4) {
        return 1;
      }
      if (param_2 <= param_1) {
        return (uint)(param_2 < param_1);
      }
    }
  }
  return 0xffffffff;
}


