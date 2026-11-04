// 1000f020 size=135 FUN_1000f020

int FUN_1000f020(byte param_1,int param_2)

{
  int in_EAX;
  int iVar1;
  longlong lVar2;
  undefined8 uVar3;
  
  lVar2 = FUN_1000ef40();
  iVar1 = (int)lVar2;
  if ((param_1 & 2) == 0) {
    while (((iVar1 = (int)lVar2, 1 < param_2 || (1 < in_EAX)) || (0x1ffffffff < lVar2))) {
      param_2 = param_2 >> 1;
      if (-1 < 1 - param_2) {
        param_2 = 1;
      }
      in_EAX = in_EAX >> 1;
      if (-1 < 1 - in_EAX) {
        in_EAX = 1;
      }
      uVar3 = FUN_1000ef40(in_EAX);
      lVar2 = CONCAT44((int)((ulonglong)uVar3 >> 0x20),iVar1 + (int)uVar3);
    }
  }
  if ((param_1 & 4) != 0) {
    return iVar1 * 6;
  }
  return iVar1;
}


