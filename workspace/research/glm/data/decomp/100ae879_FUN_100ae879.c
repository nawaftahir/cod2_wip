// 100ae879 size=248 FUN_100ae879

undefined4 FUN_100ae879(int param_1,uint param_2,int param_3,uint param_4,int param_5)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  int in_ECX;
  uint uVar6;
  int *piVar7;
  bool bVar8;
  uint local_18;
  uint local_c;
  
  local_c = 0;
  if (param_2 != 0) {
    do {
      iVar1 = *(int *)(param_1 + local_c * 4);
      if ((iVar1 != 0) && (param_4 <= *(uint *)(iVar1 + 0xc))) {
        bVar5 = true;
        local_18 = 0;
        if (param_4 == 0) {
LAB_100ae966:
          return *(undefined4 *)(param_1 + local_c * 4);
        }
        do {
          iVar2 = *(int *)(param_3 + local_18 * 4);
          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
          uVar6 = 0;
          if (param_5 == 0) {
            bVar8 = *(int *)(iVar1 + 0xc) == 0;
            if (*(int *)(iVar1 + 0xc) != 0) {
              piVar7 = *(int **)(iVar1 + 0x10);
              do {
                iVar4 = *piVar7;
                if (((iVar4 == iVar2) && (*(int *)(iVar3 + 0x3c) == 0)) ||
                   ((iVar4 == *(int *)(iVar3 + 0x38) &&
                    (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x3c) == 0)))) break;
                uVar6 = uVar6 + 1;
                piVar7 = piVar7 + 1;
              } while (uVar6 < *(uint *)(iVar1 + 0xc));
              goto LAB_100ae932;
            }
          }
          else {
            bVar8 = *(int *)(iVar1 + 0xc) == 0;
            if (*(int *)(iVar1 + 0xc) != 0) {
              piVar7 = *(int **)(iVar1 + 0x10);
              do {
                if ((*piVar7 == iVar2) || (*piVar7 == *(int *)(iVar3 + 0x38))) break;
                uVar6 = uVar6 + 1;
                piVar7 = piVar7 + 1;
              } while (uVar6 < *(uint *)(iVar1 + 0xc));
LAB_100ae932:
              bVar8 = uVar6 == *(uint *)(iVar1 + 0xc);
            }
          }
          if (bVar8) {
            bVar5 = false;
          }
          local_18 = local_18 + 1;
        } while (local_18 < param_4);
        if (bVar5) goto LAB_100ae966;
      }
      local_c = local_c + 1;
    } while (local_c < param_2);
  }
  return 0;
}


