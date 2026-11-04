// 1009b5b3 size=179 FUN_1009b5b3

undefined4 FUN_1009b5b3(int param_1,int param_2)

{
  uint *in_ECX;
  uint uVar1;
  
  uVar1 = *(uint *)(param_1 + 0x10);
  if ((uVar1 & 0x200) != 0) {
    FUN_1009991f(param_2,1);
  }
  if (((param_2 == 0) || (*(int *)(param_2 + 4) != 9)) || (*(int *)(param_2 + 0x10) != 2)) {
    if ((uVar1 & 0xc00) != 0) {
      FUN_100994dd();
      return 0x80004005;
    }
  }
  else {
    if ((uVar1 & 0xc00) == 0) {
      uVar1 = uVar1 | *(uint *)(in_ECX[1] + 0x38);
    }
    if ((uVar1 & 0xc00) == 0) {
      if ((*in_ECX & 8) == 0) {
        if ((*in_ECX & 0x10) != 0) {
          uVar1 = uVar1 | 0x800;
        }
      }
      else {
        uVar1 = uVar1 | 0x400;
      }
    }
    if ((uVar1 & 0x400) != 0) {
      *(uint *)(param_2 + 0x20) = *(uint *)(param_2 + 0x20) & 0xfffff7ff | 0x400;
    }
    if ((uVar1 & 0x800) != 0) {
      *(uint *)(param_2 + 0x20) = *(uint *)(param_2 + 0x20) & 0xfffffbff | 0x800;
    }
  }
  return 0;
}


