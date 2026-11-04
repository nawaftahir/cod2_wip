// 10018080 size=103 FUN_10018080

void FUN_10018080(int param_1,undefined4 param_2,code *param_3)

{
  int iVar1;
  char cVar2;
  int in_EAX;
  int in_ECX;
  int iVar3;
  
  iVar1 = in_EAX;
  while( true ) {
    iVar3 = iVar1 * 2 + 2;
    if (param_1 <= iVar3) break;
    cVar2 = (*param_3)(*(undefined4 *)(in_ECX + iVar3 * 4),*(undefined4 *)(in_ECX + -4 + iVar3 * 4))
    ;
    if (cVar2 != '\0') {
      iVar3 = iVar1 * 2 + 1;
    }
    *(undefined4 *)(in_ECX + iVar1 * 4) = *(undefined4 *)(in_ECX + iVar3 * 4);
    iVar1 = iVar3;
  }
  if (iVar3 == param_1) {
    *(undefined4 *)(in_ECX + iVar1 * 4) = *(undefined4 *)(in_ECX + -4 + param_1 * 4);
  }
  FUN_10018140(in_EAX,param_2,param_3);
  return;
}


