// 10086858 size=65 FUN_10086858

uint FUN_10086858(void)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int in_EAX;
  int in_ECX;
  int in_EDX;
  
  iVar2 = *(int *)(*(int *)(in_EAX + 0xbc) + 0x58);
  iVar1 = iVar2 + in_ECX * 0xc;
  iVar2 = iVar2 + in_EDX * 0xc;
  uVar3 = *(uint *)(iVar1 + 4);
  uVar4 = *(uint *)(iVar2 + 4);
  if (uVar4 <= uVar3) {
    if (uVar4 < uVar3) {
      return 1;
    }
    iVar1 = *(int *)(iVar1 + 8);
    iVar2 = *(int *)(iVar2 + 8);
    if (iVar2 <= iVar1) {
      return (uint)(iVar2 < iVar1);
    }
  }
  return 0xffffffff;
}


