// 100c9c78 size=317 FUN_100c9c78

int FUN_100c9c78(uint param_1,undefined4 *param_2)

{
  uint uVar1;
  int iVar2;
  int *in_ECX;
  char local_24 [32];
  
  if (in_ECX[0x56] == 0) {
    if (param_1 < 0x800) {
      uVar1 = param_1 & 0x7ff | 0xa0000000;
    }
    else if (param_1 < 0x1000) {
      uVar1 = param_1 & 0x7ff | 0xb0000800;
    }
    else if (param_1 < 0x1800) {
      uVar1 = param_1 & 0x7ff | 0xc0000800;
    }
    else {
      uVar1 = param_1 & 0x7ff | 0xd0000800;
    }
    iVar2 = FUN_100c98b1(0x51);
    if (((((-1 < iVar2) && (iVar2 = (**(code **)(*in_ECX + 100))(uVar1,0xf0000,0), -1 < iVar2)) &&
         (iVar2 = FUN_100c7b3a(*param_2), -1 < iVar2)) &&
        ((iVar2 = FUN_100c7b3a(param_2[1]), -1 < iVar2 &&
         (iVar2 = FUN_100c7b3a(param_2[2]), -1 < iVar2)))) &&
       ((iVar2 = FUN_100c7b3a(param_2[3]), -1 < iVar2 &&
        ((iVar2 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar2 &&
         (iVar2 = FUN_100c4cc4(), -1 < iVar2)))))) {
      iVar2 = 0;
    }
  }
  else {
    _sprintf(local_24,"c_$zz%d",param_1);
    iVar2 = FUN_1006a777(local_24,param_1,1);
    if (-1 < iVar2) {
      iVar2 = FUN_10068bc6(local_24);
      *(undefined4 *)(iVar2 + 0xc) = 1;
      *(undefined4 *)(iVar2 + 0x10) = *param_2;
      *(undefined4 *)(iVar2 + 0x14) = param_2[1];
      *(undefined4 *)(iVar2 + 0x18) = param_2[2];
      *(undefined4 *)(iVar2 + 0x1c) = param_2[3];
      in_ECX[0x7d] = in_ECX[0x7d] + 1;
      iVar2 = 0;
    }
  }
  return iVar2;
}


