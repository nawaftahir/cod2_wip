// 100c7816 size=804 FUN_100c7816

int FUN_100c7816(void)

{
  uint *puVar1;
  uint *puVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  int in_ECX;
  int iVar7;
  int *piVar8;
  uint uVar9;
  undefined1 local_110 [128];
  undefined1 local_90 [128];
  undefined4 local_10;
  uint local_c;
  uint local_8;
  
  uVar9 = 0;
  uVar3 = 0;
  local_10 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4) + 0x30) = 0xffffffff;
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4) + 0x34) = 0xffffffff;
      uVar3 = uVar3 + 1;
    } while (uVar3 < *(uint *)(in_ECX + 8));
  }
  local_c = *(uint *)(in_ECX + 0xc);
  iVar4 = FUN_100c2f76(0xffffffff,1,&local_10,0,0,0,local_c,1,0,0,0);
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar7 = uVar9 * 4;
      piVar8 = (int *)(*(int *)(in_ECX + 0x14) + iVar7);
      iVar5 = *piVar8;
      if ((*(int *)(iVar5 + 0x30) != -1) || (*(int *)(iVar5 + 0x34) != -1)) {
        iVar5 = *piVar8;
        *(undefined4 *)(iVar5 + 0x14) = *(undefined4 *)(iVar5 + 0x30);
        iVar5 = *(int *)(iVar7 + *(int *)(in_ECX + 0x14));
        *(undefined4 *)(iVar5 + 0x18) = *(undefined4 *)(iVar5 + 0x34);
      }
      *(undefined4 *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 0x30) = 0xffffffff;
      *(undefined4 *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 0x34) = 0xffffffff;
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 8));
  }
  uVar3 = 0;
  if (local_c != 0) {
    do {
      iVar5 = uVar3 * 4;
      uVar3 = uVar3 + 1;
      **(undefined4 **)(*(int *)(in_ECX + 0x18) + iVar5) = 0;
    } while (uVar3 < local_c);
  }
  if (-1 < iVar4) {
    *(undefined4 *)(in_ECX + 0xfc) = 0;
    FUN_100c1df2(local_110,local_90,0,0);
    local_c = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
        uVar3 = *puVar2 & 0xfff00000;
        if ((*puVar2 & 0xfffff) == 1) {
          local_10 = 0xffffffff;
          local_8 = 0xffffffff;
          if ((((uVar3 == 0x73000000) || (uVar3 == 0x73200000)) || (uVar3 == 0x73100000)) ||
             (uVar3 == 0x73300000)) {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[2] * 4);
            uVar3 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4);
            if (((uVar3 & 0x200) != 0) && ((uVar3 & 0x2000) == 0)) {
              iVar4 = FUN_100c2000(&DAT_1010e8d8,0x2000,iVar4,&local_10);
              if (iVar4 < 0) {
                return iVar4;
              }
              *(undefined4 *)puVar2[2] = local_10;
            }
          }
          else if (uVar3 == 0x73b00000) {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[2] + 4) * 4);
            if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 5) & 1)
                  != 0) && (*(int *)(iVar4 + 8) == -1)) && (*(double *)(iVar4 + 0x20) == 0.0)) {
              local_8 = FUN_10086139(0,0,0,0);
              if (local_8 == 0xffffffff) {
                return -0x7ff8fff2;
              }
              local_10 = *(undefined4 *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[2] * 4);
              iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + local_8 * 4);
              iVar5 = FUN_10085c65();
              if (iVar5 < 0) {
                return iVar5;
              }
              iVar5 = FUN_10085d21();
              if (iVar5 < 0) {
                return iVar5;
              }
              puVar1 = (uint *)(iVar4 + 0x3c);
              *puVar1 = *puVar1 ^ 0x80000;
              *(undefined4 *)(iVar4 + 0x38) = *(undefined4 *)puVar2[2];
              *(uint *)(puVar2[2] + 4) = local_8;
            }
          }
          else if ((uVar3 == 0x74200000) || (uVar3 == 0x74100000)) {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[2] * 4);
            uVar3 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4);
            if (((uVar3 & 0x200) != 0) && ((uVar3 & 0x40000) == 0)) {
              iVar4 = FUN_100c2000(&DAT_1010e8ec,0x40000,iVar4,&local_8);
              if (iVar4 < 0) {
                return iVar4;
              }
              *(uint *)puVar2[2] = local_8;
              iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + local_8 * 4);
              local_8 = 1;
              if (1 < puVar2[1]) {
                do {
                  iVar5 = *(int *)(puVar2[2] + local_8 * 4);
                  iVar7 = iVar4;
                  if (iVar5 != -1) {
                    iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4);
                  }
                  uVar6 = FUN_10086139(*(undefined4 *)(iVar4 + 4),*(undefined4 *)(iVar4 + 0xc),
                                       local_8,*(undefined8 *)(iVar7 + 0x20));
                  uVar3 = local_8 + 1;
                  *(undefined4 *)(puVar2[2] + local_8 * 4) = uVar6;
                  local_8 = uVar3;
                } while (uVar3 < puVar2[1]);
              }
            }
          }
        }
        local_c = local_c + 1;
      } while (local_c < *(uint *)(in_ECX + 0xc));
    }
    iVar4 = FUN_1008d525();
    if (-1 < iVar4) {
      iVar4 = 0;
    }
  }
  return iVar4;
}


