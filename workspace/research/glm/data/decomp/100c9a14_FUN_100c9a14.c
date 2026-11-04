// 100c9a14 size=107 FUN_100c9a14

int FUN_100c9a14(uint param_1,uint param_2,int param_3)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int in_ECX;
  
  iVar2 = FUN_100c99b7(param_1 | param_2);
  if (-1 < iVar2) {
    if (((param_1 | param_2) & 0x2000) != 0) {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_3 * 4);
      iVar1 = *(int *)(iVar2 + 0x10);
      uVar3 = *(uint *)(iVar2 + 0xc) & 0x7ff;
      uVar4 = uVar3 | 0xb0000000;
      if (iVar1 != 0) {
        if (iVar1 == 1) {
          uVar4 = uVar3 | 0xb0550000;
        }
        else if (iVar1 == 2) {
          uVar4 = uVar3 | 0xb0aa0000;
        }
        else if (iVar1 == 3) {
          uVar4 = uVar3 | 0xb0ff0000;
        }
      }
      FUN_100c99b7(uVar4);
    }
    iVar2 = 0;
  }
  return iVar2;
}


