// 10044f20 size=546 FUN_10044f20

char FUN_10044f20(int param_1)

{
  undefined2 uVar1;
  int iVar2;
  int *piVar3;
  char cVar4;
  char cVar5;
  ushort *puVar6;
  int *unaff_ESI;
  int iVar7;
  int *piVar8;
  
  iVar2 = unaff_ESI[param_1 + 0x14];
  if (iVar2 == 0) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x34;
    *(int *)(*unaff_ESI + 0x18) = param_1;
    (**(code **)*unaff_ESI)();
  }
  cVar4 = '\0';
  puVar6 = (ushort *)(iVar2 + 4);
  iVar7 = 0x10;
  do {
    if (0xff < puVar6[-2]) {
      cVar4 = '\x01';
    }
    if (0xff < puVar6[-1]) {
      cVar4 = '\x01';
    }
    if (0xff < *puVar6) {
      cVar4 = '\x01';
    }
    if (0xff < puVar6[1]) {
      cVar4 = '\x01';
    }
    puVar6 = puVar6 + 4;
    iVar7 = iVar7 + -1;
  } while (iVar7 != 0);
  if (*(char *)(iVar2 + 0x80) == '\0') {
    piVar8 = (int *)unaff_ESI[8];
    *(undefined1 *)*piVar8 = 0xff;
    iVar7 = piVar8[1];
    *piVar8 = *piVar8 + 1;
    piVar8[1] = iVar7 + -1;
    if (iVar7 + -1 == 0) {
      cVar5 = (*(code *)piVar8[3])();
      if (cVar5 == '\0') {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
        (**(code **)*unaff_ESI)();
      }
    }
    piVar8 = (int *)unaff_ESI[8];
    *(undefined1 *)*piVar8 = 0xdb;
    iVar7 = piVar8[1];
    *piVar8 = *piVar8 + 1;
    piVar8[1] = iVar7 + -1;
    if (iVar7 + -1 == 0) {
      cVar5 = (*(code *)piVar8[3])();
      if (cVar5 == '\0') {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
        (**(code **)*unaff_ESI)();
      }
    }
    piVar8 = (int *)unaff_ESI[8];
    *(undefined1 *)*piVar8 = 0;
    iVar7 = piVar8[1];
    *piVar8 = *piVar8 + 1;
    piVar8[1] = iVar7 + -1;
    if (iVar7 + -1 == 0) {
      cVar5 = (*(code *)piVar8[3])();
      if (cVar5 == '\0') {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
        (**(code **)*unaff_ESI)();
      }
    }
    piVar8 = (int *)unaff_ESI[8];
    *(byte *)*piVar8 = (-(cVar4 != '\0') & 0x40U) + 0x43;
    iVar7 = piVar8[1];
    *piVar8 = *piVar8 + 1;
    piVar8[1] = iVar7 + -1;
    if (iVar7 + -1 == 0) {
      cVar5 = (*(code *)piVar8[3])();
      if (cVar5 == '\0') {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
        (**(code **)*unaff_ESI)();
      }
    }
    piVar8 = (int *)unaff_ESI[8];
    *(char *)*piVar8 = cVar4 * '\x10' + (char)param_1;
    iVar7 = piVar8[1];
    *piVar8 = *piVar8 + 1;
    piVar8[1] = iVar7 + -1;
    if (iVar7 + -1 == 0) {
      cVar5 = (*(code *)piVar8[3])();
      if (cVar5 == '\0') {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
        (**(code **)*unaff_ESI)();
      }
    }
    piVar8 = &DAT_10191200;
    do {
      uVar1 = *(undefined2 *)(iVar2 + *piVar8 * 2);
      if (cVar4 != '\0') {
        piVar3 = (int *)unaff_ESI[8];
        *(char *)*piVar3 = (char)((ushort)uVar1 >> 8);
        iVar7 = piVar3[1];
        *piVar3 = *piVar3 + 1;
        piVar3[1] = iVar7 + -1;
        if (iVar7 + -1 == 0) {
          cVar5 = (*(code *)piVar3[3])();
          if (cVar5 == '\0') {
            *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
            (**(code **)*unaff_ESI)();
          }
        }
      }
      piVar3 = (int *)unaff_ESI[8];
      *(char *)*piVar3 = (char)uVar1;
      iVar7 = piVar3[1];
      *piVar3 = *piVar3 + 1;
      piVar3[1] = iVar7 + -1;
      if (iVar7 + -1 == 0) {
        cVar5 = (*(code *)piVar3[3])();
        if (cVar5 == '\0') {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
          (**(code **)*unaff_ESI)();
        }
      }
      piVar8 = piVar8 + 1;
    } while ((int)piVar8 < 0x10191300);
    *(undefined1 *)(iVar2 + 0x80) = 1;
  }
  return cVar4;
}


