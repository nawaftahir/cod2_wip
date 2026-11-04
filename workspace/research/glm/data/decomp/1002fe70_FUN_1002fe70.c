// 1002fe70 size=204 FUN_1002fe70

void FUN_1002fe70(undefined4 param_1,undefined4 param_2,undefined1 param_3)

{
  uint in_EAX;
  uint uVar1;
  undefined4 local_14;
  
  uVar1 = 0;
  if ((in_EAX & 2) != 0) {
    uVar1 = 2;
  }
  if ((in_EAX & 4) != 0) {
    uVar1 = uVar1 | 4;
  }
  if ((in_EAX & 1) != 0) {
    uVar1 = uVar1 | 1;
  }
  FUN_1003e8a0();
  DAT_1072debc = 1;
  FUN_1000f180();
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->Clear( 0, 0, clearFlags, nativeColor.packed, depth, stencil )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xac))(DAT_101d1bf8,0,0,uVar1,local_14,param_2,param_3);
  } while (DAT_1076a830 != 0);
  return;
}


