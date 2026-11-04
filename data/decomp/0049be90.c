
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0049be90(void)

{
  float fVar1;
  int unaff_ESI;
  undefined4 unaff_EDI;
  
  (**(code **)(**(int **)(unaff_ESI + 0x18) + 0x20))();
  (**(code **)(**(int **)(unaff_ESI + 0x18) + 0x28))();
  FUN_0049b7a0(unaff_ESI);
  fVar1 = _DAT_00556a70 * _DAT_00556a5c;
  *(undefined4 *)(unaff_ESI + 0x40) = 0x42b40000;
  *(undefined4 *)(unaff_ESI + 0x44) = 0x42b40000;
  *(float *)(unaff_ESI + 0x50) = fVar1;
  *(undefined4 *)(unaff_ESI + 0x48) = unaff_EDI;
  *(undefined4 *)(unaff_ESI + 0x60) = unaff_EDI;
  *(undefined1 *)(unaff_ESI + 0x14) = 1;
  return;
}

