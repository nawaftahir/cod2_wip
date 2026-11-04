// 10055840 size=160 FUN_10055840

void FUN_10055840(void)

{
  undefined4 *puVar1;
  int *unaff_EDI;
  
  unaff_EDI[1] = 0;
  puVar1 = (undefined4 *)(*(code *)unaff_EDI[6])(0x54);
  if (puVar1 == (undefined4 *)0x0) {
    *(undefined4 *)(*unaff_EDI + 0x14) = 0x36;
    *(undefined4 *)(*unaff_EDI + 0x18) = 0;
    (**(code **)*unaff_EDI)();
  }
  puVar1[0xb] = 0;
  *puVar1 = FUN_10054d40;
  puVar1[1] = FUN_10054e90;
  puVar1[2] = FUN_10054f50;
  puVar1[3] = FUN_10055000;
  puVar1[4] = FUN_100550b0;
  puVar1[5] = FUN_10055120;
  puVar1[6] = FUN_10055190;
  puVar1[7] = &LAB_10055440;
  puVar1[8] = &LAB_10055590;
  puVar1[9] = FUN_100556f0;
  puVar1[10] = &LAB_10055800;
  puVar1[0xc] = 1000000000;
  puVar1[0xe] = 0;
  puVar1[0x10] = 0;
  puVar1[0xd] = 0;
  puVar1[0xf] = 0;
  puVar1[0x11] = 0;
  puVar1[0x12] = 0;
  puVar1[0x13] = 0x54;
  unaff_EDI[1] = (int)puVar1;
  return;
}


