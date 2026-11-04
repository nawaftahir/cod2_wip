// 100b7415 size=259 FUN_100b7415

int FUN_100b7415(int param_1)

{
  int iVar1;
  int iVar2;
  int *in_ECX;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  iVar1 = *(int *)(in_ECX[5] + param_1 * 4);
  if ((in_ECX[0x32] & 0xffffU) < 0x101) {
    FUN_1008b0b5();
    iVar2 = -0x7fffbfff;
  }
  else {
    iVar2 = *(int *)(iVar1 + 8);
    if ((iVar2 == -1) || (iVar2 = FUN_100b7415(iVar2), -1 < iVar2)) {
      if (in_ECX[0x4e] == param_1) {
        iVar2 = 0;
      }
      else {
        iVar2 = FUN_100c98b1(1);
        if ((((-1 < iVar2) &&
             (iVar2 = (**(code **)(*in_ECX + 100))(0xb0000000,0x10000,0), -1 < iVar2)) &&
            (iVar2 = (**(code **)(*in_ECX + 0x74))(iVar1,&local_10,&local_8), -1 < iVar2)) &&
           (((iVar2 = (**(code **)(*in_ECX + 0x78))(&param_1,1,0x10000,&local_c), -1 < iVar2 &&
             (iVar2 = (**(code **)(*in_ECX + 0x68))(local_10,local_c,local_8), -1 < iVar2)) &&
            ((iVar2 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar2 &&
             (iVar2 = FUN_100c4cc4(), -1 < iVar2)))))) {
          in_ECX[0x4e] = param_1;
          iVar2 = 0;
        }
      }
    }
  }
  return iVar2;
}


