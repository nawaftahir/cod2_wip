// 100a9f26 size=343 FUN_100a9f26

undefined4 FUN_100a9f26(int param_1,uint param_2,uint param_3,uint param_4,uint param_5,int param_6)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  int extraout_ECX;
  uint uVar5;
  undefined8 uVar6;
  uint local_14;
  int local_10;
  uint local_8;
  
  local_14 = 0;
  if (param_2 != 0) {
    do {
      piVar1 = *(int **)(param_1 + local_14 * 4);
      if ((piVar1 != (int *)0x0) && (*piVar1 != 0)) {
        uVar6 = FUN_100a6e19();
        iVar4 = (int)((ulonglong)uVar6 >> 0x20);
        local_10 = (int)uVar6;
        if (extraout_ECX == 0x11000000) {
          local_10 = 1;
        }
        local_8 = 0;
        if (piVar1[1] != 0) {
          do {
            uVar5 = 0;
            iVar2 = *(int *)(*(int *)(iVar4 + 0x14) + *(int *)(piVar1[2] + local_8 * 4) * 4);
            if ((((*(int *)(iVar2 + 4) == *(int *)(iVar4 + 0x80)) &&
                 ((*(uint *)(iVar2 + 0x6c) & 0xff) == param_3)) &&
                (param_4 == *(byte *)(iVar2 + 0x6d))) &&
               ((local_10 == 0 || (*(int *)(iVar2 + 0x3c) != 0)))) {
              if (param_5 != 0) {
                do {
                  if (*(int *)(iVar2 + 0x10) ==
                      *(int *)(*(int *)(*(int *)(iVar4 + 0x14) + *(int *)(param_6 + uVar5 * 4) * 4)
                              + 0x10)) {
                    iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,*(int *)(iVar2 + 0x10),0);
                    if (iVar4 == -1) {
                      return 0x8007000e;
                    }
                    iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                    *(undefined4 *)(iVar3 + 0x3c) = *(undefined4 *)(iVar2 + 0x3c);
                    *(undefined4 *)(iVar3 + 0x38) = *(undefined4 *)(param_6 + uVar5 * 4);
                    *(int *)(piVar1[2] + local_8 * 4) = iVar4;
                    break;
                  }
                  uVar5 = uVar5 + 1;
                } while (uVar5 < param_5);
              }
              iVar4 = in_ECX;
              if (uVar5 == param_5) {
                FUN_1008b0b5(in_ECX,0,0x12c1,"internal error: InputRemap component matchup failed");
                return 0x80004005;
              }
            }
            local_8 = local_8 + 1;
          } while (local_8 < (uint)piVar1[1]);
        }
      }
      local_14 = local_14 + 1;
    } while (local_14 < param_2);
  }
  return 0;
}


