// 100aba21 size=470 FUN_100aba21

undefined4 FUN_100aba21(int param_1,int *param_2,int param_3,uint param_4,uint param_5)

{
  int *piVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int in_ECX;
  uint uVar6;
  int *piVar7;
  
  if (param_5 == 0) {
    param_5 = 0;
    if (param_4 != 0) {
      do {
        piVar1 = (int *)(param_3 + param_5 * 4);
        puVar2 = (uint *)*piVar1;
        if (((*puVar2 & 0xfff00000) != 0x11000000) && ((*puVar2 & 0xfff00000) != 0x72100000)) {
          iVar3 = *(int *)puVar2[2];
          iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
          if ((*(ushort *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 0x840)
              != 0) {
            uVar6 = *(uint *)(iVar4 + 0xc);
            if ((5 < uVar6) || (piVar7 = (int *)(param_1 + uVar6 * 4), *piVar7 != 0)) {
              return 0;
            }
            piVar5 = param_2 + uVar6;
            if (*piVar5 == -1) {
              *piVar5 = iVar3;
            }
            else if (*piVar5 != iVar3) {
              return 0;
            }
            *piVar7 = (int)puVar2;
            *piVar1 = 0;
            *piVar5 = *(int *)puVar2[2];
          }
        }
        param_5 = param_5 + 1;
      } while (param_5 < param_4);
    }
  }
  else if (param_5 == 1) {
    param_5 = 0;
    if (param_4 != 0) {
      do {
        piVar1 = (int *)(param_3 + param_5 * 4);
        puVar2 = (uint *)*piVar1;
        if (((puVar2 != (uint *)0x0) && ((*puVar2 & 0xfff00000) != 0x11000000)) &&
           ((*puVar2 & 0xfff00000) != 0x72100000)) {
          uVar6 = 0;
          piVar7 = param_2;
          do {
            if ((*(int *)((param_1 - (int)param_2) + (int)piVar7) == 0) &&
               ((*piVar7 == *(int *)puVar2[2] || (*piVar7 == -1)))) break;
            uVar6 = uVar6 + 1;
            piVar7 = piVar7 + 1;
          } while (uVar6 < 6);
          if (uVar6 == 6) {
            return 0;
          }
          param_2[uVar6] = *(int *)puVar2[2];
          *(uint **)(uVar6 * 4 + param_1) = puVar2;
          *piVar1 = 0;
        }
        param_5 = param_5 + 1;
      } while (param_5 < param_4);
    }
  }
  else if ((param_5 == 2) && (param_5 = 0, param_4 != 0)) {
    do {
      piVar1 = (int *)(param_3 + param_5 * 4);
      puVar2 = (uint *)*piVar1;
      if ((puVar2 != (uint *)0x0) &&
         (((*puVar2 & 0xfff00000) == 0x11000000 || ((*puVar2 & 0xfff00000) == 0x72100000)))) {
        uVar6 = 0;
        do {
          if (*(int *)(param_1 + uVar6 * 4) == 0) break;
          uVar6 = uVar6 + 1;
        } while (uVar6 < 6);
        if (uVar6 == 6) {
          return 0;
        }
        param_2[uVar6] = *(int *)puVar2[2];
        *(uint **)(uVar6 * 4 + param_1) = puVar2;
        *piVar1 = 0;
      }
      param_5 = param_5 + 1;
    } while (param_5 < param_4);
  }
  return 1;
}


