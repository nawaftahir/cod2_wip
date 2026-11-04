// 100471c0 size=714 FUN_100471c0

void FUN_100471c0(void)

{
  undefined4 *puVar1;
  int in_EAX;
  int *piVar2;
  int *in_ECX;
  int iVar3;
  int iVar4;
  
  if (in_ECX[5] != 100) {
    *(undefined4 *)(*in_ECX + 0x14) = 0x14;
    *(int *)(*in_ECX + 0x18) = in_ECX[5];
    (**(code **)*in_ECX)();
  }
  in_ECX[0x12] = in_EAX;
  *(undefined1 *)(in_ECX + 0x33) = 0;
  *(undefined1 *)(in_ECX + 0x35) = 0;
  switch(in_EAX) {
  case 0:
    iVar3 = in_ECX[0xb];
    in_ECX[0x11] = iVar3;
    if ((iVar3 < 1) || (10 < iVar3)) {
      *(undefined4 *)(*in_ECX + 0x14) = 0x1a;
      *(int *)(*in_ECX + 0x18) = in_ECX[0x11];
      *(undefined4 *)(*in_ECX + 0x1c) = 10;
      (**(code **)*in_ECX)();
    }
    iVar3 = 0;
    if (0 < in_ECX[0x11]) {
      iVar4 = 0;
      do {
        piVar2 = (int *)(in_ECX[0x13] + iVar4);
        *piVar2 = iVar3;
        piVar2[2] = 1;
        piVar2[3] = 1;
        piVar2[4] = 0;
        piVar2[5] = 0;
        piVar2[6] = 0;
        iVar3 = iVar3 + 1;
        iVar4 = iVar4 + 0x54;
      } while (iVar3 < in_ECX[0x11]);
      return;
    }
    break;
  case 1:
    *(undefined1 *)(in_ECX + 0x33) = 1;
    in_ECX[0x11] = 1;
    puVar1 = (undefined4 *)in_ECX[0x13];
    *puVar1 = 1;
    puVar1[2] = 1;
    puVar1[3] = 1;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    return;
  case 2:
    puVar1 = (undefined4 *)in_ECX[0x13];
    in_ECX[0x11] = 3;
    *(undefined1 *)(in_ECX + 0x35) = 1;
    puVar1[2] = 1;
    puVar1[3] = 1;
    *puVar1 = 0x52;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0x5c) = 1;
    *(undefined4 *)(iVar3 + 0x60) = 1;
    *(undefined4 *)(iVar3 + 0x54) = 0x47;
    *(undefined4 *)(iVar3 + 100) = 0;
    *(undefined4 *)(iVar3 + 0x68) = 0;
    *(undefined4 *)(iVar3 + 0x6c) = 0;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0xb0) = 1;
    *(undefined4 *)(iVar3 + 0xb4) = 1;
    *(undefined4 *)(iVar3 + 0xa8) = 0x42;
    *(undefined4 *)(iVar3 + 0xb8) = 0;
    *(undefined4 *)(iVar3 + 0xbc) = 0;
    *(undefined4 *)(iVar3 + 0xc0) = 0;
    return;
  case 3:
    puVar1 = (undefined4 *)in_ECX[0x13];
    in_ECX[0x11] = 3;
    *(undefined1 *)(in_ECX + 0x33) = 1;
    *puVar1 = 1;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    puVar1[2] = 2;
    puVar1[3] = 2;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0x5c) = 1;
    *(undefined4 *)(iVar3 + 0x60) = 1;
    *(undefined4 *)(iVar3 + 100) = 1;
    *(undefined4 *)(iVar3 + 0x68) = 1;
    *(undefined4 *)(iVar3 + 0x6c) = 1;
    *(undefined4 *)(iVar3 + 0x54) = 2;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0xb0) = 1;
    *(undefined4 *)(iVar3 + 0xb4) = 1;
    *(undefined4 *)(iVar3 + 0xb8) = 1;
    *(undefined4 *)(iVar3 + 0xbc) = 1;
    *(undefined4 *)(iVar3 + 0xc0) = 1;
    *(undefined4 *)(iVar3 + 0xa8) = 3;
    return;
  case 4:
    puVar1 = (undefined4 *)in_ECX[0x13];
    in_ECX[0x11] = 4;
    *(undefined1 *)(in_ECX + 0x35) = 1;
    puVar1[2] = 1;
    puVar1[3] = 1;
    *puVar1 = 0x43;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0x5c) = 1;
    *(undefined4 *)(iVar3 + 0x60) = 1;
    *(undefined4 *)(iVar3 + 0x54) = 0x4d;
    *(undefined4 *)(iVar3 + 100) = 0;
    *(undefined4 *)(iVar3 + 0x68) = 0;
    *(undefined4 *)(iVar3 + 0x6c) = 0;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0xb0) = 1;
    *(undefined4 *)(iVar3 + 0xb4) = 1;
    *(undefined4 *)(iVar3 + 0xa8) = 0x59;
    *(undefined4 *)(iVar3 + 0xb8) = 0;
    *(undefined4 *)(iVar3 + 0xbc) = 0;
    *(undefined4 *)(iVar3 + 0xc0) = 0;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0x104) = 1;
    *(undefined4 *)(iVar3 + 0x108) = 1;
    *(undefined4 *)(iVar3 + 0xfc) = 0x4b;
    *(undefined4 *)(iVar3 + 0x10c) = 0;
    *(undefined4 *)(iVar3 + 0x110) = 0;
    *(undefined4 *)(iVar3 + 0x114) = 0;
    return;
  case 5:
    puVar1 = (undefined4 *)in_ECX[0x13];
    in_ECX[0x11] = 4;
    *(undefined1 *)(in_ECX + 0x35) = 1;
    *puVar1 = 1;
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    puVar1[2] = 2;
    puVar1[3] = 2;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0x5c) = 1;
    *(undefined4 *)(iVar3 + 0x60) = 1;
    *(undefined4 *)(iVar3 + 100) = 1;
    *(undefined4 *)(iVar3 + 0x68) = 1;
    *(undefined4 *)(iVar3 + 0x6c) = 1;
    *(undefined4 *)(iVar3 + 0x54) = 2;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0xb0) = 1;
    *(undefined4 *)(iVar3 + 0xb4) = 1;
    *(undefined4 *)(iVar3 + 0xb8) = 1;
    *(undefined4 *)(iVar3 + 0xbc) = 1;
    *(undefined4 *)(iVar3 + 0xc0) = 1;
    *(undefined4 *)(iVar3 + 0xa8) = 3;
    iVar3 = in_ECX[0x13];
    *(undefined4 *)(iVar3 + 0xfc) = 4;
    *(undefined4 *)(iVar3 + 0x104) = 2;
    *(undefined4 *)(iVar3 + 0x108) = 2;
    *(undefined4 *)(iVar3 + 0x10c) = 0;
    *(undefined4 *)(iVar3 + 0x110) = 0;
    *(undefined4 *)(iVar3 + 0x114) = 0;
    return;
  default:
    *(undefined4 *)(*in_ECX + 0x14) = 10;
    (**(code **)*in_ECX)();
  }
  return;
}


