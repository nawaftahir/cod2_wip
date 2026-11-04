// 10045350 size=370 FUN_10045350

void FUN_10045350(void)

{
  int *piVar1;
  int iVar2;
  char cVar3;
  int *in_ECX;
  int iVar4;
  undefined1 *puVar5;
  
  FUN_10044e40();
  FUN_10044eb0();
  if ((0xffff < in_ECX[10]) || (0xffff < in_ECX[9])) {
    *(undefined4 *)(*in_ECX + 0x14) = 0x29;
    *(undefined4 *)(*in_ECX + 0x18) = 0xffff;
    (**(code **)*in_ECX)();
  }
  piVar1 = (int *)in_ECX[8];
  *(char *)*piVar1 = (char)in_ECX[0x10];
  iVar4 = piVar1[1];
  *piVar1 = *piVar1 + 1;
  piVar1[1] = iVar4 + -1;
  if (iVar4 + -1 == 0) {
    cVar3 = (*(code *)piVar1[3])();
    if (cVar3 == '\0') {
      *(undefined4 *)(*in_ECX + 0x14) = 0x18;
      (**(code **)*in_ECX)();
    }
  }
  FUN_10044eb0();
  FUN_10044eb0();
  piVar1 = (int *)in_ECX[8];
  *(char *)*piVar1 = (char)in_ECX[0x11];
  iVar4 = piVar1[1];
  *piVar1 = *piVar1 + 1;
  piVar1[1] = iVar4 + -1;
  if (iVar4 + -1 == 0) {
    cVar3 = (*(code *)piVar1[3])();
    if (cVar3 == '\0') {
      *(undefined4 *)(*in_ECX + 0x14) = 0x18;
      (**(code **)*in_ECX)();
    }
  }
  puVar5 = (undefined1 *)in_ECX[0x13];
  iVar4 = 0;
  if (0 < in_ECX[0x11]) {
    do {
      piVar1 = (int *)in_ECX[8];
      *(undefined1 *)*piVar1 = *puVar5;
      iVar2 = piVar1[1];
      *piVar1 = *piVar1 + 1;
      piVar1[1] = iVar2 + -1;
      if (iVar2 + -1 == 0) {
        cVar3 = (*(code *)piVar1[3])();
        if (cVar3 == '\0') {
          *(undefined4 *)(*in_ECX + 0x14) = 0x18;
          (**(code **)*in_ECX)();
        }
      }
      piVar1 = (int *)in_ECX[8];
      *(char *)*piVar1 = puVar5[8] * '\x10' + puVar5[0xc];
      iVar2 = piVar1[1];
      *piVar1 = *piVar1 + 1;
      piVar1[1] = iVar2 + -1;
      if (iVar2 + -1 == 0) {
        cVar3 = (*(code *)piVar1[3])();
        if (cVar3 == '\0') {
          *(undefined4 *)(*in_ECX + 0x14) = 0x18;
          (**(code **)*in_ECX)();
        }
      }
      piVar1 = (int *)in_ECX[8];
      *(undefined1 *)*piVar1 = puVar5[0x10];
      iVar2 = piVar1[1];
      *piVar1 = *piVar1 + 1;
      piVar1[1] = iVar2 + -1;
      if (iVar2 + -1 == 0) {
        cVar3 = (*(code *)piVar1[3])();
        if (cVar3 == '\0') {
          *(undefined4 *)(*in_ECX + 0x14) = 0x18;
          (**(code **)*in_ECX)();
        }
      }
      iVar4 = iVar4 + 1;
      puVar5 = puVar5 + 0x54;
    } while (iVar4 < in_ECX[0x11]);
  }
  return;
}


