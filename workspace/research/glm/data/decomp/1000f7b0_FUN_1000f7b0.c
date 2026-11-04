// 1000f7b0 size=331 FUN_1000f7b0

void FUN_1000f7b0(int param_1,int param_2,undefined4 param_3,int param_4)

{
  int *in_EAX;
  int iVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  
  FUN_1000ee30((int)*(short *)(param_1 + 6),(int)*(short *)(param_1 + 8),
               (int)*(short *)(param_1 + 10),*(undefined1 *)(param_1 + 5),0);
  iVar4 = 1;
  uVar2 = (*in_EAX != 5) - 1 & 5;
  if ((*(byte *)(param_1 + 5) & 2) == 0) {
    for (iVar1 = 1;
        ((iVar1 < *(short *)(param_1 + 6) || (iVar1 < *(short *)(param_1 + 8))) ||
        (iVar1 < *(short *)(param_1 + 10))); iVar1 = iVar1 << 1) {
      iVar4 = iVar4 + 1;
    }
  }
  uVar5 = iVar4 - 1;
  if ((int)(uint)*(byte *)(in_EAX + 2) <= (int)uVar5) {
    do {
      iVar4 = (int)*(short *)(param_1 + 6) >> ((byte)uVar5 & 0x1f);
      if (-1 < 1 - iVar4) {
        iVar4 = 1;
      }
      iVar1 = (int)*(short *)(param_1 + 8) >> ((byte)uVar5 & 0x1f);
      if (-1 < 1 - iVar1) {
        iVar1 = 1;
      }
      iVar3 = 0;
      if (uVar2 != 0xffffffff) {
        do {
          if (*in_EAX == 4) {
            FUN_1000ec00();
          }
          else if (((*in_EAX != 5) || (uVar5 == *(byte *)(in_EAX + 2))) || (DAT_101d496b != '\0')) {
            FUN_1000ea20(param_3,param_2);
          }
          param_2 = param_2 + (iVar1 + 3 >> 2) * (iVar4 + 3 >> 2) * param_4;
          iVar3 = iVar3 + 1;
        } while (iVar3 < (int)(uVar2 + 1));
      }
      uVar5 = uVar5 - 1;
    } while ((int)(uint)*(byte *)(in_EAX + 2) <= (int)uVar5);
  }
  return;
}


