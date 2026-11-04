
undefined4 FUN_00433a80(void)

{
  if ((DAT_010a44b8 != &DAT_010a44b4) && ((undefined4 *)DAT_010a44b8[1] == &DAT_010a44b4)) {
    if (*(int *)(*(int *)(*(int *)(DAT_010a44b8[2] + 8) + 0x50) + 8) == 0) {
      if ((undefined4 *)DAT_010a44b8[8] != (undefined4 *)0x0) {
        return *(undefined4 *)DAT_010a44b8[8];
      }
    }
    else {
      FUN_0047a5b0("Error: you cannot manipulate fixed size entities\n");
    }
    return 0;
  }
  FUN_0047a5b0("Error: you must have a single brush selected\n");
  return 0;
}

