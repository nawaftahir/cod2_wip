// 100458d0 size=362 FUN_100458d0

void FUN_100458d0(void)

{
  int iVar1;
  char cVar2;
  int *in_EAX;
  int *piVar3;
  
  FUN_10044e40(0xee);
  FUN_10044eb0();
  piVar3 = (int *)in_EAX[8];
  *(undefined1 *)*piVar3 = 0x41;
  iVar1 = piVar3[1];
  *piVar3 = *piVar3 + 1;
  piVar3[1] = iVar1 + -1;
  if (iVar1 + -1 == 0) {
    cVar2 = (*(code *)piVar3[3])();
    if (cVar2 == '\0') {
      *(undefined4 *)(*in_EAX + 0x14) = 0x18;
      (**(code **)*in_EAX)();
    }
  }
  piVar3 = (int *)in_EAX[8];
  *(undefined1 *)*piVar3 = 100;
  iVar1 = piVar3[1];
  *piVar3 = *piVar3 + 1;
  piVar3[1] = iVar1 + -1;
  if (iVar1 + -1 == 0) {
    cVar2 = (*(code *)piVar3[3])();
    if (cVar2 == '\0') {
      *(undefined4 *)(*in_EAX + 0x14) = 0x18;
      (**(code **)*in_EAX)();
    }
  }
  piVar3 = (int *)in_EAX[8];
  *(undefined1 *)*piVar3 = 0x6f;
  iVar1 = piVar3[1];
  *piVar3 = *piVar3 + 1;
  piVar3[1] = iVar1 + -1;
  if (iVar1 + -1 == 0) {
    cVar2 = (*(code *)piVar3[3])();
    if (cVar2 == '\0') {
      *(undefined4 *)(*in_EAX + 0x14) = 0x18;
      (**(code **)*in_EAX)();
    }
  }
  piVar3 = (int *)in_EAX[8];
  *(undefined1 *)*piVar3 = 0x62;
  iVar1 = piVar3[1];
  *piVar3 = *piVar3 + 1;
  piVar3[1] = iVar1 + -1;
  if (iVar1 + -1 == 0) {
    cVar2 = (*(code *)piVar3[3])();
    if (cVar2 == '\0') {
      *(undefined4 *)(*in_EAX + 0x14) = 0x18;
      (**(code **)*in_EAX)();
    }
  }
  piVar3 = (int *)in_EAX[8];
  *(undefined1 *)*piVar3 = 0x65;
  iVar1 = piVar3[1];
  *piVar3 = *piVar3 + 1;
  piVar3[1] = iVar1 + -1;
  if (iVar1 + -1 == 0) {
    cVar2 = (*(code *)piVar3[3])();
    if (cVar2 == '\0') {
      *(undefined4 *)(*in_EAX + 0x14) = 0x18;
      (**(code **)*in_EAX)();
    }
  }
  FUN_10044eb0();
  FUN_10044eb0();
  FUN_10044eb0();
  if (in_EAX[0x12] == 3) {
    piVar3 = (int *)in_EAX[8];
    *(undefined1 *)*piVar3 = 1;
  }
  else {
    piVar3 = (int *)in_EAX[8];
    if (in_EAX[0x12] == 5) {
      *(undefined1 *)*piVar3 = 2;
    }
    else {
      *(undefined1 *)*piVar3 = 0;
    }
  }
  iVar1 = piVar3[1];
  *piVar3 = *piVar3 + 1;
  piVar3[1] = iVar1 + -1;
  if (iVar1 + -1 == 0) {
    cVar2 = (*(code *)piVar3[3])();
    if (cVar2 == '\0') {
      *(undefined4 *)(*in_EAX + 0x14) = 0x18;
      (**(code **)*in_EAX)();
    }
  }
  return;
}


