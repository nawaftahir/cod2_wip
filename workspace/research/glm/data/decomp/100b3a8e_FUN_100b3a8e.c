// 100b3a8e size=183 FUN_100b3a8e

int FUN_100b3a8e(int param_1)

{
  int iVar1;
  int *in_ECX;
  undefined4 uVar2;
  
  if (in_ECX[0x56] == 0) {
    iVar1 = FUN_100c98b1(0x200001f);
    if (-1 < iVar1) {
      iVar1 = *(int *)(param_1 + 0x3c);
      if (iVar1 == 0x200000) {
        uVar2 = 0x90000000;
      }
      else if (iVar1 == 0x400000) {
        uVar2 = 0xa0000000;
      }
      else {
        if (iVar1 != 0x800000) {
          FUN_1008b0b5();
          return -0x7fffbffb;
        }
        uVar2 = 0x98000000;
      }
      iVar1 = FUN_100c7b3a(uVar2);
      if (((-1 < iVar1) &&
          (iVar1 = (**(code **)(*in_ECX + 100))
                             (*(uint *)(param_1 + 0xc) & 0x7ff | 0xa0000800,0xf0000,0), -1 < iVar1))
         && (iVar1 = FUN_100c4cc4(), -1 < iVar1)) {
        iVar1 = 0;
      }
    }
  }
  else {
    iVar1 = 0;
  }
  return iVar1;
}


