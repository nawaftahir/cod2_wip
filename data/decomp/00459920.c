
void FUN_00459920(int param_1)

{
  int iVar1;
  int iVar2;
  int in_EAX;
  int iVar3;
  int iVar4;
  
  iVar3 = 0;
  if (0 < *(int *)(in_EAX + 0x38)) {
    iVar4 = 0;
    do {
      iVar2 = *(int *)(*(int *)(in_EAX + 0x3c) + 0x40 + iVar4);
      iVar1 = *(int *)(in_EAX + 0x3c) + 0x40 + iVar4;
      iVar4 = iVar4 + 0xa8;
      *(float *)(iVar1 + 4) = (float)(*(int *)(iVar2 + 0x14) * param_1);
      iVar3 = iVar3 + 1;
      *(float *)(iVar1 + 8) = (float)(*(int *)(iVar2 + 0x18) * param_1);
    } while (iVar3 < *(int *)(in_EAX + 0x38));
  }
  FUN_0045a220(1);
  if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
    FUN_00475350();
  }
  FUN_0047a3c0();
  *(short *)(in_EAX + 0x42) = *(short *)(in_EAX + 0x42) + 1;
  if (*(int *)(in_EAX + 0x44) != 0) {
    FUN_0042fad0(param_1);
  }
  return;
}

