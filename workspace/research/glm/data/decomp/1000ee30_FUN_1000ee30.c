// 1000ee30 size=246 FUN_1000ee30

void FUN_1000ee30(int param_1,int param_2,int param_3,uint param_4,undefined4 param_5)

{
  byte *pbVar1;
  byte bVar2;
  int in_ECX;
  uint uVar3;
  int iVar4;
  bool bVar5;
  
  bVar5 = (param_4 & 3) != 0;
  *(bool *)(in_ECX + 0xb) = bVar5;
  pbVar1 = (byte *)(in_ECX + 8);
  if (bVar5) {
    pbVar1[0] = 0;
    pbVar1[1] = 0;
  }
  else {
    FUN_1000d090();
  }
  FUN_1000edc0();
  bVar2 = *pbVar1;
  param_1 = param_1 >> (bVar2 & 0x1f);
  iVar4 = 1;
  if (1 - param_1 < 0) {
    iVar4 = param_1;
  }
  param_2 = param_2 >> (bVar2 & 0x1f);
  *(short *)(in_ECX + 0x18) = (short)iVar4;
  iVar4 = 1;
  if (1 - param_2 < 0) {
    iVar4 = param_2;
  }
  param_3 = param_3 >> (bVar2 & 0x1f);
  *(short *)(in_ECX + 0x1a) = (short)iVar4;
  iVar4 = 1;
  if (1 - param_3 < 0) {
    iVar4 = param_3;
  }
  uVar3 = param_4 >> 1 & 1;
  *(short *)(in_ECX + 0x1c) = (short)iVar4;
  if ((param_4 & 4) == 0) {
    if ((param_4 & 8) == 0) {
      FUN_1000ce80(uVar3,param_5,1);
    }
    else {
      FUN_1000cf00(uVar3,param_5);
    }
  }
  else {
    FUN_1000cf90();
  }
  FUN_1000ca70();
  return;
}


