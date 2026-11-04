// 100a8370 size=1400 FUN_100a8370

int FUN_100a8370(void)

{
  uint uVar1;
  uint *puVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  uint uVar5;
  int *in_ECX;
  int *piVar6;
  undefined4 *puVar7;
  uint uVar8;
  int iVar9;
  uint uVar10;
  int iVar11;
  int local_1c;
  int local_14;
  uint local_c;
  uint local_8;
  
  local_c = 0;
  if (in_ECX[2] != 0) {
    piVar6 = (int *)in_ECX[5];
    iVar9 = in_ECX[2];
    do {
      if ((in_ECX[0x22] == *(int *)(*piVar6 + 4)) &&
         (uVar5 = *(uint *)(*piVar6 + 0xc), local_c <= uVar5)) {
        local_c = uVar5 + 1;
      }
      piVar6 = piVar6 + 1;
      iVar9 = iVar9 + -1;
    } while (iVar9 != 0);
  }
  uVar1 = in_ECX[0x89];
  uVar5 = in_ECX[0x13];
  do {
    if (uVar1 <= uVar5) {
      for (uVar5 = in_ECX[0x13]; uVar5 < uVar1; uVar5 = uVar5 + 1) {
        **(undefined4 **)(in_ECX[0x8c] + uVar5 * 4) = 0;
      }
      return 0;
    }
    puVar2 = *(uint **)(in_ECX[0x8c] + uVar5 * 4);
    if ((puVar2 != (uint *)0x0) && (uVar8 = *puVar2, uVar8 != 0)) {
      uVar10 = uVar8 & 0xfffff;
      if ((uVar8 & 0xfff00000) == 0x70100000) {
        piVar6 = (int *)puVar2[2];
        iVar9 = in_ECX[5];
        iVar11 = in_ECX[4];
        if ((((*(byte *)(*(int *)(iVar11 + *(int *)(*(int *)(iVar9 + *piVar6 * 4) + 4) * 4) + 5) & 2
              ) != 0) &&
            ((*(byte *)(*(int *)(iVar11 + *(int *)(*(int *)(iVar9 + piVar6[uVar10] * 4) + 4) * 4) +
                       5) & 2) != 0)) &&
           ((*(byte *)(*(int *)(iVar11 + *(int *)(*(int *)(iVar9 + piVar6[uVar10 * 2] * 4) + 4) * 4)
                      + 5) & 2) != 0)) {
          iVar9 = FUN_10085814();
          if (iVar9 == 0) {
            local_14 = 0;
          }
          else {
            local_14 = FUN_10085379();
          }
          if (local_14 == 0) {
            return -0x7ff8fff2;
          }
          iVar9 = FUN_1008585f(uVar10 | 0x10000000,uVar10,uVar10,0);
          if (iVar9 < 0) {
            return iVar9;
          }
          iVar9 = FUN_100853b0();
          if (iVar9 < 0) {
            return iVar9;
          }
          local_8 = 0;
          if (uVar10 != 0) {
            do {
              iVar11 = local_8 * 4;
              iVar9 = *(int *)(in_ECX[5] + *(int *)(iVar11 + puVar2[4]) * 4);
              *(undefined4 *)(iVar11 + *(int *)(local_14 + 8)) = *(undefined4 *)(iVar11 + puVar2[2])
              ;
              uVar3 = FUN_10086139(in_ECX[0x22],local_c,*(undefined4 *)(iVar9 + 0x10),0);
              *(undefined4 *)(iVar11 + *(int *)(local_14 + 0x10)) = uVar3;
              *(undefined4 *)(iVar11 + puVar2[2]) =
                   *(undefined4 *)(iVar11 + *(int *)(local_14 + 0x10));
              if (*(int *)(iVar11 + *(int *)(local_14 + 0x10)) == -1) {
                return -0x7ff8fff2;
              }
              local_8 = local_8 + 1;
            } while (local_8 < uVar10);
          }
          local_c = local_c + 1;
          if (0x1ff < (uint)in_ECX[0x89]) {
            return -0x7ff8fff2;
          }
          iVar9 = FUN_10086026();
          if (iVar9 < 0) {
            return iVar9;
          }
          *(int *)(in_ECX[0x8c] + in_ECX[0x89] * 4) = local_14;
          in_ECX[0x89] = in_ECX[0x89] + 1;
        }
      }
      if (((*puVar2 & 0xfff00000) == 0x30000000) && ((in_ECX[0x32] & 0xffffU) != 0x104)) {
        uVar8 = 1;
        if (1 < uVar10) {
          piVar6 = (int *)puVar2[2];
          iVar9 = *piVar6;
          do {
            piVar6 = piVar6 + 1;
            if (iVar9 != *piVar6) {
              FUN_1008b0b5();
              return -0x7fffbffb;
            }
            uVar8 = uVar8 + 1;
          } while (uVar8 < uVar10);
        }
        iVar9 = FUN_10085814();
        if (iVar9 == 0) {
          puVar4 = (undefined4 *)0x0;
        }
        else {
          puVar4 = (undefined4 *)FUN_10085379();
        }
        if (puVar4 == (undefined4 *)0x0) {
          return -0x7ff8fff2;
        }
        local_8 = FUN_10086026();
        if ((int)local_8 < 0) {
LAB_100a88b9:
          FUN_1006c418();
          return local_8;
        }
        iVar9 = FUN_1008585f(0x70300001,3,1,0);
        if (iVar9 < 0) {
          return iVar9;
        }
        iVar9 = FUN_100853b0();
        if (iVar9 < 0) {
          return iVar9;
        }
        *(undefined4 *)puVar4[2] = *(undefined4 *)puVar2[2];
        uVar3 = FUN_10086139(in_ECX[0x1e],0,0,0xbff0000000000000);
        *(undefined4 *)(puVar4[2] + 4) = uVar3;
        uVar3 = FUN_10086139(in_ECX[0x1e],0,0,0x3fe0000000000000);
        *(undefined4 *)(puVar4[2] + 8) = uVar3;
        if (*(int *)(puVar4[2] + 4) == -1) {
          return -0x7ff8fff2;
        }
        if (*(int *)(puVar4[2] + 8) == -1) {
          return -0x7ff8fff2;
        }
        uVar3 = FUN_10086139(in_ECX[0x22],local_c,3,0);
        *(undefined4 *)puVar4[4] = uVar3;
        if (*(int *)puVar4[4] == -1) {
          return -0x7ff8fff2;
        }
        local_8 = 0;
        if (uVar10 != 0) {
          local_1c = uVar10 << 3;
          local_14 = uVar10 << 2;
          do {
            *(undefined4 *)(puVar2[2] + local_8 * 4) = *(undefined4 *)puVar4[4];
            puVar7 = (undefined4 *)(local_14 + puVar2[2]);
            uVar3 = *puVar7;
            *puVar7 = *(undefined4 *)(puVar2[2] + local_1c);
            *(undefined4 *)(local_1c + puVar2[2]) = uVar3;
            local_8 = local_8 + 1;
            local_1c = local_1c + 4;
            local_14 = local_14 + 4;
          } while (local_8 < uVar10);
        }
        local_c = local_c + 1;
        if (0x1ff < (uint)in_ECX[0x89]) {
          return -0x7ff8fff2;
        }
        *(undefined4 **)(in_ECX[0x8c] + in_ECX[0x89] * 4) = puVar4;
        in_ECX[0x89] = in_ECX[0x89] + 1;
        iVar9 = (**(code **)(*in_ECX + 0x20))(puVar4);
        if (iVar9 != 0) {
          iVar9 = FUN_10085814();
          if (iVar9 == 0) {
            local_14 = 0;
          }
          else {
            local_14 = FUN_10085379();
          }
          local_8 = FUN_10086026();
          if ((int)local_8 < 0) {
            if (local_14 == 0) {
              return local_8;
            }
            goto LAB_100a88b9;
          }
          if (local_14 == 0) {
            return -0x7ff8fff2;
          }
          iVar9 = FUN_1008585f(0x20400001,2,1,0);
          if (iVar9 < 0) {
            return iVar9;
          }
          iVar9 = FUN_100853b0();
          if (iVar9 < 0) {
            return iVar9;
          }
          **(undefined4 **)(local_14 + 0x10) = *(undefined4 *)puVar4[4];
          **(undefined4 **)(local_14 + 8) = *(undefined4 *)(puVar4[2] + 8);
          uVar3 = FUN_10086139(in_ECX[0x22],0,3,0);
          *(undefined4 *)puVar4[4] = uVar3;
          *(undefined4 *)(*(int *)(local_14 + 8) + 4) = *(undefined4 *)puVar4[4];
          puVar4[1] = 2;
          *puVar4 = 0x20500001;
          if (0x1ff < (uint)in_ECX[0x89]) {
            return -0x7ff8fff2;
          }
          *(int *)(in_ECX[0x8c] + in_ECX[0x89] * 4) = local_14;
          in_ECX[0x89] = in_ECX[0x89] + 1;
        }
        in_ECX[0x113] = 1;
        *puVar2 = uVar10 | 0x70f00000;
      }
      iVar9 = FUN_10085814();
      if (iVar9 == 0) {
        iVar9 = 0;
      }
      else {
        iVar9 = FUN_10085379();
      }
      if (iVar9 == 0) {
        return -0x7ff8fff2;
      }
      iVar11 = FUN_10085abe();
      if (iVar11 < 0) {
        return iVar11;
      }
      if (0x1ff < (uint)in_ECX[0x89]) {
        return -0x7ff8fff2;
      }
      iVar11 = FUN_10086026();
      if (iVar11 < 0) {
        return iVar11;
      }
      *(int *)(in_ECX[0x8c] + in_ECX[0x89] * 4) = iVar9;
      in_ECX[0x89] = in_ECX[0x89] + 1;
    }
    uVar5 = uVar5 + 1;
  } while( true );
}


