// 1000c910 size=87 FUN_1000c910

void FUN_1000c910(void)

{
  int *piVar1;
  undefined4 *unaff_ESI;
  
  if ((1 < *(byte *)(unaff_ESI + 3)) && (*(byte *)(unaff_ESI + 3) != 4)) {
    DAT_101d0a74 = DAT_101d0a74 - unaff_ESI[4];
    DAT_101d0a78 = DAT_101d0a78 - unaff_ESI[5];
  }
  piVar1 = (int *)unaff_ESI[1];
  if (piVar1 != (int *)0x0) {
    (**(code **)(*piVar1 + 8))(piVar1);
    unaff_ESI[1] = 0;
    unaff_ESI[4] = 0;
    unaff_ESI[5] = 0;
  }
  *unaff_ESI = 0;
  return;
}


