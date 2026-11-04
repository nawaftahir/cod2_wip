
void __fastcall FUN_004269d0(int param_1)

{
  char in_AL;
  undefined4 uVar1;
  undefined4 extraout_EDX;
  undefined1 local_1c [24];
  
  if (in_AL != '\0') {
    if (*(char *)(param_1 + 0x382f) != '\0') {
      uVar1 = *(undefined4 *)(param_1 + 0x3834);
      if ((*(byte *)(param_1 + 0x10) & 0x40) == 0) {
        FUN_00426f20(param_1,uVar1);
      }
      else {
        FUN_00426e80(1);
      }
      *(undefined1 *)(param_1 + 0x382f) = 1;
      *(undefined4 *)(param_1 + 0x3834) = uVar1;
    }
    FUN_00426280(1);
    FUN_00426480(*(undefined4 *)(param_1 + 0x3828),local_1c,extraout_EDX);
  }
  if (*(void **)(param_1 + 0x3824) != (void *)0x0) {
    _free(*(void **)(param_1 + 0x3824));
  }
  uVar1 = FUN_004267d0(DAT_01128d94,0,0);
  *(short *)(param_1 + 0x382c) = *(short *)(param_1 + 0x382c) + 1;
  *(undefined4 *)(param_1 + 0x3824) = uVar1;
  return;
}

