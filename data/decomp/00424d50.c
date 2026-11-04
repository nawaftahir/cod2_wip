
void FUN_00424d50(void)

{
  int *piVar1;
  LRESULT LVar2;
  LRESULT LVar3;
  int iVar4;
  int unaff_ESI;
  
  *(undefined4 *)(unaff_ESI + 0x2fc) = 0;
  *(undefined4 *)(unaff_ESI + 0x2f8) = 0;
  *(undefined4 *)(unaff_ESI + 0x308) = 0;
  *(undefined4 *)(unaff_ESI + 0x304) = 0;
  *(undefined4 *)(unaff_ESI + 0x300) = 0;
  if (*(int *)(unaff_ESI + 0x70) != 0) {
    LVar2 = SendMessageA(*(HWND *)(unaff_ESI + 0x270),0x147,0,0);
    LVar3 = SendMessageA(*(HWND *)(unaff_ESI + 0x2c0),0x147,0,0);
    if ((((-1 < LVar2) && (piVar1 = *(int **)(unaff_ESI + 0x70), LVar2 < piVar1[1])) && (-1 < LVar3)
        ) && (LVar3 < *piVar1)) {
      iVar4 = LVar3 * 0x10 + LVar2;
      *(int *)(unaff_ESI + 0x300) = piVar1[iVar4 * 0xe + 9];
      *(int *)(unaff_ESI + 0x304) = piVar1[iVar4 * 0xe + 10];
      *(int *)(unaff_ESI + 0x308) = piVar1[iVar4 * 0xe + 0xb];
      *(int *)(unaff_ESI + 0x2f8) = piVar1[(DAT_01128d94 + iVar4 * 7) * 2 + 0xc];
      *(int *)(unaff_ESI + 0x2fc) = piVar1[(iVar4 * 7 + DAT_01128d94) * 2 + 0xd];
    }
  }
  FUN_004fc069(0);
  return;
}

