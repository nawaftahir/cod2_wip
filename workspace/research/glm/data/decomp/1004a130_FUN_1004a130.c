// 1004a130 size=147 FUN_1004a130

int FUN_1004a130(char param_1)

{
  int iVar1;
  int *unaff_ESI;
  
  if ((unaff_ESI[5] != 200) && (unaff_ESI[5] != 0xc9)) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x14;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[5];
    (**(code **)*unaff_ESI)();
  }
  iVar1 = FUN_1004a1d0();
  if (iVar1 == 1) {
    iVar1 = 1;
  }
  else if (iVar1 == 2) {
    if (param_1 != '\0') {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x33;
      (**(code **)*unaff_ESI)();
    }
    if (unaff_ESI[1] != 0) {
      (**(code **)(unaff_ESI[1] + 0x24))();
      if ((char)unaff_ESI[4] != '\0') {
        unaff_ESI[5] = 200;
        unaff_ESI[0x45] = 0;
        return 2;
      }
      unaff_ESI[5] = 100;
    }
    return 2;
  }
  return iVar1;
}


