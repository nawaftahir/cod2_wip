// 100af759 size=333 FUN_100af759

int FUN_100af759(void)

{
  undefined4 *puVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int in_ECX;
  undefined4 *puVar5;
  int *piVar6;
  undefined4 *puVar7;
  undefined4 local_48 [4];
  undefined4 local_38 [4];
  undefined1 local_28 [16];
  int *local_18;
  undefined1 *local_14;
  int local_10;
  int *local_c;
  int local_8;
  
  iVar4 = *(int *)(in_ECX + 0x100);
  local_18 = *(int **)(*(int *)(in_ECX + 0x100) + 0x10);
  local_8 = *(int *)(*(int *)(in_ECX + 0x100) + 0xc);
  uVar3 = 0;
  do {
    *(undefined4 *)((int)local_48 + uVar3) = *(undefined4 *)(*(int *)(iVar4 + 8) + 0xc);
    *(undefined4 *)((int)local_38 + uVar3) = *(undefined4 *)(*(int *)(iVar4 + 8) + 0x1c);
    uVar3 = uVar3 + 4;
  } while (uVar3 < 0x10);
  iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *local_18 * 4);
  if (*(int *)(iVar4 + 4) == *(int *)(in_ECX + 0x84)) {
    iVar2 = local_8;
    if (*(int *)(iVar4 + 0x6c) != 1) {
      FUN_1008b0b5();
      return -0x7fffbffb;
    }
    for (; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_18 * 4) + 0xc) = 0;
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_18 * 4) + 4) =
           *(undefined4 *)(in_ECX + 0x88);
    }
  }
  if (local_8 != 0) {
    local_14 = local_28 + -(int)local_18;
    piVar6 = local_18;
    local_10 = local_8;
    do {
      local_c = piVar6;
      iVar4 = FUN_10086139(0,0,0,0);
      local_c = local_c + 1;
      *(int *)(local_14 + (int)piVar6) = iVar4;
      puVar1 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
      puVar5 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
      puVar7 = puVar1;
      for (iVar4 = 0x20; iVar4 != 0; iVar4 = iVar4 + -1) {
        *puVar7 = *puVar5;
        puVar5 = puVar5 + 1;
        puVar7 = puVar7 + 1;
      }
      puVar1[0xf] = 0;
      local_10 = local_10 + -1;
      piVar6 = local_c;
    } while (local_10 != 0);
    local_10 = 0;
  }
  piVar6 = local_18;
  iVar4 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
  iVar4 = FUN_100c9a7f(8,local_28,local_8,iVar4,iVar4 + 0x10,0,2,0,0,0,0);
  if (-1 < iVar4) {
    iVar4 = FUN_100c9a7f(4,piVar6,local_8,local_48,local_38,local_28,local_8,0,0,0,0);
  }
  return iVar4;
}


