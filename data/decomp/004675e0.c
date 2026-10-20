
void FUN_004675e0(int param_1)

{
  short *psVar1;
  int iVar2;
  int unaff_ESI;
  
  iVar2 = *(int *)(*(int *)(unaff_ESI + 8) + 0x50);
  if ((((iVar2 != 0) && (*(int *)(iVar2 + 8) != 0)) && (*(char **)(iVar2 + 0x158) != (char *)0x0))
     && (**(char **)(iVar2 + 0x158) != '\0')) {
    FUN_00465bf0(*(int *)(unaff_ESI + 8),"model",*(undefined4 *)(param_1 + 0x158));
    psVar1 = (short *)(*(int *)(unaff_ESI + 8) + 0x68);
    *psVar1 = *psVar1 + 1;
    *(undefined4 *)(*(int *)(unaff_ESI + 8) + 0x54) = 0;
    *(undefined1 *)(*(int *)(*(int *)(unaff_ESI + 8) + 0xc) + 0x40) = 0;
  }
  return;
}

