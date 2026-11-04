// 100a5a4f size=147 FUN_100a5a4f

undefined4 FUN_100a5a4f(uint *param_1,int param_2)

{
  int in_ECX;
  uint uVar1;
  bool bVar2;
  
  uVar1 = *param_1 & 0xfff00000;
  if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                       *(int *)(param_1[2] + (*param_1 & 0xfffff) * param_2 * 4) * 4) + 0x6c) ==
      0x11) {
    if (uVar1 == 0x30000000) {
      if (param_2 != 0) {
        return 0;
      }
      return 1;
    }
    if (uVar1 < 0x73800001) {
      if (uVar1 == 0x73800000) {
        return 1;
      }
      if (uVar1 == 0x10f00000) {
        return 1;
      }
      if (uVar1 == 0x73500000) {
        return 1;
      }
      if (uVar1 == 0x73600000) {
        return 1;
      }
      bVar2 = uVar1 == 0x73700000;
    }
    else {
      if (uVar1 == 0x74400000) {
        return 1;
      }
      if (uVar1 == 0x74500000) {
        return 1;
      }
      if (uVar1 == 0x74600000) {
        return 1;
      }
      bVar2 = uVar1 == 0x74700000;
    }
    if (bVar2) {
      return 1;
    }
  }
  return 0;
}


