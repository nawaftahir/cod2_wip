// 10012820 size=91 FUN_10012820

undefined4 FUN_10012820(void)

{
  if (DAT_101d1bf4 == 0) {
    (*(code *)RI_Printf)(0,"Getting Direct3D 9 interface...\n");
    DAT_101d1bf4 = Direct3DCreate9(0x20);
    if (DAT_101d1bf4 == 0) {
      (*(code *)RI_Printf)(0,"Direct3D 9 failed to initialize\n");
      return 0;
    }
  }
  DAT_101d1bfc = FUN_100127d0();
  FUN_10011900();
  FUN_100123d0();
  return 1;
}


