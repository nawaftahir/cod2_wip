// 10017f80 size=60 FUN_10017f80

void FUN_10017f80(undefined4 param_1)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  int unaff_EDI;
  
  iVar1 = in_EAX - unaff_EDI >> 2;
  for (iVar2 = iVar1 - (in_EAX - unaff_EDI >> 0x1f) >> 1; 0 < iVar2; iVar2 = iVar2 + -1) {
    FUN_10018080(iVar1,*(undefined4 *)(unaff_EDI + -4 + iVar2 * 4),param_1);
  }
  return;
}


