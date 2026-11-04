
void FUN_0041e780(void)

{
  int *piVar1;
  undefined4 *in_EAX;
  undefined4 *puVar2;
  int unaff_EBX;
  
  puVar2 = (undefined4 *)FUN_004ff450(0xc);
  if (puVar2 == (undefined4 *)0x0) {
    puVar2 = (undefined4 *)0x0;
  }
  else {
    *puVar2 = *in_EAX;
    puVar2[1] = in_EAX[1];
    puVar2[2] = in_EAX[2];
  }
  piVar1 = (int *)(unaff_EBX + 4);
  if (*(int *)(unaff_EBX + 0x10) == 0) {
    FUN_0041e440();
  }
  if (*piVar1 == *(int *)(unaff_EBX + 8)) {
    FUN_0041e440();
  }
  *(undefined4 **)(*(int *)(unaff_EBX + 0x10) + *piVar1 * 4) = puVar2;
  *piVar1 = *piVar1 + 1;
  *(undefined1 *)(unaff_EBX + 0x6d) = 1;
  return;
}

