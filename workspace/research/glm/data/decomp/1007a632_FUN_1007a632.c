// 1007a632 size=1022 FUN_1007a632

int FUN_1007a632(int *param_1,undefined4 *param_2)

{
  uint *puVar1;
  bool bVar2;
  bool bVar3;
  int iVar4;
  int in_ECX;
  int iVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  undefined4 *puVar9;
  uint uVar10;
  undefined4 *puVar11;
  undefined4 uVar12;
  undefined8 uVar13;
  uint local_1c;
  int local_18;
  uint local_10;
  int local_8;
  
  iVar7 = (int)param_1;
  if (param_1 == (int *)0x0) {
    return 0;
  }
  if (*(int *)(in_ECX + 0x50) != 0) {
    return 0;
  }
  if (*(int *)(in_ECX + 0x54) != 0) {
    return 0;
  }
  uVar6 = *(uint *)(*(int *)(in_ECX + 8) + 0xc);
  iVar4 = *(int *)((int)param_1 + 4);
  if (iVar4 == 6) {
    if (*(int *)((int)param_1 + 0x10) == 1) {
      iVar5 = *(int *)((int)param_1 + 0x18);
      iVar4 = *(int *)(iVar5 + 0x10);
      local_10 = *(uint *)(iVar5 + 0x14);
      if ((*(int *)(iVar5 + 0x18) != 0) || (bVar3 = true, (*(byte *)(iVar5 + 0x1c) & 0x40) == 0)) {
        bVar3 = false;
      }
      if ((*(int *)(iVar5 + 0x18) == 0) || (bVar2 = true, (*(byte *)(iVar5 + 0x1c) & 2) == 0)) {
        bVar2 = false;
      }
      local_18 = *(undefined4 *)(iVar5 + 0x20);
      local_1c = *(undefined4 *)(iVar5 + 0x30);
      uVar8 = *(uint *)(iVar5 + 0x1c) & 0x80;
      *(uint *)(iVar5 + 0x1c) = *(uint *)(iVar5 + 0x1c) & 0xfffff3ff;
      param_1 = (int *)iVar4;
    }
    else {
      if (*(int *)((int)param_1 + 0x10) != 2) {
        return 0;
      }
      iVar5 = *(int *)((int)param_1 + 0x18);
      local_10 = *(uint *)(iVar5 + 0x14);
      iVar4 = *(int *)(iVar5 + 0x10);
      local_18 = *(undefined4 *)(iVar5 + 0x20);
      uVar8 = 0;
      *(byte *)(iVar5 + 0x19) = *(byte *)(iVar5 + 0x19) & 0xf3;
      local_1c = *(undefined4 *)(iVar5 + 0x34);
      bVar3 = false;
      bVar2 = false;
    }
    if (uVar8 != 0) {
      FUN_1007b5eb(*(undefined4 *)(*(int *)(iVar7 + 0x18) + 0x28),
                   *(int *)(in_ECX + 0x18) + iVar4 * 4,0);
      goto LAB_1007a992;
    }
    param_1 = (int *)0x0;
    if (local_10 != 0) {
      local_8 = iVar4 << 2;
      do {
        if ((!bVar2) || (*(int *)(local_8 + *(int *)(in_ECX + 0x18)) == -1)) {
          if (bVar3) {
            uVar12 = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x7c);
          }
          else {
            uVar12 = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x74);
          }
          uVar8 = FUN_10086139(uVar12,0,0,0);
          if (uVar8 < *(uint *)(*(int *)(in_ECX + 8) + 8)) {
            iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + uVar8 * 4);
          }
          else {
            iVar5 = 0;
          }
          if (iVar5 != 0) {
            *(int *)(iVar5 + 0x30) = (int)param_1 + iVar4;
            *(int *)(iVar5 + 0x60) = iVar7;
            *(int **)(iVar5 + 100) = param_1;
          }
          *(uint *)(local_8 + *(int *)(in_ECX + 0x18)) = uVar8;
        }
        param_1 = (int *)((int)param_1 + 1);
        local_8 = local_8 + 4;
      } while (param_1 < local_10);
    }
    if (!bVar3) goto LAB_1007a992;
    iVar7 = FUN_1006eb1e(local_18,*(int *)(in_ECX + 0x18) + iVar4 * 4,local_10);
    if (iVar7 < 0) {
      return iVar7;
    }
    iVar7 = FUN_10070fa6(local_18,*(int *)(in_ECX + 0x18) + iVar4 * 4,
                         *(undefined4 *)(*(int *)(in_ECX + 8) + 0x7c),1,0,0,local_1c);
    if (iVar7 < 0) {
      return iVar7;
    }
    iVar7 = FUN_1006c6e4();
  }
  else {
    if (iVar4 != 0xc) {
      if (iVar4 != 1) {
        FUN_1006dca1();
        return -0x7fffbffb;
      }
      do {
        if ((*(int *)(in_ECX + 0x50) != 0) || (*(int *)(in_ECX + 0x54) != 0)) break;
        iVar4 = FUN_1007a632(*(undefined4 *)(iVar7 + 8),0);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar7 = *(int *)(iVar7 + 0xc);
      } while (iVar7 != 0);
      goto LAB_1007a992;
    }
    iVar4 = *(int *)((int)param_1 + 0x10);
    if (iVar4 < 0) goto LAB_1007a992;
    if (iVar4 < 2) {
      iVar4 = FUN_1007b5eb(*(undefined4 *)((int)param_1 + 0x14),0,0);
      if (iVar4 < 0) {
        return iVar4;
      }
      uVar8 = *(uint *)(*(int *)(in_ECX + 8) + 0xc);
      local_18 = 0;
      local_1c = 0;
      if (uVar6 < uVar8) {
        param_1 = (int *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + uVar6 * 4);
        iVar4 = *(int *)(*(int *)(in_ECX + 8) + 0xc) - uVar6;
        do {
          if ((((*(int *)(*param_1 + 0x38) == *(int *)(in_ECX + 0x38)) &&
               (iVar5 = *(int *)(*param_1 + 0x3c), iVar5 != 0)) && (*(int *)(iVar5 + 4) == 0xd)) &&
             (local_1c <= *(uint *)(iVar5 + 0x44))) {
            local_1c = *(uint *)(iVar5 + 0x44);
            local_18 = iVar5;
          }
          param_1 = param_1 + 1;
          iVar4 = iVar4 + -1;
        } while (iVar4 != 0);
      }
      uVar10 = uVar6;
      if (uVar6 < uVar8) {
        do {
          iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + uVar10 * 4);
          if (*(int *)(iVar4 + 0x38) == *(int *)(in_ECX + 0x38)) {
            *(int *)(iVar4 + 0x3c) = local_18;
          }
          uVar10 = uVar10 + 1;
        } while (uVar10 < *(uint *)(*(int *)(in_ECX + 8) + 0xc));
      }
      *(uint *)(in_ECX + 0x50) = (uint)(*(int *)(iVar7 + 0x10) == 1);
      goto LAB_1007a992;
    }
    if (iVar4 == 2) {
      param_1 = (int *)0xffffffff;
      iVar4 = FUN_1007b5eb(*(undefined4 *)(iVar7 + 0x18),&param_1,0);
      if (iVar4 < 0) {
        return iVar4;
      }
      iVar7 = FUN_1007153d(*(undefined4 *)(iVar7 + 0x18),param_1,*(undefined4 *)(iVar7 + 0x1c),
                           *(undefined4 *)(iVar7 + 0x20));
    }
    else {
      if (iVar4 == 3) {
        uVar13 = *(undefined8 *)((int)param_1 + 0x18);
        uVar12 = *(undefined4 *)((int)param_1 + 0x14);
      }
      else if (iVar4 == 4) {
        uVar13 = *(undefined8 *)((int)param_1 + 0x18);
        uVar12 = 0;
      }
      else {
        if (iVar4 != 5) {
          if (iVar4 == 6) {
            iVar7 = FUN_10070bef(*(undefined4 *)((int)param_1 + 0x18),in_ECX + 0x28,1);
            if (iVar7 < 0) {
              return iVar7;
            }
            *(undefined4 *)(in_ECX + 0x54) = 1;
          }
          goto LAB_1007a992;
        }
        uVar12 = *(undefined4 *)((int)param_1 + 0x1c);
        uVar13 = *(undefined8 *)((int)param_1 + 0x18);
      }
      iVar7 = FUN_1007a504(param_1,uVar12,uVar13);
    }
  }
  if (iVar7 < 0) {
    return iVar7;
  }
