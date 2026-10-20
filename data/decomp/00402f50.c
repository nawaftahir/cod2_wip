
void FUN_00402f50(void)

{
  int iVar1;
  CWnd *unaff_ESI;
  CWnd *pCVar2;
  
  CWnd::CWnd(unaff_ESI);
  *(undefined ***)unaff_ESI = &PTR_LAB_0053eb24;
  *(undefined4 *)(unaff_ESI + 0x50) = 0;
  pCVar2 = unaff_ESI + 0x54;
  for (iVar1 = 0x1f; iVar1 != 0; iVar1 = iVar1 + -1) {
    *(undefined4 *)pCVar2 = 0;
    pCVar2 = pCVar2 + 4;
  }
  *(undefined4 *)(unaff_ESI + 0x7c) = 0x3e99999a;
  *(undefined4 *)(unaff_ESI + 0x80) = 0x3e99999a;
  *(undefined4 *)(unaff_ESI + 0x84) = 0x3e99999a;
  unaff_ESI[0x11c] = (CWnd)0x0;
  *(undefined4 *)(unaff_ESI + 0x120) = 0;
  *(undefined4 *)(unaff_ESI + 0x124) = 0;
  unaff_ESI[0x128] = (CWnd)0x1;
  *(undefined4 *)(unaff_ESI + 0x5c) = 0;
  *(undefined4 *)(unaff_ESI + 0x60) = 0;
  *(undefined4 *)(unaff_ESI + 100) = 0x41a00000;
  *(undefined4 *)(unaff_ESI + 0x68) = 0x42380000;
  return;
}

