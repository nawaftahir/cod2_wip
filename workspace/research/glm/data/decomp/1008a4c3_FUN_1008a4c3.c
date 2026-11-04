// 1008a4c3 size=387 FUN_1008a4c3

void FUN_1008a4c3(int *param_1,int param_2,int param_3)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  
  do {
    iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4) + 0x38);
    if (iVar2 != -1) {
      param_2 = iVar2;
    }
    iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4);
    if (*(int *)(iVar2 + 4) == *param_1) {
      iVar3 = *(int *)(iVar2 + 0x74);
      if (param_1[0x16] != 0) {
        iVar5 = iVar3 * 4;
        iVar5 = *(int *)(param_1[0x14] + iVar5) + *(int *)(param_1[0x13] + iVar5);
        *(int *)(param_1[0x15] + iVar5 * 4) = iVar5;
        iVar5 = iVar5 * 0xc;
        *(int *)(iVar5 + param_1[0x16]) = param_3;
        uVar6 = **(uint **)(*(int *)(in_ECX + 0x18) + param_3 * 4) & 0xfff00000;
        if (((uVar6 == 0x20700000) || (uVar6 == 0x20800000)) || (uVar6 == 0x11500000)) {
          *(undefined4 *)(iVar5 + 4 + param_1[0x16]) = *(undefined4 *)(iVar2 + 0x14);
          *(undefined4 *)(iVar5 + 8 + param_1[0x16]) = *(undefined4 *)(iVar2 + 0x18);
        }
        else {
          *(undefined4 *)(iVar5 + 4 + param_1[0x16]) =
               *(undefined4 *)
                (*(int *)(*(int *)(in_ECX + 0x14) +
                         **(int **)(*(int *)(*(int *)(in_ECX + 0x18) + param_3 * 4) + 0x10) * 4) +
                0x14);
          *(undefined4 *)(iVar5 + 8 + param_1[0x16]) =
               *(undefined4 *)
                (*(int *)(*(int *)(in_ECX + 0x14) +
                         **(int **)(*(int *)(*(int *)(in_ECX + 0x18) + param_3 * 4) + 0x10) * 4) +
                0x18);
        }
        iVar8 = *(int *)(iVar5 + param_1[0x16] + 4);
        uVar4 = *(undefined4 *)(iVar5 + param_1[0x16] + 8);
        while( true ) {
          if (iVar8 == *(int *)(iVar2 + 0x14)) break;
          iVar7 = iVar8 * 4;
          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                 *(int *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 4) * 4) + 5) &
              0x80) != 0) {
            *(int *)(iVar5 + 4 + param_1[0x16]) = iVar8;
            *(undefined4 *)(iVar5 + 8 + param_1[0x16]) = uVar4;
            *(undefined4 *)(iVar5 + param_1[0x16]) =
                 *(undefined4 *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 0x58);
            if (*(uint *)(iVar2 + 0x58) <
                *(uint *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 0x58)) {
              *(undefined4 *)(iVar2 + 0x58) =
                   *(undefined4 *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 0x58);
            }
          }
          iVar8 = *(int *)(iVar7 + *(int *)(in_ECX + 0x14));
          uVar4 = *(undefined4 *)(iVar8 + 0x18);
          iVar8 = *(int *)(iVar8 + 0x14);
        }
      }
      piVar1 = (int *)(param_1[0x13] + iVar3 * 4);
      *piVar1 = *piVar1 + 1;
    }
    param_2 = *(int *)(iVar2 + 8);
  } while (param_2 != -1);
  return;
}


