// 100c2000 size=666 FUN_100c2000

undefined4 FUN_100c2000(uint param_1,uint param_2,int param_3,int *param_4)

{
  undefined4 *puVar1;
  uint uVar2;
  int iVar3;
  uint *puVar4;
  undefined4 uVar5;
  bool bVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int in_ECX;
  int *piVar10;
  uint local_c;
  
  if (*(int *)(param_3 + 0x30) == -1) {
    puVar1 = *(undefined4 **)(*(int *)(in_ECX + 0x10) + *(int *)(param_3 + 4) * 4);
    if ((puVar1[1] & 0x800) != 0) {
      param_1 = *puVar1;
    }
    iVar7 = FUN_100860e0(param_1,puVar1[1] | param_2 | 0x40,0xffffffff,4);
    if (iVar7 == -1) {
      return 0x8007000e;
    }
    if ((*(byte *)((int)puVar1 + 5) & 1) != 0) {
      iVar7 = FUN_10086139(iVar7,*(undefined4 *)(param_3 + 100),0,*(undefined8 *)(param_3 + 0x20));
      *(int *)(param_3 + 0x30) = iVar7;
      if (iVar7 != -1) {
        *param_4 = iVar7;
        FUN_10085d21();
        return 0;
      }
      return 0x8007000e;
    }
    uVar2 = *(uint *)(in_ECX + 8);
    bVar6 = false;
    param_1 = 0;
    if (uVar2 != 0) {
      do {
        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
        if (((((*(int *)(iVar3 + 4) == *(int *)(param_3 + 4)) &&
              (*(int *)(iVar3 + 0x60) == *(int *)(param_3 + 0x60))) && (*(int *)(iVar3 + 0x60) != 0)
             ) && (*(int *)(iVar3 + 8) == -1)) || (param_3 == iVar3)) {
          iVar8 = FUN_10086139(iVar7,*(undefined4 *)(iVar3 + 100),0,*(undefined8 *)(iVar3 + 0x20));
          *(int *)(iVar3 + 0x30) = iVar8;
          if (iVar8 == -1) {
            return 0x8007000e;
          }
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + iVar8 * 4);
          FUN_10085d21();
          *(int *)(iVar8 + 0x70) = *(int *)(iVar8 + 100) << 2;
          if (*(int *)(iVar3 + 0x44) != -1) {
            bVar6 = true;
          }
        }
        param_1 = param_1 + 1;
      } while (param_1 < uVar2);
    }
    iVar7 = *(int *)(in_ECX + 0xe0);
    if ((iVar7 != 0) && (bVar6)) {
      if ((param_2 & 0x2000) == 0) {
        iVar7 = *(int *)(iVar7 + 0xb8);
      }
      else {
        iVar7 = *(int *)(iVar7 + 0xb4);
      }
      if (iVar7 == -1) {
        return 0x8007000e;
      }
      local_c = 0;
      if (uVar2 != 0) {
        do {
          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_c * 4);
          if ((((*(int *)(iVar3 + 4) == *(int *)(param_3 + 4)) &&
               (*(int *)(iVar3 + 0x60) == *(int *)(param_3 + 0x60))) &&
              ((*(int *)(iVar3 + 0x60) != 0 && (*(int *)(iVar3 + 8) == -1)))) || (param_3 == iVar3))
          {
            iVar8 = FUN_10086139(iVar7,*(undefined4 *)(iVar3 + 100),0,*(undefined8 *)(iVar3 + 0x20))
            ;
            if (iVar8 == -1) {
              return 0x8007000e;
            }
            if (*(int *)(iVar3 + 0x44) != -1) {
              iVar9 = *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 0xe0) + 0x14) +
                                       *(int *)(iVar3 + 0x44) * 4) + 0x48);
              if ((iVar9 != -1) &&
                 (puVar4 = *(uint **)(*(int *)(*(int *)(in_ECX + 0xe0) + 0x18) + iVar9 * 4),
                 (*puVar4 & 0xfff00000) == 0x10000000)) {
                param_2 = 0;
                if (puVar4[3] != 0) {
                  piVar10 = (int *)puVar4[4];
                  do {
                    if (*piVar10 == *(int *)(iVar3 + 0x44)) break;
                    param_2 = param_2 + 1;
                    piVar10 = piVar10 + 1;
                  } while (param_2 < puVar4[3]);
                }
                uVar5 = *(undefined4 *)(puVar4[2] + param_2 * 4);
                iVar9 = FUN_10086199(0x10000001,1,1);
                if (iVar9 == -1) {
                  return 0x8007000e;
                }
                iVar9 = *(int *)(*(int *)(*(int *)(in_ECX + 0xe0) + 0x18) + iVar9 * 4);
                FUN_100853b0();
                **(int **)(iVar9 + 0x10) = iVar8;
                **(undefined4 **)(iVar9 + 8) = uVar5;
                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar3 + 0x30) * 4) + 0x44) =
                     iVar8;
              }
            }
          }
          local_c = local_c + 1;
        } while (local_c < uVar2);
      }
    }
  }
  *param_4 = *(int *)(param_3 + 0x30);
  return 0;
}


