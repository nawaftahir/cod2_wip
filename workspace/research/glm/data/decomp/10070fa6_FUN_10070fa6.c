// 10070fa6 size=212 FUN_10070fa6

undefined4
FUN_10070fa6(int param_1,undefined4 param_2,uint param_3,undefined4 param_4,undefined4 param_5,
            undefined4 param_6,undefined4 param_7)

{
  uint uVar1;
  undefined4 uVar2;
  uint uVar3;
  int in_ECX;
  int iVar4;
  undefined4 local_8;
  
  if (param_1 == 0) {
    uVar2 = 0;
  }
  else {
    local_8 = 0;
    if (param_3 < *(uint *)(*(int *)(in_ECX + 8) + 4)) {
      iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + param_3 * 4);
    }
    else {
      iVar4 = 0;
    }
    if (iVar4 == 0) {
      uVar2 = 0x80004005;
    }
    else {
      uVar3 = FUN_100861f0(iVar4);
      if (uVar3 < *(uint *)(*(int *)(in_ECX + 8) + 4)) {
        iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + uVar3 * 4);
      }
      else {
        iVar4 = 0;
      }
      if (iVar4 == 0) {
        uVar2 = 0x8007000e;
      }
      else {
        *(uint *)(iVar4 + 4) = *(uint *)(iVar4 + 4) | 0x40;
        uVar1 = *(uint *)(iVar4 + 4);
        if (((uVar1 & 0x10) != 0) && (-1 < (char)uVar1)) {
          if (((uVar1 & 0x200) != 0) && ((*(uint *)(*(int *)(in_ECX + 8) + 0x70) & 0x200) != 0)) {
            *(uint *)(iVar4 + 4) = uVar1 | 0x400;
          }
          if (((*(uint *)(iVar4 + 4) & 0x200) == 0) &&
             ((*(uint *)(*(int *)(in_ECX + 8) + 0x70) & 0x400) != 0)) {
            *(uint *)(iVar4 + 4) = *(uint *)(iVar4 + 4) | 0x100400;
          }
        }
        uVar2 = FUN_1006eb85(param_1,param_2,uVar3,param_4,param_5,param_6,&local_8,param_6,param_7,
                             0);
      }
    }
  }
  return uVar2;
}


