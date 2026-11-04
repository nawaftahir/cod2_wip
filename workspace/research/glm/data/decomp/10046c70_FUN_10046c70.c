// 10046c70 size=108 FUN_10046c70

void FUN_10046c70(undefined4 param_1)

{
  int in_EAX;
  int iVar1;
  
  if (in_EAX < 1) {
    iVar1 = 5000;
  }
  else {
    if (in_EAX < 0x65) {
      if (in_EAX < 0x32) {
        iVar1 = (int)(5000 / (longlong)in_EAX);
        goto LAB_10046ca4;
      }
    }
    else {
      in_EAX = 100;
    }
    iVar1 = (100 - in_EAX) * 2;
  }
LAB_10046ca4:
  FUN_10046a20(&DAT_10190970,iVar1,param_1);
  FUN_10046a20(&DAT_10190a70,iVar1,param_1);
  return;
}


