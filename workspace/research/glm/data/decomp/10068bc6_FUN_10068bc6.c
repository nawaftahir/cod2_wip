// 10068bc6 size=54 FUN_10068bc6

undefined4 * FUN_10068bc6(LPCSTR param_1)

{
  int iVar1;
  int in_ECX;
  undefined4 *puVar2;
  
  iVar1 = FUN_10068b85(param_1);
  puVar2 = *(undefined4 **)(in_ECX + iVar1 * 4);
  while( true ) {
    if (puVar2 == (undefined4 *)0x0) {
      return (undefined4 *)0x0;
    }
    iVar1 = lstrcmpiA((LPCSTR)*puVar2,param_1);
    if (iVar1 == 0) break;
    puVar2 = (undefined4 *)puVar2[8];
  }
  return puVar2;
}


