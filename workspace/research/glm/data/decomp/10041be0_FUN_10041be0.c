// 10041be0 size=188 FUN_10041be0

void FUN_10041be0(void)

{
  int *unaff_ESI;
  
  if (unaff_ESI[5] != 0x65) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x14;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[5];
    (**(code **)*unaff_ESI)();
  }
  if ((uint)unaff_ESI[10] <= (uint)unaff_ESI[0x36]) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x7b;
    (**(code **)(*unaff_ESI + 4))();
  }
  if (unaff_ESI[2] != 0) {
    *(int *)(unaff_ESI[2] + 4) = unaff_ESI[0x36];
    *(int *)(unaff_ESI[2] + 8) = unaff_ESI[10];
    (**(code **)unaff_ESI[2])();
  }
  if (*(char *)(unaff_ESI[0x51] + 0xc) != '\0') {
    (**(code **)(unaff_ESI[0x51] + 4))();
  }
  (**(code **)(unaff_ESI[0x52] + 4))();
  unaff_ESI[0x36] = unaff_ESI[0x36];
  return;
}


