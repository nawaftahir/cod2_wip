// 1009a1e0 size=69 FUN_1009a1e0

undefined4 FUN_1009a1e0(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  
  iVar2 = *(int *)(in_ECX + 0x10);
  while( true ) {
    if (iVar2 == 0) {
      return param_1;
    }
    iVar1 = *(int *)(iVar2 + 0x10);
    if (((iVar1 == 2) || (iVar1 == 3)) || (iVar1 == 4)) break;
    iVar2 = *(int *)(iVar2 + 0x20);
  }
  FUN_100994dd();
  return 0;
}


