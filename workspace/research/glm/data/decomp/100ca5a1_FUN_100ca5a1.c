// 100ca5a1 size=158 FUN_100ca5a1

undefined4 FUN_100ca5a1(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  int in_ECX;
  int local_14 [4];
  
  local_14[3] = 0;
  iVar2 = *(int *)(in_ECX + 0x100);
  local_14[2] = 0;
  iVar3 = *(int *)(in_ECX + 0x10);
  do {
    iVar4 = *(int *)(local_14[2] + *(int *)(iVar2 + 0x10));
    iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
    if (((*(byte *)(*(int *)(iVar3 + *(int *)(iVar5 + 4) * 4) + 4) & 1) == 0) ||
       (*(int *)(iVar5 + 0x5c) != 0)) {
      piVar1 = local_14 + local_14[3];
      local_14[3] = local_14[3] + 1;
      *piVar1 = iVar4;
    }
    local_14[2] = local_14[2] + 4;
  } while ((uint)local_14[2] < 8);
  if (local_14[3] == 0) {
    uVar6 = 0;
  }
  else {
    uVar6 = FUN_100c9a7f(0x25,local_14,local_14[3],*(undefined4 *)(iVar2 + 8),
                         -(uint)(*(int *)(in_ECX + 0x18c) != 0) & in_ECX + 400U,
                         -(uint)(*(int *)(in_ECX + 0x18c) != 0) & in_ECX + 0x1a0U,4,0,0,0,0);
  }
  return uVar6;
}


