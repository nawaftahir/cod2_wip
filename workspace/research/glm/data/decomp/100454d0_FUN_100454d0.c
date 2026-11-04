// 100454d0 size=468 FUN_100454d0

void FUN_100454d0(void)

{
  int *piVar1;
  undefined1 *puVar2;
  int iVar3;
  char cVar4;
  char cVar5;
  int *in_EAX;
  char cVar6;
  int *piVar7;
  int iVar8;
  
  FUN_10044e40(0xda);
  FUN_10044eb0();
  piVar7 = (int *)in_EAX[8];
  *(char *)*piVar7 = (char)in_EAX[0x3b];
  iVar8 = piVar7[1];
  *piVar7 = *piVar7 + 1;
  piVar7[1] = iVar8 + -1;
  if ((iVar8 + -1 == 0) && (cVar5 = (*(code *)piVar7[3])(), cVar5 == '\0')) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x18;
    (**(code **)*in_EAX)();
  }
  iVar8 = 0;
  if (0 < in_EAX[0x3b]) {
    piVar7 = in_EAX + 0x3c;
    do {
      piVar1 = (int *)in_EAX[8];
      puVar2 = (undefined1 *)*piVar7;
      *(undefined1 *)*piVar1 = *puVar2;
      iVar3 = piVar1[1];
      *piVar1 = *piVar1 + 1;
      piVar1[1] = iVar3 + -1;
      if ((iVar3 + -1 == 0) && (cVar5 = (*(code *)piVar1[3])(), cVar5 == '\0')) {
        *(undefined4 *)(*in_EAX + 0x14) = 0x18;
        (**(code **)*in_EAX)();
      }
      cVar5 = (char)*(undefined4 *)(puVar2 + 0x14);
      cVar6 = (char)*(undefined4 *)(puVar2 + 0x18);
      if ((char)in_EAX[0x37] != '\0') {
        cVar4 = cVar6;
        if (in_EAX[0x4d] == 0) {
          cVar6 = '\0';
          if ((in_EAX[0x4f] == 0) || (cVar4 = '\0', *(char *)((int)in_EAX + 0xb9) != '\0'))
          goto LAB_100455ae;
        }
        cVar6 = cVar4;
        cVar5 = '\0';
      }
LAB_100455ae:
      piVar1 = (int *)in_EAX[8];
      *(char *)*piVar1 = cVar5 * '\x10' + cVar6;
      iVar3 = piVar1[1];
      *piVar1 = *piVar1 + 1;
      piVar1[1] = iVar3 + -1;
      if ((iVar3 + -1 == 0) && (cVar5 = (*(code *)piVar1[3])(), cVar5 == '\0')) {
        *(undefined4 *)(*in_EAX + 0x14) = 0x18;
        (**(code **)*in_EAX)();
      }
      iVar8 = iVar8 + 1;
      piVar7 = piVar7 + 1;
    } while (iVar8 < in_EAX[0x3b]);
  }
  piVar7 = (int *)in_EAX[8];
  *(char *)*piVar7 = (char)in_EAX[0x4d];
  iVar8 = piVar7[1];
  *piVar7 = *piVar7 + 1;
  piVar7[1] = iVar8 + -1;
  if ((iVar8 + -1 == 0) && (cVar5 = (*(code *)piVar7[3])(), cVar5 == '\0')) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x18;
    (**(code **)*in_EAX)();
  }
  piVar7 = (int *)in_EAX[8];
  *(char *)*piVar7 = (char)in_EAX[0x4e];
  iVar8 = piVar7[1];
  *piVar7 = *piVar7 + 1;
  piVar7[1] = iVar8 + -1;
  if ((iVar8 + -1 == 0) && (cVar5 = (*(code *)piVar7[3])(), cVar5 == '\0')) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x18;
    (**(code **)*in_EAX)();
  }
  piVar7 = (int *)in_EAX[8];
  *(char *)*piVar7 = (char)in_EAX[0x4f] * '\x10' + (char)in_EAX[0x50];
  iVar8 = piVar7[1];
  *piVar7 = *piVar7 + 1;
  piVar7[1] = iVar8 + -1;
  if ((iVar8 + -1 == 0) && (cVar5 = (*(code *)piVar7[3])(), cVar5 == '\0')) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x18;
    (**(code **)*in_EAX)();
  }
  return;
}


