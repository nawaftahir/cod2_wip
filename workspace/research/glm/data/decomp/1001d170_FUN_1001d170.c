// 1001d170 size=100 FUN_1001d170

void FUN_1001d170(undefined4 param_1)

{
  int iVar1;
  int in_EAX;
  int in_ECX;
  undefined4 *puVar2;
  int iVar3;
  
  iVar1 = (in_EAX - in_ECX) / 0xc;
  iVar3 = iVar1 / 2;
  if (0 < iVar3) {
    puVar2 = (undefined4 *)(in_ECX + iVar3 * 0xc);
    do {
      iVar3 = iVar3 + -1;
      FUN_1001d320(iVar1,puVar2[-3],puVar2[-2],puVar2[-1],param_1);
      puVar2 = puVar2 + -3;
    } while (0 < iVar3);
  }
  return;
}


