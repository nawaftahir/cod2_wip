// 10028670 size=66 FUN_10028670

void FUN_10028670(undefined4 param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int in_EAX;
  int iVar3;
  int in_ECX;
  int iVar4;
  int iVar5;
  
  iVar3 = in_EAX - in_ECX >> 3;
  iVar5 = iVar3 - (in_EAX - in_ECX >> 0x1f) >> 1;
  if (0 < iVar5) {
    iVar4 = in_ECX + iVar5 * 8;
    do {
      puVar1 = (undefined4 *)(iVar4 + -4);
      puVar2 = (undefined4 *)(iVar4 + -8);
      iVar4 = iVar4 + -8;
      iVar5 = iVar5 + -1;
      FUN_100287b0(iVar3,*puVar2,*puVar1,param_1);
    } while (0 < iVar5);
  }
  return;
}


