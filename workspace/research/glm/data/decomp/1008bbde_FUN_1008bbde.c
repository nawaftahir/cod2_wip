// 1008bbde size=648 FUN_1008bbde

int FUN_1008bbde(void)

{
  int iVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int in_ECX;
  int *piVar6;
  uint uVar7;
  uint local_24;
  int *local_20;
  int *local_1c;
  uint local_18;
  void *local_10;
  uint local_c;
  uint local_8;
  
  uVar7 = 0;
  local_10 = (void *)0x0;
  FUN_1008a979();
  local_8 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4);
      if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 0x20) == 0)
      {
        *(uint *)(iVar4 + 0x30) = uVar7;
      }
      else {
        iVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,0,0);
        *(int *)(iVar4 + 0x30) = iVar3;
        if (iVar3 == -1) goto LAB_1008be5a;
        local_8 = local_8 + 1;
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x14) =
             *(undefined4 *)(iVar4 + 0x14);
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + 0x30) * 4) + 0x18) =
             *(undefined4 *)(iVar4 + 0x18);
      }
      uVar7 = uVar7 + 1;
    } while (uVar7 < *(uint *)(in_ECX + 8));
    if (local_8 != 0) {
      FUN_1008af24();
      local_10 = operator_new(local_8 << 2);
      if (local_10 == (void *)0x0) {
LAB_1008be5a:
        local_1c = (int *)0x8007000e;
        goto LAB_1008bcda;
      }
      uVar7 = 0;
      local_8 = 0;
      if (*(int *)(in_ECX + 8) != 0) {
        do {
          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                 *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4) + 4) * 4) +
                        4) & 0x20) != 0) {
            *(uint *)((int)local_10 + local_8 * 4) = uVar7;
            local_8 = local_8 + 1;
          }
          uVar7 = uVar7 + 1;
        } while (uVar7 < *(uint *)(in_ECX + 8));
      }
      FUN_10086920(FUN_10086538,local_10,local_8,in_ECX);
      local_18 = 0;
      if (local_8 != 0) {
        do {
          piVar5 = (int *)((int)local_10 + local_18 * 4);
          iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4);
          local_c = 1;
          local_1c = piVar5;
          uVar7 = local_18;
          while (uVar7 = uVar7 + 1, uVar7 < local_8) {
            local_1c = local_1c + 1;
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *local_1c * 4);
            if (((*(int *)(iVar4 + 4) != *(int *)(iVar3 + 4)) ||
                (*(int *)(iVar4 + 8) != *(int *)(iVar3 + 8))) ||
               (*(int *)(iVar4 + 0xc) != *(int *)(iVar3 + 0xc))) break;
            local_c = local_c + 1;
          }
          iVar4 = FUN_10086199(local_c & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
          if (iVar4 == -1) goto LAB_1008be5a;
          iVar4 = *(int *)(*(int *)(in_ECX + 0x18) + iVar4 * 4);
          local_24 = 0;
          local_20 = piVar5;
          if (local_c != 0) {
            do {
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *local_20 * 4);
              iVar1 = *(int *)(iVar3 + 0x30);
              iVar3 = *(int *)(iVar3 + 0x48);
              while (iVar3 != -1) {
                puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar3 * 4);
                if ((puVar2[0xf] != 0) && (local_1c = (int *)FUN_100853b0(), (int)local_1c < 0))
                goto LAB_1008bcda;
                if ((*puVar2 & 0xfff00000) != 0x10000000) break;
                uVar7 = 0;
                if (puVar2[3] != 0) {
                  piVar6 = (int *)puVar2[4];
                  do {
                    if (iVar1 == *piVar6) break;
                    uVar7 = uVar7 + 1;
                    piVar6 = piVar6 + 1;
                  } while (uVar7 < puVar2[3]);
                }
                iVar1 = *(int *)(puVar2[2] + uVar7 * 4);
                iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar1 * 4) + 0x48);
              }
              if (*(int *)(iVar4 + 0x3c) != 0) break;
              local_24 = local_24 + 1;
              local_20 = local_20 + 1;
            } while (local_24 < local_c);
          }
          uVar7 = 0;
          if (local_c != 0) {
            do {
              *(undefined4 *)(*(int *)(iVar4 + 8) + uVar7 * 4) =
                   *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4) + 0x30);
              *(int *)(*(int *)(iVar4 + 0x10) + uVar7 * 4) = *piVar5;
              uVar7 = uVar7 + 1;
              piVar5 = piVar5 + 1;
            } while (uVar7 < local_c);
          }
          local_18 = local_18 + local_c;
        } while (local_18 < local_8);
      }
    }
  }
  local_1c = (int *)0x0;
LAB_1008bcda:
  _free(local_10);
  return (int)local_1c;
}


