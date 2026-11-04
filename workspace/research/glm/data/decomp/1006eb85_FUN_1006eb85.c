// 1006eb85 size=591 FUN_1006eb85

int FUN_1006eb85(int param_1,undefined4 param_2,uint param_3,int param_4,int param_5,int param_6,
                undefined4 *param_7,char *param_8,int param_9,undefined4 *param_10)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  uint uVar8;
  undefined4 *puVar9;
  int in_ECX;
  uint uVar10;
  undefined4 *puVar11;
  undefined4 *puVar12;
  undefined4 *puVar13;
  undefined1 local_20 [4];
  uint local_1c;
  undefined4 local_14;
  undefined4 local_10;
  char *local_c;
  int local_8;
  
  local_10 = 0;
  local_14 = 0;
  if (param_1 != 0) {
    if ((param_4 == 0) && (param_8 != (char *)0x0)) {
      param_6 = (int)param_8;
      param_7 = &local_14;
      param_4 = 1;
    }
    if (((param_5 == 0) && (param_9 != 0)) && (local_8 = in_ECX, *(int *)(in_ECX + 0x84) == 0)) {
      do {
        pcVar7 = (char *)0x0;
        iVar4 = *(int *)(param_9 + 8);
        param_8 = (char *)0x0;
        local_c = (char *)0x0;
        pcVar6 = param_8;
        pcVar3 = local_c;
        if (*(int *)(iVar4 + 4) == 0x11) {
          pcVar2 = *(char **)(*(int *)(iVar4 + 0x14) + 0x18);
          pcVar3 = pcVar2;
          if (((*(int *)(iVar4 + 0x10) != 0) &&
              (iVar4 = FUN_10063776(*(undefined4 *)(*(int *)(iVar4 + 0x10) + 0x18),0,local_20),
              pcVar3 = local_c, -1 < iVar4)) &&
             ((pcVar6 = pcVar2, *(uint *)(local_8 + 0x10) != local_1c &&
              (pcVar6 = param_8, (*(uint *)(local_8 + 0x10) & 0xffff0000) == local_1c)))) {
            pcVar7 = pcVar2;
          }
        }
        local_c = pcVar3;
        param_8 = pcVar6;
        iVar4 = local_8;
        param_9 = *(int *)(param_9 + 0xc);
        puVar11 = (undefined4 *)0x0;
        if (param_8 == (char *)0x0) {
          param_8 = pcVar7;
          if (pcVar7 == (char *)0x0) {
            param_8 = local_c;
          }
          if (param_8 != (char *)0x0) goto LAB_1006ec81;
        }
        else {
LAB_1006ec81:
          if (param_3 < *(uint *)(*(int *)(local_8 + 8) + 4)) {
            iVar5 = *(int *)(*(int *)(*(int *)(local_8 + 8) + 0x10) + param_3 * 4);
          }
          else {
            iVar5 = 0;
          }
          if (iVar5 == 0) {
            return -0x7fffbffb;
          }
          param_3 = FUN_100861f0(iVar5);
          if (param_3 < *(uint *)(*(int *)(iVar4 + 8) + 4)) {
            puVar11 = *(undefined4 **)(*(int *)(*(int *)(iVar4 + 8) + 0x10) + param_3 * 4);
          }
          if (puVar11 == (undefined4 *)0x0) {
            return -0x7ff8fff2;
          }
          uVar8 = puVar11[1];
          if ((uVar8 & 0x800) == 0) {
            *puVar11 = param_8;
            puVar11[1] = uVar8 | 0x840;
            if (((uVar8 & 0x10) != 0) && (-1 < (char)(uVar8 | 0x840))) {
              if (((uVar8 & 0x200) != 0) && ((*(uint *)(*(int *)(local_8 + 8) + 0x70) & 0x200) != 0)
                 ) {
                puVar11[1] = uVar8 | 0xc40;
              }
              if (((puVar11[1] & 0x200) == 0) &&
                 ((*(byte *)(*(int *)(local_8 + 8) + 0x71) & 4) != 0)) {
                puVar11[1] = puVar11[1] | 0x100400;
              }
            }
          }
          else {
            pcVar6 = (char *)*puVar11;
            pcVar7 = pcVar6 + 1;
            do {
              cVar1 = *pcVar6;
              pcVar6 = pcVar6 + 1;
            } while (cVar1 != '\0');
            pcVar6 = pcVar6 + -(int)pcVar7;
            pcVar7 = param_8;
            do {
              cVar1 = *pcVar7;
              pcVar7 = pcVar7 + 1;
            } while (cVar1 != '\0');
            uVar8 = (int)pcVar7 - (int)(param_8 + 1);
            local_c = pcVar6;
            puVar9 = (undefined4 *)FUN_100826bd(pcVar6 + uVar8 + 3,4);
            if (puVar9 == (undefined4 *)0x0) {
              return -0x7ff8fff2;
            }
            puVar12 = (undefined4 *)*puVar11;
            puVar13 = puVar9;
            for (uVar10 = (uint)pcVar6 >> 2; uVar10 != 0; uVar10 = uVar10 - 1) {
              *puVar13 = *puVar12;
              puVar12 = puVar12 + 1;
              puVar13 = puVar13 + 1;
            }
            for (uVar10 = (uint)pcVar6 & 3; uVar10 != 0; uVar10 = uVar10 - 1) {
              *(undefined1 *)puVar13 = *(undefined1 *)puVar12;
              puVar12 = (undefined4 *)((int)puVar12 + 1);
              puVar13 = (undefined4 *)((int)puVar13 + 1);
            }
            pcVar7 = (char *)((int)puVar9 + (int)local_c);
            *pcVar7 = ';';
            pcVar7[1] = ' ';
            pcVar7 = pcVar7 + 2;
            for (uVar10 = uVar8 >> 2; uVar10 != 0; uVar10 = uVar10 - 1) {
              *(undefined4 *)pcVar7 = *(undefined4 *)param_8;
              param_8 = param_8 + 4;
              pcVar7 = pcVar7 + 4;
            }
            for (uVar10 = uVar8 & 3; uVar10 != 0; uVar10 = uVar10 - 1) {
              *pcVar7 = *param_8;
              param_8 = param_8 + 1;
              pcVar7 = pcVar7 + 1;
            }
            ((undefined1 *)((int)puVar9 + uVar8 + 2))[(int)local_c] = 0;
            *puVar11 = puVar9;
          }
          param_5 = 1;
        }
      } while (param_9 != 0);
    }
    iVar4 = FUN_1006df60(param_1,param_2,param_3,param_4,param_5,param_6,param_7,&local_10);
    if (iVar4 < 0) {
      return iVar4;
    }
  }
  if (param_10 != (undefined4 *)0x0) {
    *param_10 = local_10;
  }
  return 0;
}


