// 10047d40 size=369 FUN_10047d40

undefined4 FUN_10047d40(int *param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int local_c;
  int *local_8;
  byte local_4;
  
  piVar4 = param_1;
  iVar2 = param_1[0x59];
  iVar6 = param_1[0x50];
  *(undefined4 *)(iVar2 + 0x10) = *(undefined4 *)param_1[8];
  *(undefined4 *)(iVar2 + 0x14) = *(undefined4 *)(param_1[8] + 4);
  if ((param_1[0x31] != 0) && (*(int *)(iVar2 + 0x44) == 0)) {
    FUN_10047c30(*(undefined4 *)(iVar2 + 0x48));
  }
  local_c = 0;
  if (0 < param_1[0x42]) {
    local_8 = param_1 + 0x43;
    do {
      iVar5 = *local_8;
      local_4 = (byte)iVar6;
      iVar3 = piVar4[iVar5 + 0x3c];
      iVar7 = (int)**(short **)(param_2 + local_c * 4) >> (local_4 & 0x1f);
      param_1 = (int *)(iVar7 - *(int *)(iVar2 + 0x24 + iVar5 * 4));
      *(int *)(iVar2 + 0x24 + iVar5 * 4) = iVar7;
      iVar5 = (int)param_1;
      if ((int)param_1 < 0) {
        iVar5 = -(int)param_1;
        param_1 = (int *)((int)param_1 + -1);
      }
      iVar7 = 0;
      if (iVar5 != 0) {
        do {
          iVar5 = iVar5 >> 1;
          iVar7 = iVar7 + 1;
        } while (iVar5 != 0);
        if (0xb < iVar7) {
          *(undefined4 *)(*piVar4 + 0x14) = 6;
          (**(code **)*piVar4)(piVar4);
        }
      }
      if (*(char *)(iVar2 + 0xc) == '\0') {
        FUN_100479a0(*(undefined4 *)
                      (*(int *)(iVar2 + 0x4c + *(int *)(iVar3 + 0x14) * 4) + iVar7 * 4));
      }
      else {
        piVar1 = (int *)(*(int *)(iVar2 + 0x5c + *(int *)(iVar3 + 0x14) * 4) + iVar7 * 4);
        *piVar1 = *piVar1 + 1;
      }
      if (iVar7 != 0) {
        FUN_100479a0(param_1);
      }
      local_c = local_c + 1;
      local_8 = local_8 + 1;
    } while (local_c < piVar4[0x42]);
  }
  *(undefined4 *)piVar4[8] = *(undefined4 *)(iVar2 + 0x10);
  iVar6 = piVar4[8];
  *(undefined4 *)(iVar6 + 4) = *(undefined4 *)(iVar2 + 0x14);
  if (piVar4[0x31] != 0) {
    iVar6 = *(int *)(iVar2 + 0x44);
    if (iVar6 == 0) {
      *(int *)(iVar2 + 0x44) = piVar4[0x31];
      *(uint *)(iVar2 + 0x48) = *(int *)(iVar2 + 0x48) + 1U & 7;
    }
    *(int *)(iVar2 + 0x44) = *(int *)(iVar2 + 0x44) + -1;
  }
  return CONCAT31((int3)((uint)iVar6 >> 8),1);
}


