// 100c99ce size=70 FUN_100c99ce

int FUN_100c99ce(uint param_1,uint param_2,int param_3)

{
  byte *pbVar1;
  int iVar2;
  int in_ECX;
  
  iVar2 = FUN_100c99b7(param_1 | param_2);
  if (-1 < iVar2) {
    if (param_3 != 0) {
      iVar2 = FUN_100c99b7(param_3);
      if (iVar2 < 0) {
        return iVar2;
      }
      pbVar1 = (byte *)(*(int *)(in_ECX + 0x10c) + *(int *)(in_ECX + 0x118) * 4 + 3);
      *pbVar1 = *pbVar1 | 0x10;
    }
    iVar2 = 0;
  }
  return iVar2;
}


