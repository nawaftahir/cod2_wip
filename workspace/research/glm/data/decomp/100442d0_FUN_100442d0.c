// 100442d0 size=200 FUN_100442d0

uint FUN_100442d0(char param_1)

{
  int *in_EAX;
  uint uVar1;
  int iVar2;
  int *piVar3;
  
  uVar1 = FUN_10044020(0x7f);
  if ((char)uVar1 == '\0') {
    return uVar1 & 0xffffff00;
  }
  in_EAX[2] = 0;
  in_EAX[3] = 0;
  *(undefined1 *)*in_EAX = 0xff;
  iVar2 = in_EAX[1];
  *in_EAX = *in_EAX + 1;
  in_EAX[1] = iVar2 + -1;
  if (iVar2 + -1 == 0) {
    piVar3 = *(int **)(in_EAX[8] + 0x20);
    uVar1 = (*(code *)piVar3[3])(in_EAX[8]);
    if ((char)uVar1 == '\0') goto LAB_10044392;
    *in_EAX = *piVar3;
    in_EAX[1] = piVar3[1];
  }
  *(char *)*in_EAX = param_1 + -0x30;
  iVar2 = in_EAX[1];
  *in_EAX = *in_EAX + 1;
  in_EAX[1] = iVar2 + -1;
  if (iVar2 + -1 == 0) {
    piVar3 = *(int **)(in_EAX[8] + 0x20);
    uVar1 = (*(code *)piVar3[3])(in_EAX[8]);
    if ((char)uVar1 == '\0') {
LAB_10044392:
      return uVar1 & 0xffffff00;
    }
    *in_EAX = *piVar3;
    in_EAX[1] = piVar3[1];
  }
  iVar2 = 0;
  if (0 < *(int *)(in_EAX[8] + 0xec)) {
    piVar3 = in_EAX + 4;
    do {
      *piVar3 = 0;
      iVar2 = iVar2 + 1;
      piVar3 = piVar3 + 1;
    } while (iVar2 < *(int *)(in_EAX[8] + 0xec));
  }
  return CONCAT31((int3)((uint)iVar2 >> 8),1);
}


