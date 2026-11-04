// 100c2a8e size=946 FUN_100c2a8e

int FUN_100c2a8e(uint *param_1,int param_2)

{
  int iVar1;
  bool bVar2;
  char *pcVar3;
  int iVar4;
  undefined4 uVar5;
  int in_ECX;
  uint uVar6;
  uint uVar7;
  int *piVar8;
  uint uVar9;
  uint uVar10;
  undefined4 *puVar11;
  undefined4 *puVar12;
  int local_8;
  
  bVar2 = false;
  uVar7 = *param_1;
  uVar6 = uVar7 & 0xfffff;
  uVar9 = uVar7 & 0xfff00000;
  if (param_2 == 0) {
    if (uVar9 != 0x10f00000) {
      if (uVar9 == 0x73500000) {
        uVar10 = uVar6 | 0x73d00000;
      }
      else if (uVar9 == 0x73600000) {
        uVar10 = uVar6 | 0x73e00000;
      }
      else if (uVar9 == 0x73700000) {
        uVar10 = uVar6 | 0x73f00000;
      }
      else {
        if (uVar9 != 0x73800000) {
          return 0;
        }
        uVar10 = uVar6 | 0x74000000;
      }
      goto LAB_100c2cbf;
    }
    puVar11 = *(undefined4 **)
               (*(int *)(in_ECX + 0x10) +
               *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)param_1[2] * 4) + 4) * 4);
    uVar10 = uVar6 | 0x73100000;
    if ((((*(ushort *)(puVar11 + 1) & 0x208) != 0) &&
        ((((((char *)*puVar11 == (char *)0x0 ||
            (pcVar3 = _strchr((char *)*puVar11,0x69), pcVar3 != (char *)0x0)) ||
           (pcVar3 = _strchr((char *)*puVar11,0x49), pcVar3 != (char *)0x0)) ||
          ((pcVar3 = _strchr((char *)*puVar11,0x62), pcVar3 != (char *)0x0 ||
           (pcVar3 = _strchr((char *)*puVar11,0x42), pcVar3 != (char *)0x0)))) ||
         ((*(byte *)((int)puVar11 + 5) & 8) == 0)))) &&
       (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)param_1[2] * 4) + 8) == -1))
    goto LAB_100c2cbf;
    uVar10 = uVar6 | 0x73f00000;
  }
  else {
    if (uVar9 != 0x10f00000) {
      if (uVar9 == 0x73500000) {
        uVar10 = uVar6 | 0x73900000;
      }
      else if (uVar9 == 0x73600000) {
        uVar10 = uVar6 | 0x73a00000;
      }
      else if (uVar9 == 0x73700000) {
        uVar10 = uVar6 | 0x73b00000;
      }
      else {
        if (uVar9 != 0x73800000) {
          return 0;
        }
        uVar10 = uVar6 | 0x73c00000;
      }
      goto LAB_100c2cbf;
    }
    puVar11 = *(undefined4 **)
               (*(int *)(in_ECX + 0x10) +
               *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)param_1[2] * 4) + 4) * 4);
    uVar10 = uVar6 | 0x73000000;
    if ((((*(ushort *)(puVar11 + 1) & 0x208) != 0) &&
        ((((char *)*puVar11 == (char *)0x0 ||
          (pcVar3 = _strchr((char *)*puVar11,0x69), pcVar3 != (char *)0x0)) ||
         ((pcVar3 = _strchr((char *)*puVar11,0x49), pcVar3 != (char *)0x0 ||
          (((pcVar3 = _strchr((char *)*puVar11,0x62), pcVar3 != (char *)0x0 ||
            (pcVar3 = _strchr((char *)*puVar11,0x42), pcVar3 != (char *)0x0)) ||
           ((*(byte *)((int)puVar11 + 5) & 8) == 0)))))))) &&
       (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)param_1[2] * 4) + 8) == -1))
    goto LAB_100c2cbf;
    uVar10 = uVar6 | 0x73b00000;
  }
  bVar2 = true;
LAB_100c2cbf:
  iVar4 = FUN_10085814();
  if (iVar4 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_10085379();
  }
  if (local_8 != 0) {
    if ((uVar9 != 0x10f00000) || (bVar2)) {
      uVar6 = uVar6 * 2;
    }
    iVar4 = FUN_1008585f(uVar10,uVar6,uVar7 & 0xfffff);
    if ((-1 < iVar4) && (iVar4 = FUN_100853b0(), -1 < iVar4)) {
      if (param_2 == 0) {
        uVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0xa8),0,0,0);
        **(undefined4 **)(local_8 + 0x10) = uVar5;
        if (**(int **)(local_8 + 0x10) == -1) {
          return 0;
        }
        iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(local_8 + 0x10) * 4);
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)param_1[4] * 4);
        *(undefined4 *)(iVar4 + 0x18) = *(undefined4 *)(iVar1 + 0x18);
        *(undefined4 *)(iVar4 + 0x14) = *(undefined4 *)(iVar1 + 0x14);
      }
      else {
        puVar11 = (undefined4 *)param_1[4];
        puVar12 = *(undefined4 **)(local_8 + 0x10);
        for (uVar7 = param_1[3] & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
          *puVar12 = *puVar11;
          puVar11 = puVar11 + 1;
          puVar12 = puVar12 + 1;
        }
        for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
          *(undefined1 *)puVar12 = *(undefined1 *)puVar11;
          puVar11 = (undefined4 *)((int)puVar11 + 1);
          puVar12 = (undefined4 *)((int)puVar12 + 1);
        }
      }
      puVar11 = (undefined4 *)param_1[2];
      puVar12 = *(undefined4 **)(local_8 + 8);
      for (uVar7 = param_1[1] & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
        *puVar12 = *puVar11;
        puVar11 = puVar11 + 1;
        puVar12 = puVar12 + 1;
      }
      for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
        *(undefined1 *)puVar12 = *(undefined1 *)puVar11;
        puVar11 = (undefined4 *)((int)puVar11 + 1);
        puVar12 = (undefined4 *)((int)puVar12 + 1);
      }
      if (!bVar2) {
        return local_8;
      }
      param_1 = (uint *)0x0;
      if (*(int *)(in_ECX + 8) != 0) {
        piVar8 = *(int **)(in_ECX + 0x14);
        iVar4 = *(int *)(in_ECX + 8);
        do {
          if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(*piVar8 + 4) * 4) + 5) & 1) !=
               0) && (uVar7 = *(uint *)(*piVar8 + 0xc), param_1 <= uVar7)) {
            param_1 = (uint *)(uVar7 + 1);
          }
          piVar8 = piVar8 + 1;
          iVar4 = iVar4 + -1;
        } while (iVar4 != 0);
      }
      if (*(int *)(in_ECX + 0x188) == -1) {
        uVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),param_1,0,0);
        *(undefined4 *)(in_ECX + 0x188) = uVar5;
      }
      if (*(int *)(in_ECX + 0x188) != -1) {
        *(int *)(*(int *)(local_8 + 8) + 4) = *(int *)(in_ECX + 0x188);
        return local_8;
      }
    }
    FUN_1006c418();
  }
  return 0;
}


