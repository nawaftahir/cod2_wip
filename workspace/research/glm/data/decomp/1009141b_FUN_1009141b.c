// 1009141b size=536 FUN_1009141b

undefined4 FUN_1009141b(void)

{
  int *piVar1;
  uint *puVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int in_ECX;
  uint uVar6;
  undefined1 local_34 [16];
  int local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  int *local_14;
  int *local_10;
  uint local_c;
  uint local_8;
  
  FUN_1008a979();
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      uVar3 = *puVar2;
      local_8 = uVar3 & 0xfff00000;
      if (local_8 != 0) {
        uVar6 = uVar3 & 0xfffff;
        local_1c = puVar2[1] / uVar6;
        if (local_8 == 0x50000000) {
          FUN_1008a70d(puVar2[2] + uVar6 * 4,local_34,uVar6,1);
          FUN_1008a70d(puVar2[2],local_34,uVar6,0);
        }
        else if ((0xfffffff < (uVar3 & 0xf0000000)) && ((uVar3 & 0xf0000000) < 0x40000001)) {
          FUN_1008a70d(puVar2[4],local_34,uVar6,1);
          local_8 = 0;
          if (local_1c != 0) {
            do {
              FUN_1008a70d(puVar2[2] + puVar2[3] * local_8 * 4,local_34,uVar6,0);
              local_8 = local_8 + 1;
            } while (local_8 < local_1c);
          }
        }
        if (((*puVar2 & 0xf0000000) == 0x20000000) && (iVar5 = FUN_10085469(), iVar5 != 0)) {
          iVar5 = *(int *)(in_ECX + 0x14);
          local_24 = *(int *)(iVar5 + *(int *)puVar2[2] * 4);
          iVar4 = *(int *)(iVar5 + ((int *)puVar2[2])[uVar6] * 4);
          local_18 = 0xffffffff;
          local_8 = 0xffffffff;
          if (uVar6 == 0) {
LAB_10091587:
            local_20 = *(int *)(local_24 + 4) * 4;
            iVar5 = *(int *)(iVar4 + 4) * 4;
            if ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar5) + 4) <=
                 *(uint *)(*(int *)(local_20 + *(int *)(in_ECX + 0x10)) + 4)) &&
               ((*(int *)(*(int *)(*(int *)(in_ECX + 0x10) + local_20) + 4) !=
                 *(int *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar5) + 4) ||
                ((*(uint *)(iVar4 + 4) <= *(uint *)(local_24 + 4) &&
                 ((*(uint *)(local_24 + 4) != *(uint *)(iVar4 + 4) ||
                  (*(uint *)(iVar4 + 0xc) <= *(uint *)(local_24 + 0xc))))))))) {
LAB_100915e0:
              local_8 = 0;
              if (uVar6 != 0) {
                local_24 = uVar6 << 2;
                do {
                  uVar3 = local_8 + 1;
                  piVar1 = (int *)(puVar2[2] + local_8 * 4);
                  local_20 = *piVar1;
                  *piVar1 = *(int *)(local_24 + puVar2[2]);
                  *(uint *)(local_24 + puVar2[2]) = local_20;
                  local_24 = local_24 + 4;
                  local_8 = uVar3;
                } while (uVar3 < uVar6);
              }
            }
          }
          else {
            local_10 = (int *)puVar2[2];
            local_14 = local_10 + uVar6;
            local_20 = uVar6;
            do {
              uVar3 = *(uint *)(*(int *)(iVar5 + *local_10 * 4) + 0x48);
              if (uVar3 < local_18) {
                local_18 = uVar3;
              }
              uVar3 = *(uint *)(*(int *)(iVar5 + *local_14 * 4) + 0x48);
              if (uVar3 < local_8) {
                local_8 = uVar3;
              }
              local_10 = local_10 + 1;
              local_14 = local_14 + 1;
              local_20 = local_20 - 1;
            } while (local_20 != 0);
            local_20 = 0;
            if (local_8 <= local_18) {
              if (local_18 == local_8) goto LAB_10091587;
              goto LAB_100915e0;
            }
          }
        }
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  return 0;
}


