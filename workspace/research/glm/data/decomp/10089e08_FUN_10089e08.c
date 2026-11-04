// 10089e08 size=365 FUN_10089e08

undefined4 FUN_10089e08(uint param_1,double *param_2,double *param_3)

{
  int iVar1;
  uint *puVar2;
  uint uVar3;
  double dVar4;
  undefined4 uVar5;
  int *piVar6;
  int iVar7;
  undefined4 *puVar8;
  int in_ECX;
  uint uVar9;
  uint uVar10;
  
  iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  iVar1 = *(int *)(iVar7 + 0x48);
  uVar5 = 0xffffffff;
  if ((iVar1 != -1) && (*(int *)(iVar7 + 8) == -1)) {
    puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar1 * 4);
    uVar9 = *puVar2 & 0xfff00000;
    if (uVar9 == 0x10100000) {
      uVar9 = 0;
      if (puVar2[3] != 0) {
        piVar6 = (int *)puVar2[4];
        do {
          if (*piVar6 == param_1) break;
          uVar9 = uVar9 + 1;
          piVar6 = piVar6 + 1;
        } while (uVar9 < puVar2[3]);
      }
      if (param_2 != (double *)0x0) {
        *param_2 = -*param_2;
      }
      uVar5 = *(undefined4 *)(puVar2[2] + uVar9 * 4);
    }
    else if ((uVar9 == 0x20500000) || (uVar9 == 0x20400000)) {
      uVar10 = 0;
      if (puVar2[3] != 0) {
        piVar6 = (int *)puVar2[4];
        do {
          if (*piVar6 == param_1) break;
          uVar10 = uVar10 + 1;
          piVar6 = piVar6 + 1;
        } while (uVar10 < puVar2[3]);
      }
      uVar3 = puVar2[3];
      param_1 = 0;
      iVar7 = uVar10 * 4;
      puVar8 = (undefined4 *)(iVar7 + puVar2[2]);
      piVar6 = (int *)(puVar2[2] + (uVar3 + uVar10) * 4);
      do {
        uVar5 = *puVar8;
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
        if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 5) & 1) != 0)
           && (*(int *)(iVar1 + 8) == -1)) {
          if (param_2 == (double *)0x0) {
            return uVar5;
          }
          dVar4 = *(double *)(iVar1 + 0x20) * *param_2;
          if (uVar9 != 0x20500000) {
            dVar4 = dVar4 + *param_3;
            param_2 = param_3;
          }
          *param_2 = dVar4;
          return uVar5;
        }
        param_1 = param_1 + 1;
        puVar8 = puVar8 + uVar3;
        piVar6 = piVar6 + -uVar3;
      } while (param_1 < 2);
      if ((uVar9 == 0x20400000) &&
         (*(int *)(puVar2[2] + iVar7) == *(int *)(puVar2[2] + (puVar2[3] + uVar10) * 4))) {
        if (param_2 != (double *)0x0) {
          *param_2 = *param_2 + *param_2;
        }
        uVar5 = *(undefined4 *)(iVar7 + puVar2[2]);
      }
      else {
        uVar5 = 0xffffffff;
      }
    }
  }
  return uVar5;
}


