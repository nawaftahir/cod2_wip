// 10047ec0 size=495 FUN_10047ec0

undefined4 FUN_10047ec0(int *param_1,int *param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  
  iVar5 = param_1[0x50];
  iVar2 = param_1[0x59];
  iVar3 = param_1[0x4e];
  *(undefined4 *)(iVar2 + 0x10) = *(undefined4 *)param_1[8];
  *(undefined4 *)(iVar2 + 0x14) = *(undefined4 *)(param_1[8] + 4);
  if ((param_1[0x31] != 0) && (*(int *)(iVar2 + 0x44) == 0)) {
    FUN_10047c30(*(undefined4 *)(iVar2 + 0x48));
  }
  iVar6 = param_1[0x4d];
  iVar4 = *param_2;
  iVar7 = 0;
  if (iVar6 <= iVar3) {
    do {
      iVar8 = (int)*(short *)(iVar4 + (&DAT_10191200)[iVar6] * 2);
      if (iVar8 == 0) {
        iVar7 = iVar7 + 1;
      }
      else {
        if (iVar8 < 0) {
          uVar9 = -iVar8 >> ((byte)iVar5 & 0x1f);
          param_2 = (int *)~uVar9;
        }
        else {
          uVar9 = iVar8 >> ((byte)iVar5 & 0x1f);
          param_2 = (int *)uVar9;
        }
        if (uVar9 == 0) {
          iVar7 = iVar7 + 1;
        }
        else {
          if (*(int *)(iVar2 + 0x38) != 0) {
            FUN_10047b70();
          }
          if (0xf < iVar7) {
            iVar8 = (iVar7 - 0x10U >> 4) + 1;
            iVar7 = iVar7 + iVar8 * -0x10;
            do {
              if (*(char *)(iVar2 + 0xc) == '\0') {
                FUN_100479a0(*(undefined4 *)
                              (*(int *)(iVar2 + 0x4c + *(int *)(iVar2 + 0x34) * 4) + 0x3c0));
              }
              else {
                piVar1 = (int *)(*(int *)(iVar2 + 0x5c + *(int *)(iVar2 + 0x34) * 4) + 0x3c0);
                *piVar1 = *piVar1 + 1;
              }
              iVar8 = iVar8 + -1;
            } while (iVar8 != 0);
          }
          iVar10 = (int)uVar9 >> 1;
          iVar8 = 1;
          if (iVar10 != 0) {
            do {
              iVar10 = iVar10 >> 1;
              iVar8 = iVar8 + 1;
            } while (iVar10 != 0);
            if (10 < iVar8) {
              *(undefined4 *)(*param_1 + 0x14) = 6;
              (**(code **)*param_1)(param_1);
            }
          }
          iVar8 = iVar7 * 0x10 + iVar8;
          if (*(char *)(iVar2 + 0xc) == '\0') {
            FUN_100479a0(*(undefined4 *)
                          (*(int *)(iVar2 + 0x4c + *(int *)(iVar2 + 0x34) * 4) + iVar8 * 4));
          }
          else {
            iVar7 = *(int *)(iVar2 + 0x5c + *(int *)(iVar2 + 0x34) * 4);
            *(int *)(iVar7 + iVar8 * 4) = *(int *)(iVar7 + iVar8 * 4) + 1;
          }
          FUN_100479a0(param_2);
          iVar7 = 0;
        }
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 <= iVar3);
    if ((0 < iVar7) &&
       (iVar5 = *(int *)(iVar2 + 0x38) + 1, *(int *)(iVar2 + 0x38) = iVar5, iVar5 == 0x7fff)) {
      FUN_10047b70();
    }
  }
  *(undefined4 *)param_1[8] = *(undefined4 *)(iVar2 + 0x10);
  iVar5 = *(int *)(iVar2 + 0x14);
  *(int *)(param_1[8] + 4) = iVar5;
  if (param_1[0x31] != 0) {
    iVar5 = *(int *)(iVar2 + 0x44);
    if (iVar5 == 0) {
      *(int *)(iVar2 + 0x44) = param_1[0x31];
      *(uint *)(iVar2 + 0x48) = *(int *)(iVar2 + 0x48) + 1U & 7;
    }
    *(int *)(iVar2 + 0x44) = *(int *)(iVar2 + 0x44) + -1;
  }
  return CONCAT31((int3)((uint)iVar5 >> 8),1);
}


