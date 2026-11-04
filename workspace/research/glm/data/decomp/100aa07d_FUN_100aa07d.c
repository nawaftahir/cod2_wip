// 100aa07d size=303 FUN_100aa07d

undefined4 FUN_100aa07d(int param_1,uint param_2,uint param_3,uint param_4,uint param_5,int param_6)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_10 = 0;
  if (param_2 != 0) {
    do {
      iVar1 = *(int *)(param_1 + local_10 * 4);
      if ((iVar1 != 0) && (local_c = 0, *(int *)(iVar1 + 4) != 0)) {
        do {
          iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(*(int *)(iVar1 + 8) + local_c * 4) * 4
                          );
          if ((*(int *)(iVar2 + 4) == *(int *)(in_ECX + 0x80)) &&
             (((*(int *)(iVar2 + 0x3c) != 0 && ((*(uint *)(iVar2 + 0x6c) & 0xff) == param_3)) &&
              (param_4 == *(byte *)(iVar2 + 0x6d))))) {
            local_8 = 0;
            if (param_5 != 0) {
              do {
                if (*(int *)(iVar2 + 0x10) ==
                    *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(param_6 + local_8 * 4) * 4)
                            + 0x10)) {
                  iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,*(int *)(iVar2 + 0x10),0);
                  if (iVar4 == -1) {
                    return 0x8007000e;
                  }
                  iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                  *(undefined4 *)(iVar3 + 0x3c) = *(undefined4 *)(iVar2 + 0x3c);
                  *(undefined4 *)(iVar3 + 0x38) = *(undefined4 *)(param_6 + local_8 * 4);
                  *(int *)(*(int *)(iVar1 + 8) + local_c * 4) = iVar4;
                  break;
                }
                local_8 = local_8 + 1;
              } while (local_8 < param_5);
            }
            if (local_8 == param_5) {
              FUN_1008b0b5();
              return 0x80004005;
            }
          }
          local_c = local_c + 1;
        } while (local_c < *(uint *)(iVar1 + 4));
      }
      local_10 = local_10 + 1;
    } while (local_10 < param_2);
  }
  return 0;
}


