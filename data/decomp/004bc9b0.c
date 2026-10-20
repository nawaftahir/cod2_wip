
int FUN_004bc9b0(int *param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  byte local_8;
  byte local_7;
  byte local_6;
  undefined2 local_5;
  
  iVar2 = FUN_004bc1f0(&local_8,5,param_2);
  if (iVar2 == 0) {
    return 0;
  }
  if (1 < *param_2) {
    return -1;
  }
  if (local_8 != (byte)(local_5._1_1_ ^ (byte)local_5 ^ local_6 ^ local_7)) {
    FUN_004becd0(&DAT_005632f8);
    return -1;
  }
  iVar1 = param_1[1];
  iVar3 = CONCAT31(CONCAT21(local_5,local_6),local_7);
  iVar2 = iVar1 + iVar3;
  param_1[1] = iVar2;
  if (param_1[2] < iVar2) {
    FUN_004bf1c0(iVar1);
  }
  iVar2 = FUN_004bc1f0(*param_1 + iVar1,iVar3,param_2);
  if (iVar2 == 0) {
    FUN_004becd0(&DAT_00563308);
    return -1;
  }
  return (uint)(*param_2 < 2) * 2 + -1;
}

