// 10056d80 size=132 FUN_10056d80

void FUN_10056d80(void)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  int *unaff_EDI;
  
  puVar1 = (undefined4 *)(**(code **)unaff_EDI[1])();
  iVar3 = 0;
  *puVar1 = 0;
  puVar1[1] = 0x1f;
  puVar1[2] = 0;
  puVar1[3] = 0x3f;
  puVar1[4] = 0;
  puVar1[5] = 0x1f;
  FUN_100566a0(puVar1);
  iVar2 = FUN_10056a90();
  if (0 < iVar2) {
    do {
      FUN_10056c00();
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar2);
  }
  unaff_EDI[0x1e] = iVar2;
  *(undefined4 *)(*unaff_EDI + 0x14) = 0x60;
  *(int *)(*unaff_EDI + 0x18) = iVar2;
  (**(code **)(*unaff_EDI + 4))();
  return;
}


