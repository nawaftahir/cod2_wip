// 1004fc90 size=442 FUN_1004fc90

void FUN_1004fc90(void)

{
  int iVar1;
  undefined1 uVar2;
  int *in_EAX;
  int iVar3;
  undefined4 uStack_4;
  
  iVar1 = in_EAX[0x62];
  FUN_1004f9e0();
  FUN_1004fc10();
  *(undefined4 *)(iVar1 + 0xc) = 0;
  uVar2 = FUN_1004f960();
  *(undefined1 *)(iVar1 + 0x10) = uVar2;
  *(undefined4 *)(iVar1 + 0x14) = 0;
  *(undefined4 *)(iVar1 + 0x18) = 0;
  if ((*(char *)((int)in_EAX + 0x52) == '\0') || ((char)in_EAX[0x12] == '\0')) {
    *(undefined1 *)(in_EAX + 0x18) = 0;
    *(undefined1 *)((int)in_EAX + 0x61) = 0;
    *(undefined1 *)((int)in_EAX + 0x62) = 0;
  }
  if (*(char *)((int)in_EAX + 0x52) == '\0') goto LAB_1004fd2c;
  if (*(char *)((int)in_EAX + 0x49) != '\0') {
    *(undefined4 *)(*in_EAX + 0x14) = 0x2f;
    (**(code **)*in_EAX)();
  }
  if (in_EAX[0x1b] == 3) {
    if (in_EAX[0x1f] == 0) {
      if ((char)in_EAX[0x16] == '\0') goto LAB_1004fcfb;
      *(undefined1 *)((int)in_EAX + 0x62) = 1;
    }
    else {
      *(undefined1 *)((int)in_EAX + 0x61) = 1;
    }
  }
  else {
    *(undefined1 *)((int)in_EAX + 0x61) = 0;
    *(undefined1 *)((int)in_EAX + 0x62) = 0;
    in_EAX[0x1f] = 0;
LAB_1004fcfb:
    *(undefined1 *)(in_EAX + 0x18) = 1;
  }
  if ((char)in_EAX[0x18] != '\0') {
    FUN_10056520();
    *(int *)(iVar1 + 0x14) = in_EAX[0x6c];
  }
  if ((*(char *)((int)in_EAX + 0x62) != '\0') || (*(char *)((int)in_EAX + 0x61) != '\0')) {
    FUN_10057840();
    *(int *)(iVar1 + 0x18) = in_EAX[0x6c];
  }
LAB_1004fd2c:
  if (*(char *)((int)in_EAX + 0x49) == '\0') {
    if (*(char *)(iVar1 + 0x10) == '\0') {
      FUN_1004bf10();
      FUN_10051c10();
    }
    else {
      FUN_10050600();
    }
    FUN_10051650(*(undefined1 *)((int)in_EAX + 0x62));
  }
  FUN_1004c410();
  if (*(char *)((int)in_EAX + 0xd1) == '\0') {
    if ((char)in_EAX[0x34] == '\0') {
      FUN_1004cf60();
    }
    else {
      FUN_10051320();
    }
  }
  else {
    *(undefined4 *)(*in_EAX + 0x14) = 1;
    (**(code **)*in_EAX)();
  }
  if ((*(char *)(in_EAX[0x66] + 0x10) != '\0') || (uStack_4 = 0, (char)in_EAX[0x12] != '\0')) {
    uStack_4 = 1;
  }
  FUN_1004b940(uStack_4);
  if (*(char *)((int)in_EAX + 0x49) == '\0') {
    FUN_1004db80(0);
  }
  (**(code **)(in_EAX[1] + 0x18))();
  (**(code **)(in_EAX[0x66] + 8))();
  if (((in_EAX[2] != 0) && ((char)in_EAX[0x12] == '\0')) && (*(char *)(in_EAX[0x66] + 0x10) != '\0')
     ) {
    iVar3 = in_EAX[0xb];
    if ((char)in_EAX[0x34] != '\0') {
      iVar3 = iVar3 * 3 + 2;
    }
    *(undefined4 *)(in_EAX[2] + 4) = 0;
    *(int *)(in_EAX[2] + 8) = in_EAX[0x49] * iVar3;
    *(undefined4 *)(in_EAX[2] + 0xc) = 0;
    *(uint *)(in_EAX[2] + 0x10) = (*(char *)((int)in_EAX + 0x62) != '\0') + 2;
    *(int *)(iVar1 + 0xc) = *(int *)(iVar1 + 0xc) + 1;
  }
  return;
}


