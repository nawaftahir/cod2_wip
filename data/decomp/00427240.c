
void FUN_00427240(void)

{
  int in_EAX;
  undefined4 uVar1;
  
  FUN_00427160(DAT_01128d94);
  if (*(void **)(in_EAX + 0x3824) != (void *)0x0) {
    _free(*(void **)(in_EAX + 0x3824));
  }
  uVar1 = FUN_004267d0(DAT_01128d94,0,0);
  *(short *)(in_EAX + 0x382c) = *(short *)(in_EAX + 0x382c) + 1;
  *(undefined4 *)(in_EAX + 0x3824) = uVar1;
  return;
}

