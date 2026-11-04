// 10046e00 size=263 FUN_10046e00

void FUN_10046e00(void)

{
  int *in_EAX;
  int iVar1;
  int *piVar2;
  
  if (in_EAX[5] != 100) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x14;
    *(int *)(*in_EAX + 0x18) = in_EAX[5];
    (**(code **)*in_EAX)();
  }
  if (in_EAX[0x13] == 0) {
    iVar1 = (**(code **)in_EAX[1])();
    in_EAX[0x13] = iVar1;
  }
  in_EAX[0x10] = 8;
  FUN_10046a20(&DAT_10190970,0x32,1);
  FUN_10046a20(&DAT_10190a70,0x32,1);
  FUN_10046da0();
  piVar2 = in_EAX + 0x24;
  iVar1 = 0x10;
  do {
    *(undefined1 *)(piVar2 + -4) = 0;
    *(undefined1 *)piVar2 = 1;
    *(undefined1 *)(piVar2 + 4) = 5;
    piVar2 = (int *)((int)piVar2 + 1);
    iVar1 = iVar1 + -1;
  } while (iVar1 != 0);
  in_EAX[0x2d] = 0;
  in_EAX[0x2c] = 0;
  *(undefined1 *)(in_EAX + 0x2e) = 0;
  *(undefined1 *)((int)in_EAX + 0xb9) = 0;
  *(undefined1 *)((int)in_EAX + 0xba) = 0;
  if (8 < in_EAX[0x10]) {
    *(undefined1 *)((int)in_EAX + 0xba) = 1;
  }
  *(undefined1 *)((int)in_EAX + 0xbb) = 0;
  in_EAX[0x2f] = 0;
  in_EAX[0x30] = 0;
  in_EAX[0x31] = 0;
  in_EAX[0x32] = 0;
  *(undefined1 *)((int)in_EAX + 0xcf) = 0;
  *(undefined1 *)((int)in_EAX + 0xcd) = 1;
  *(undefined1 *)((int)in_EAX + 0xce) = 1;
  *(undefined2 *)(in_EAX + 0x34) = 1;
  *(undefined2 *)((int)in_EAX + 0xd2) = 1;
  FUN_10046f10();
  return;
}


