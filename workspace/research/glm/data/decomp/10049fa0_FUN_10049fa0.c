// 10049fa0 size=393 FUN_10049fa0

void FUN_10049fa0(void)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *unaff_ESI;
  
  iVar1 = unaff_ESI[0xb];
  if (iVar1 == 1) {
    unaff_ESI[0xc] = 1;
    unaff_ESI[0xd] = 1;
    goto LAB_1004a0e3;
  }
  if (iVar1 != 3) {
    if (iVar1 == 4) {
      if (((char)unaff_ESI[0x44] == '\0') || (*(char *)((int)unaff_ESI + 0x111) == '\0')) {
        unaff_ESI[0xc] = 4;
        unaff_ESI[0xd] = 4;
      }
      else {
        if (*(char *)((int)unaff_ESI + 0x111) != '\x02') {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x72;
          *(uint *)(*unaff_ESI + 0x18) = (uint)*(byte *)((int)unaff_ESI + 0x111);
          (**(code **)(*unaff_ESI + 4))();
        }
        unaff_ESI[0xc] = 5;
        unaff_ESI[0xd] = 4;
      }
    }
    else {
      unaff_ESI[0xc] = 0;
      unaff_ESI[0xd] = 0;
    }
    goto LAB_1004a0e3;
  }
  if ((char)unaff_ESI[0x42] == '\0') {
    if ((char)unaff_ESI[0x44] == '\0') {
      piVar2 = (int *)unaff_ESI[0x33];
      iVar1 = *piVar2;
      iVar3 = piVar2[0x15];
      iVar4 = piVar2[0x2a];
      if (iVar1 == 1) {
        if ((iVar3 == 2) && (iVar4 == 3)) {
          unaff_ESI[0xc] = 3;
          unaff_ESI[0xd] = 2;
          goto LAB_1004a0e3;
        }
      }
      else if (((iVar1 == 0x52) && (iVar3 == 0x47)) && (iVar4 == 0x42)) goto LAB_1004a060;
      iVar5 = *unaff_ESI;
      *(int *)(iVar5 + 0x18) = iVar1;
      *(int *)(iVar5 + 0x1c) = iVar3;
      *(int *)(iVar5 + 0x20) = iVar4;
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x6f;
      (**(code **)(*unaff_ESI + 4))();
    }
    else {
      if (*(char *)((int)unaff_ESI + 0x111) == '\0') {
LAB_1004a060:
        unaff_ESI[0xc] = 2;
        unaff_ESI[0xd] = 2;
        goto LAB_1004a0e3;
      }
      if (*(char *)((int)unaff_ESI + 0x111) != '\x01') {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x72;
        *(uint *)(*unaff_ESI + 0x18) = (uint)*(byte *)((int)unaff_ESI + 0x111);
        (**(code **)(*unaff_ESI + 4))();
      }
    }
  }
  unaff_ESI[0xc] = 3;
  unaff_ESI[0xd] = 2;
LAB_1004a0e3:
  unaff_ESI[0x10] = 0;
  unaff_ESI[0x11] = 0x3ff00000;
  *(undefined1 *)(unaff_ESI + 0x12) = 0;
  *(undefined1 *)((int)unaff_ESI + 0x49) = 0;
  unaff_ESI[0x13] = 0;
  *(undefined1 *)((int)unaff_ESI + 0x52) = 0;
  unaff_ESI[0x1f] = 0;
  *(undefined1 *)(unaff_ESI + 0x18) = 0;
  *(undefined1 *)((int)unaff_ESI + 0x61) = 0;
  *(undefined1 *)((int)unaff_ESI + 0x62) = 0;
  unaff_ESI[0xe] = 1;
  unaff_ESI[0xf] = 1;
  *(undefined1 *)(unaff_ESI + 0x14) = 1;
  *(undefined1 *)((int)unaff_ESI + 0x51) = 1;
  unaff_ESI[0x15] = 2;
  *(undefined1 *)(unaff_ESI + 0x16) = 1;
  unaff_ESI[0x17] = 0x100;
  return;
}


