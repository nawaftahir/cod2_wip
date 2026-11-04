// 100c9db5 size=258 FUN_100c9db5

int FUN_100c9db5(uint param_1,undefined4 *param_2)

{
  int iVar1;
  int *in_ECX;
  char local_24 [32];
  
  if (in_ECX[0x56] == 0) {
    iVar1 = FUN_100c98b1(0x30);
    if (((((-1 < iVar1) &&
          (iVar1 = (**(code **)(*in_ECX + 100))(param_1 & 0x7ff | 0xf0000000,0xf0000,0), -1 < iVar1)
          ) && (iVar1 = FUN_100c7b3a(*param_2), -1 < iVar1)) &&
        ((iVar1 = FUN_100c7b3a(param_2[1]), -1 < iVar1 &&
         (iVar1 = FUN_100c7b3a(param_2[2]), -1 < iVar1)))) &&
       ((iVar1 = FUN_100c7b3a(param_2[3]), -1 < iVar1 &&
        ((iVar1 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar1 &&
         (iVar1 = FUN_100c4cc4(), -1 < iVar1)))))) {
      iVar1 = 0;
    }
  }
  else {
    _sprintf(local_24,"i_$zz%d",param_1);
    iVar1 = FUN_1006a777(local_24,param_1,1);
    if (-1 < iVar1) {
      iVar1 = FUN_10068bc6(local_24);
      *(undefined4 *)(iVar1 + 0xc) = 1;
      *(undefined4 *)(iVar1 + 0x10) = *param_2;
      *(undefined4 *)(iVar1 + 0x14) = param_2[1];
      *(undefined4 *)(iVar1 + 0x18) = param_2[2];
      *(undefined4 *)(iVar1 + 0x1c) = param_2[3];
      in_ECX[0x7d] = in_ECX[0x7d] + 1;
      iVar1 = 0;
    }
  }
  return iVar1;
}


