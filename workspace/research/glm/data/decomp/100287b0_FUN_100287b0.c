// 100287b0 size=120 FUN_100287b0

void FUN_100287b0(int param_1,undefined4 param_2,undefined4 param_3,code *param_4)

{
  int iVar1;
  char cVar2;
  int in_EAX;
  int iVar3;
  int unaff_EDI;
  
  while( true ) {
    iVar3 = in_EAX * 2 + 2;
    if (param_1 <= iVar3) break;
    iVar1 = unaff_EDI + iVar3 * 8;
    cVar2 = (*param_4)(iVar1,iVar1 + -8);
    if (cVar2 != '\0') {
      iVar3 = in_EAX * 2 + 1;
    }
    *(undefined4 *)(unaff_EDI + in_EAX * 8) = *(undefined4 *)(unaff_EDI + iVar3 * 8);
    *(undefined4 *)(unaff_EDI + 4 + in_EAX * 8) = *(undefined4 *)(unaff_EDI + 4 + iVar3 * 8);
    in_EAX = iVar3;
  }
  if (iVar3 == param_1) {
    *(undefined4 *)(unaff_EDI + in_EAX * 8) = *(undefined4 *)(unaff_EDI + -8 + param_1 * 8);
    *(undefined4 *)(unaff_EDI + 4 + in_EAX * 8) = *(undefined4 *)(unaff_EDI + -4 + param_1 * 8);
  }
  FUN_10028890();
  return;
}