LAB_1007a992:
  if ((*(int *)(in_ECX + 0x54) != 0) && (param_2 != (undefined4 *)0x0)) {
    param_1 = (int *)0x0;
    for (uVar8 = uVar6; iVar7 = *(int *)(in_ECX + 8), uVar8 < *(uint *)(iVar7 + 0xc);
        uVar8 = uVar8 + 1) {
      puVar1 = *(uint **)(*(int *)(iVar7 + 0x18) + uVar8 * 4);
      if ((*puVar1 & 0xfff00000) == 0x11000000) {
        param_1 = (int *)puVar1[0xf];
      }
      FUN_1006c418();
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + uVar8 * 4) = 0;
    }
    *(uint *)(iVar7 + 0xc) = uVar6;
    puVar9 = param_2;
    puVar11 = *(undefined4 **)(in_ECX + 0x18);
    for (uVar6 = *(uint *)(*(int *)(in_ECX + 4) + 0x18) & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1)
    {
      *puVar11 = *puVar9;
      puVar9 = puVar9 + 1;
      puVar11 = puVar11 + 1;
    }
    for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
      *(undefined1 *)puVar11 = *(undefined1 *)puVar9;
      puVar9 = (undefined4 *)((int)puVar9 + 1);
      puVar11 = (undefined4 *)((int)puVar11 + 1);
    }
    iVar7 = FUN_10070bef(param_1,in_ECX + 0x28,1);
    if (iVar7 < 0) {
      return iVar7;
    }
  }
  return 0;
}


