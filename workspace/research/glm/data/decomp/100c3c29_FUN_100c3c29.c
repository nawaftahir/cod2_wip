// 100c3c29 size=355 FUN_100c3c29

int FUN_100c3c29(int param_1,uint param_2,uint param_3)

{
  int iVar1;
  int *piVar2;
  int in_ECX;
  uint uVar3;
  int local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  iVar1 = FUN_10085814(0x74);
  if (iVar1 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_10085379();
  }
  if (local_8 == 0) {
    iVar1 = -0x7ff8fff2;
  }
  else {
    local_c = 0;
    if (param_3 != 0) {
      piVar2 = *(int **)(*(int *)(in_ECX + 0x100) + 0x10);
      uVar3 = param_3;
      do {
        if (*(int *)(param_1 + *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar2 * 4) + 0x10) * 4)
            != -1) {
          local_c = local_c + 1;
        }
        piVar2 = piVar2 + 1;
        uVar3 = uVar3 - 1;
      } while (uVar3 != 0);
    }
    iVar1 = FUN_1008585f(**(uint **)(in_ECX + 0x100) & 0xfff00000 | local_c,local_c * param_2,
                         local_c,0);
    if ((-1 < iVar1) && (iVar1 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100)), -1 < iVar1)) {
      local_10 = 0;
      if (param_2 != 0) {
        do {
          uVar3 = 0;
          local_14 = 0;
          if (param_3 != 0) {
            do {
              if (*(int *)(param_1 +
                          *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                           *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 0x10) +
                                                   uVar3 * 4) * 4) + 0x10) * 4) != -1) {
                *(undefined4 *)(*(int *)(local_8 + 8) + (local_10 * local_c + local_14) * 4) =
                     *(undefined4 *)
                      (*(int *)(*(int *)(in_ECX + 0x100) + 8) + (local_10 * param_3 + uVar3) * 4);
                if (local_10 == 0) {
                  *(undefined4 *)(*(int *)(local_8 + 0x10) + local_14 * 4) =
                       *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x100) + 0x10) + uVar3 * 4);
                }
                local_14 = local_14 + 1;
              }
              uVar3 = uVar3 + 1;
            } while (uVar3 < param_3);
          }
          local_10 = local_10 + 1;
        } while (local_10 < param_2);
      }
      iVar1 = FUN_10086026(local_8);
      if (-1 < iVar1) {
        local_8 = 0;
        iVar1 = 0;
      }
    }
    if (local_8 != 0) {
      FUN_1006c418(1);
    }
  }
  return iVar1;
}


