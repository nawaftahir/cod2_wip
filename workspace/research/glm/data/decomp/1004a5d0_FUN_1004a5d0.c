// 1004a5d0 size=154 FUN_1004a5d0

undefined4 FUN_1004a5d0(void)

{
  int *unaff_ESI;
  
  if (unaff_ESI[5] != 0xcd) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x14;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[5];
    (**(code **)*unaff_ESI)();
  }
  if ((uint)unaff_ESI[0x1a] <= (uint)unaff_ESI[0x20]) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x7b;
    (**(code **)(*unaff_ESI + 4))();
    return 0;
  }
  if (unaff_ESI[2] != 0) {
    *(int *)(unaff_ESI[2] + 4) = unaff_ESI[0x20];
    *(int *)(unaff_ESI[2] + 8) = unaff_ESI[0x1a];
    (**(code **)unaff_ESI[2])();
  }
  (**(code **)(unaff_ESI[99] + 4))();
  unaff_ESI[0x20] = unaff_ESI[0x20];
  return 0;
}


