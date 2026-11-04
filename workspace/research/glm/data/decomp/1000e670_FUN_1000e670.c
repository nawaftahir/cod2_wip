// 1000e670 size=103 FUN_1000e670

void FUN_1000e670(int param_1,undefined4 param_2,code *param_3)

{
  int iVar1;
  int in_EAX;
  int iVar2;
  int in_ECX;
  int iVar3;
  
  iVar1 = in_EAX;
  while( true ) {
    iVar3 = iVar1 * 2 + 2;
    if (param_1 <= iVar3) break;
    iVar2 = (*param_3)(*(undefined4 *)(in_ECX + iVar3 * 4),*(undefined4 *)(in_ECX + -4 + iVar3 * 4))
    ;
    if (iVar2 != 0) {
      iVar3 = iVar1 * 2 + 1;
    }
    *(undefined4 *)(in_ECX + iVar1 * 4) = *(undefined4 *)(in_ECX + iVar3 * 4);
    iVar1 = iVar3;
  }
  if (iVar3 == param_1) {
    *(undefined4 *)(in_ECX + iVar1 * 4) = *(undefined4 *)(in_ECX + -4 + param_1 * 4);
  }
  FUN_1000e730(in_EAX,param_2,param_3);
  return;
}


