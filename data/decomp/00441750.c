
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00441750(undefined4 param_1)

{
  int iVar1;
  undefined4 uVar2;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a1d0 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054957c,".\\TexWnd.cpp",0x2a6);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1d0 = '\x01';
    }
  }
  *(undefined4 *)(unaff_ESI + 0x10) = 8;
  *(undefined4 *)(unaff_ESI + 0x14) = 8;
  iVar1 = DAT_01233b64;
  *(undefined4 *)(unaff_ESI + 4) = 0xffffffff;
  iVar1 = *(int *)(iVar1 + 0x2d0);
  *(undefined4 *)(unaff_ESI + 0xc) = 0;
  *(undefined4 *)(unaff_ESI + 0x20) = 0;
  *(float *)(unaff_ESI + 0x28) = (float)iVar1 / _DAT_00556c8c;
  uVar2 = (*DAT_0059c414)(param_1);
  *(undefined4 *)(unaff_ESI + 0x24) = uVar2;
  return;
}

