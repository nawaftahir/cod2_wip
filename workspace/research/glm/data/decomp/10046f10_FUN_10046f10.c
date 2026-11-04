// 10046f10 size=658 FUN_10046f10

void FUN_10046f10(void)

{
  undefined4 *puVar1;
  int iVar2;
  int *in_EAX;
  
  switch(in_EAX[0xc]) {
  case 0:
    FUN_100471c0();
    return;
  case 1:
    if (in_EAX[5] != 100) {
      *(undefined4 *)(*in_EAX + 0x14) = 0x14;
      *(int *)(*in_EAX + 0x18) = in_EAX[5];
      (**(code **)*in_EAX)();
    }
    in_EAX[0x12] = 1;
    *(undefined1 *)(in_EAX + 0x33) = 1;
    in_EAX[0x11] = 1;
    *(undefined1 *)(in_EAX + 0x35) = 0;
    puVar1 = (undefined4 *)in_EAX[0x13];
    *puVar1 = 1;
    puVar1[2] = 1;
    puVar1[3] = 1;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    return;
  case 2:
    if (in_EAX[5] != 100) {
      *(undefined4 *)(*in_EAX + 0x14) = 0x14;
      *(int *)(*in_EAX + 0x18) = in_EAX[5];
      (**(code **)*in_EAX)();
    }
    break;
  case 3:
    if (in_EAX[5] != 100) {
      *(undefined4 *)(*in_EAX + 0x14) = 0x14;
      *(int *)(*in_EAX + 0x18) = in_EAX[5];
      (**(code **)*in_EAX)();
    }
    break;
  case 4:
    if (in_EAX[5] != 100) {
      *(undefined4 *)(*in_EAX + 0x14) = 0x14;
      *(int *)(*in_EAX + 0x18) = in_EAX[5];
      (**(code **)*in_EAX)();
    }
    puVar1 = (undefined4 *)in_EAX[0x13];
    *(undefined1 *)(in_EAX + 0x33) = 0;
    *(undefined1 *)(in_EAX + 0x35) = 1;
    in_EAX[0x12] = 4;
    in_EAX[0x11] = 4;
    *puVar1 = 0x43;
    puVar1[2] = 1;
    puVar1[3] = 1;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    iVar2 = in_EAX[0x13];
    *(undefined4 *)(iVar2 + 0x54) = 0x4d;
    *(undefined4 *)(iVar2 + 0x5c) = 1;
    *(undefined4 *)(iVar2 + 0x60) = 1;
    *(undefined4 *)(iVar2 + 100) = 0;
    *(undefined4 *)(iVar2 + 0x68) = 0;
    *(undefined4 *)(iVar2 + 0x6c) = 0;
    iVar2 = in_EAX[0x13];
    *(undefined4 *)(iVar2 + 0xa8) = 0x59;
    *(undefined4 *)(iVar2 + 0xb0) = 1;
    *(undefined4 *)(iVar2 + 0xb4) = 1;
    *(undefined4 *)(iVar2 + 0xb8) = 0;
    *(undefined4 *)(iVar2 + 0xbc) = 0;
    *(undefined4 *)(iVar2 + 0xc0) = 0;
    iVar2 = in_EAX[0x13];
    *(undefined4 *)(iVar2 + 0xfc) = 0x4b;
    *(undefined4 *)(iVar2 + 0x104) = 1;
    *(undefined4 *)(iVar2 + 0x108) = 1;
    *(undefined4 *)(iVar2 + 0x10c) = 0;
    *(undefined4 *)(iVar2 + 0x110) = 0;
    *(undefined4 *)(iVar2 + 0x114) = 0;
    return;
  case 5:
    if (in_EAX[5] != 100) {
      *(undefined4 *)(*in_EAX + 0x14) = 0x14;
      *(int *)(*in_EAX + 0x18) = in_EAX[5];
      (**(code **)*in_EAX)();
    }
    puVar1 = (undefined4 *)in_EAX[0x13];
    in_EAX[0x12] = 5;
    *(undefined1 *)(in_EAX + 0x35) = 1;
    *(undefined1 *)(in_EAX + 0x33) = 0;
    in_EAX[0x11] = 4;
    puVar1[2] = 2;
    puVar1[3] = 2;
    *puVar1 = 1;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    iVar2 = in_EAX[0x13];
    *(undefined4 *)(iVar2 + 0x54) = 2;
    *(undefined4 *)(iVar2 + 0x5c) = 1;
    *(undefined4 *)(iVar2 + 0x60) = 1;
    *(undefined4 *)(iVar2 + 100) = 1;
    *(undefined4 *)(iVar2 + 0x68) = 1;
    *(undefined4 *)(iVar2 + 0x6c) = 1;
    iVar2 = in_EAX[0x13];
    *(undefined4 *)(iVar2 + 0xa8) = 3;
    *(undefined4 *)(iVar2 + 0xb0) = 1;
    *(undefined4 *)(iVar2 + 0xb4) = 1;
    *(undefined4 *)(iVar2 + 0xb8) = 1;
    *(undefined4 *)(iVar2 + 0xbc) = 1;
    *(undefined4 *)(iVar2 + 0xc0) = 1;
    iVar2 = in_EAX[0x13];
    *(undefined4 *)(iVar2 + 0x104) = 2;
    *(undefined4 *)(iVar2 + 0x108) = 2;
    *(undefined4 *)(iVar2 + 0xfc) = 4;
    *(undefined4 *)(iVar2 + 0x10c) = 0;
    *(undefined4 *)(iVar2 + 0x110) = 0;
    *(undefined4 *)(iVar2 + 0x114) = 0;
    return;
  default:
    *(undefined4 *)(*in_EAX + 0x14) = 9;
    (**(code **)*in_EAX)();
    return;
  }
  puVar1 = (undefined4 *)in_EAX[0x13];
  *(undefined1 *)(in_EAX + 0x33) = 1;
  *(undefined1 *)(in_EAX + 0x35) = 0;
  in_EAX[0x12] = 3;
  in_EAX[0x11] = 3;
  *puVar1 = 1;
  puVar1[2] = 2;
  puVar1[3] = 2;
  puVar1[4] = 0;
  puVar1[5] = 0;
  puVar1[6] = 0;
  iVar2 = in_EAX[0x13];
  *(undefined4 *)(iVar2 + 0x54) = 2;
  *(undefined4 *)(iVar2 + 0x5c) = 1;
  *(undefined4 *)(iVar2 + 0x60) = 1;
  *(undefined4 *)(iVar2 + 100) = 1;
  *(undefined4 *)(iVar2 + 0x68) = 1;
  *(undefined4 *)(iVar2 + 0x6c) = 1;
  iVar2 = in_EAX[0x13];
  *(undefined4 *)(iVar2 + 0xa8) = 3;
  *(undefined4 *)(iVar2 + 0xb0) = 1;
  *(undefined4 *)(iVar2 + 0xb4) = 1;
  *(undefined4 *)(iVar2 + 0xb8) = 1;
  *(undefined4 *)(iVar2 + 0xbc) = 1;
  *(undefined4 *)(iVar2 + 0xc0) = 1;
  return;
}


