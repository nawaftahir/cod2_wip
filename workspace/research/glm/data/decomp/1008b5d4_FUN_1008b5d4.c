// 1008b5d4 size=329 FUN_1008b5d4

int FUN_1008b5d4(int param_1,int param_2,int param_3)

{
  int iVar1;
  int *in_ECX;
  int *piVar2;
  
  iVar1 = FUN_100863a0(param_1);
  if (-1 < iVar1) {
    in_ECX[0x30] = *(int *)(param_1 + 0xc0);
    iVar1 = *(int *)(param_1 + 0xc4);
    in_ECX[0x35] = 0;
    in_ECX[0x36] = 0;
    in_ECX[0x37] = 0;
    in_ECX[0x31] = iVar1;
    in_ECX[0x32] = param_2;
    in_ECX[0x33] = param_3;
    in_ECX[0x1d] = *(int *)(param_1 + 0x74);
    in_ECX[0x1e] = *(int *)(param_1 + 0x78);
    in_ECX[0x1f] = *(int *)(param_1 + 0x7c);
    in_ECX[0x20] = *(int *)(param_1 + 0x80);
    in_ECX[0x21] = *(int *)(param_1 + 0x84);
    in_ECX[0x22] = *(int *)(param_1 + 0x88);
    in_ECX[0x23] = *(int *)(param_1 + 0x8c);
    in_ECX[0x24] = *(int *)(param_1 + 0x90);
    in_ECX[0x25] = *(int *)(param_1 + 0x94);
    in_ECX[0x26] = *(int *)(param_1 + 0x98);
    in_ECX[0x27] = *(int *)(param_1 + 0x9c);
    in_ECX[0x28] = *(int *)(param_1 + 0xa0);
    in_ECX[0x29] = *(int *)(param_1 + 0xa4);
    in_ECX[0x2a] = *(int *)(param_1 + 0xa8);
    in_ECX[0x2b] = *(int *)(param_1 + 0xac);
    in_ECX[0x2c] = *(int *)(param_1 + 0xb0);
    in_ECX[0x2d] = *(int *)(param_1 + 0xb4);
    in_ECX[0x2e] = *(int *)(param_1 + 0xb8);
    piVar2 = in_ECX + 10;
    for (iVar1 = 0x13; iVar1 != 0; iVar1 = iVar1 + -1) {
      *piVar2 = 0;
      piVar2 = piVar2 + 1;
    }
    iVar1 = (**(code **)(*in_ECX + 0xc))();
    if (-1 < iVar1) {
      iVar1 = FUN_10086b14(0);
      if (-1 < iVar1) {
        iVar1 = 0;
      }
    }
  }
  return iVar1;
}


