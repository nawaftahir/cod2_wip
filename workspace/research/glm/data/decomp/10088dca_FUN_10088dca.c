// 10088dca size=422 FUN_10088dca

int FUN_10088dca(int param_1)

{
  uint uVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  int in_ECX;
  undefined4 *local_c;
  uint local_8;
  
  iVar3 = FUN_10086292(param_1);
  if (iVar3 == -1) {
    return -0x7ff8fff2;
  }
  iVar3 = *(int *)(*(int *)(in_ECX + 0x18) + iVar3 * 4);
  FUN_100853b0();
  uVar1 = *(uint *)(param_1 + 0xc);
  local_8 = 0;
  if (uVar1 != 0) {
    local_c = *(undefined4 **)(param_1 + 0x10);
    uVar5 = *local_c;
    do {
      iVar4 = FUN_100883d0(uVar5,*local_c);
      if (iVar4 == 0) break;
      local_8 = local_8 + 1;
      local_c = local_c + 1;
    } while (local_8 < uVar1);
  }
  if (local_8 != uVar1) {
    iVar4 = FUN_10086199(uVar1 & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
    if (iVar4 == -1) {
      return -0x7ff8fff2;
    }
    puVar2 = *(undefined4 **)(*(int *)(in_ECX + 0x18) + iVar4 * 4);
    FUN_100853b0();
    local_8 = 0;
    if (*(int *)(iVar3 + 0xc) != 0) {
      do {
        iVar4 = local_8 * 4;
        *(undefined4 *)(iVar4 + puVar2[4]) = *(undefined4 *)(iVar4 + *(int *)(iVar3 + 0x10));
        uVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0xffffffff,0xffffffff,0);
        *(undefined4 *)(iVar4 + puVar2[2]) = uVar5;
        *(undefined4 *)(iVar4 + *(int *)(iVar3 + 0x10)) = *(undefined4 *)(iVar4 + puVar2[2]);
        if (*(int *)(iVar4 + *(int *)(iVar3 + 0x10)) == -1) {
          return -0x7ff8fff2;
        }
        FUN_10085d21();
        *(undefined4 *)
         (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + *(int *)(iVar3 + 0x10)) * 4) + 0x14) =
             *(undefined4 *)
              (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + *(int *)(param_1 + 0x10)) * 4) +
              0x14);
        local_8 = local_8 + 1;
        *(undefined4 *)
         (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + *(int *)(iVar3 + 0x10)) * 4) + 0x18) =
             *(undefined4 *)
              (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + *(int *)(param_1 + 0x10)) * 4) +
              0x18);
        **(undefined4 **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + *(int *)(iVar3 + 0x10)) * 4) =
             **(undefined4 **)
               (*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + *(int *)(param_1 + 0x10)) * 4);
      } while (local_8 < *(uint *)(iVar3 + 0xc));
    }
    iVar3 = FUN_10088517();
    if (iVar3 < 0) {
      return iVar3;
    }
    *puVar2 = 0;
  }
  return 0;
}


