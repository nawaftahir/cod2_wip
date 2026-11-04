// 1001f610 size=152 FUN_1001f610

void FUN_1001f610(int param_1)

{
  undefined4 *unaff_EBX;
  int iVar1;
  int *piVar2;
  
  iVar1 = param_1 * 0xa000;
  FUN_1001f5b0();
  piVar2 = (int *)*unaff_EBX;
  param_1 = 0;
  if (*(char *)(unaff_EBX + 7) != '\0') {
    do {
      if (*piVar2 == 3) {
        FUN_1001f030();
        piVar2 = piVar2 + 4;
      }
      else if (*piVar2 == 5) {
        piVar2 = piVar2 + 4;
      }
      else {
        FUN_1001ee70(&DAT_101daa00 +
                     (int)*(short *)(piVar2[1] + 6) +
                     (uint)*(byte *)((int)unaff_EBX + param_1 + 0x1e) * 0x40 + iVar1,
                     *(undefined4 *)(unaff_EBX[1] + 0x38));
        piVar2 = piVar2 + 0xe;
      }
      param_1 = param_1 + 1;
    } while (param_1 < (int)(uint)*(byte *)(unaff_EBX + 7));
  }
  return;
}


