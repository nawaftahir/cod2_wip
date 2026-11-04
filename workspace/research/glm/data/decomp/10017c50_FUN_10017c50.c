// 10017c50 size=61 FUN_10017c50

void FUN_10017c50(void)

{
  undefined4 uVar1;
  int in_EAX;
  int iVar2;
  undefined4 *unaff_EDI;
  
  for (iVar2 = in_EAX - (int)unaff_EDI; 1 < iVar2 >> 2; iVar2 = iVar2 + -4) {
    uVar1 = *(undefined4 *)((int)unaff_EDI + iVar2 + -4);
    *(undefined4 *)((int)unaff_EDI + iVar2 + -4) = *unaff_EDI;
    FUN_10018080(iVar2 + -4 >> 2,uVar1);
  }
  return;
}


