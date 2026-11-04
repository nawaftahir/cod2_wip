// 1008af24 size=224 FUN_1008af24

undefined4 FUN_1008af24(void)

{
  int *piVar1;
  int *piVar2;
  int in_ECX;
  undefined4 uVar3;
  uint uVar4;
  int iVar5;
  uint local_8;
  
  uVar4 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + uVar4 * 4);
      if (*(int *)(iVar5 + 8) == -1) {
        uVar3 = 0xffffffff;
      }
      else {
        uVar3 = *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + 8) * 4) + 0x30);
      }
      *(undefined4 *)(iVar5 + 8) = uVar3;
      if (*(int *)(iVar5 + 0x14) == -1) {
        uVar3 = 0xffffffff;
      }
      else {
        uVar3 = *(undefined4 *)
                 (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + 0x14) * 4) + 0x30);
      }
      *(undefined4 *)(iVar5 + 0x14) = uVar3;
      if (*(int *)(iVar5 + 0x38) == -1) {
        uVar3 = 0xffffffff;
      }
      else {
        uVar3 = *(undefined4 *)
                 (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + 0x38) * 4) + 0x30);
      }
      uVar4 = uVar4 + 1;
      *(undefined4 *)(iVar5 + 0x38) = uVar3;
    } while (uVar4 < *(uint *)(in_ECX + 8));
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      piVar2 = *(int **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      uVar4 = 0;
      if (*piVar2 != 0) {
        if (piVar2[1] != 0) {
          do {
            piVar1 = (int *)(piVar2[2] + uVar4 * 4);
            iVar5 = *piVar1;
            if (iVar5 == -1) {
              iVar5 = -1;
            }
            else {
              iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4) + 0x30);
            }
            uVar4 = uVar4 + 1;
            *piVar1 = iVar5;
          } while (uVar4 < (uint)piVar2[1]);
        }
        uVar4 = 0;
        if (piVar2[3] != 0) {
          do {
            piVar1 = (int *)(piVar2[4] + uVar4 * 4);
            iVar5 = *piVar1;
            if (iVar5 == -1) {
              iVar5 = -1;
            }
            else {
              iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4) + 0x30);
            }
            uVar4 = uVar4 + 1;
            *piVar1 = iVar5;
          } while (uVar4 < (uint)piVar2[3]);
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  return 0;
}


