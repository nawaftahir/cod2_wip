// 100a5766 size=156 FUN_100a5766

int FUN_100a5766(uint param_1,uint param_2,int param_3)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int in_ECX;
  
  iVar2 = FUN_100c99b7(param_1 | param_2);
  if (-1 < iVar2) {
    if ((((param_1 | param_2) & 0x2000) != 0) && (0x1ff < (*(uint *)(in_ECX + 200) & 0xffff))) {
      if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                             *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_3 * 4) + 4) * 4) + 4)
          & 0x10) == 0) {
        iVar2 = *(int *)(param_3 * 4 + *(int *)(in_ECX + 0x14));
        iVar1 = *(int *)(iVar2 + 0x10);
        uVar4 = *(uint *)(iVar2 + 0xc) & 0x7ff;
        uVar3 = uVar4 | 0xb0000000;
        if (iVar1 != 0) {
          if (iVar1 == 1) {
            uVar3 = uVar4 | 0xb0550000;
          }
          else if (iVar1 == 2) {
            uVar3 = uVar4 | 0xb0aa0000;
          }
          else if (iVar1 == 3) {
            uVar3 = uVar4 | 0xb0ff0000;
          }
        }
      }
      else {
        uVar3 = 0xf0e40800;
      }
      FUN_100c99b7(uVar3);
    }
    iVar2 = 0;
  }
  return iVar2;
}


