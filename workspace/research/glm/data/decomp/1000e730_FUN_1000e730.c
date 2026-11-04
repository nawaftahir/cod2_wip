// 1000e730 size=76 FUN_1000e730

void FUN_1000e730(int param_1,undefined4 param_2,code *param_3)

{
  int in_EAX;
  int iVar1;
  int unaff_EBX;
  int iVar2;
  
  while (param_1 < in_EAX) {
    iVar2 = (in_EAX + -1) / 2;
    iVar1 = (*param_3)(*(undefined4 *)(unaff_EBX + iVar2 * 4),param_2);
    if (iVar1 == 0) break;
    *(undefined4 *)(unaff_EBX + in_EAX * 4) = *(undefined4 *)(unaff_EBX + iVar2 * 4);
    in_EAX = iVar2;
  }
  *(undefined4 *)(unaff_EBX + in_EAX * 4) = param_2;
  return;
}


