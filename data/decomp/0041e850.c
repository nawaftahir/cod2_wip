
void FUN_0041e850(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int *piVar1;
  undefined4 *puVar2;
  int unaff_EBX;
  
  puVar2 = (undefined4 *)FUN_004ff450(0xc);
  if (puVar2 == (undefined4 *)0x0) {
    puVar2 = (undefined4 *)0x0;
  }
  else {
    *puVar2 = param_1;
    puVar2[1] = param_2;
    puVar2[2] = param_3;
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

