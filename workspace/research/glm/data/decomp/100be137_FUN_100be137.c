// 100be137 size=81 FUN_100be137

undefined4 FUN_100be137(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  int iVar4;
  uint uVar5;
  
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      iVar2 = *(int *)(iVar1 + 0x38);
      if (iVar2 != -1) {
        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
        iVar4 = iVar2;
        while (*(int *)(iVar3 + 0x38) != -1) {
          *(uint *)(iVar1 + 0x3c) = *(uint *)(iVar1 + 0x3c) | *(uint *)(iVar3 + 0x3c);
          iVar4 = *(int *)(iVar3 + 0x38);
          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
        }
        if (iVar2 != iVar4) {
          *(int *)(iVar1 + 0x38) = iVar4;
          FUN_10085d21(iVar3);
        }
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  return 0;
}


