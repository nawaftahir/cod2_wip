// 10056e10 size=452 FUN_10056e10

void FUN_10056e10(int param_1,int param_2,int param_3)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int in_EAX;
  uint uVar5;
  int iVar6;
  int iVar7;
  int in_ECX;
  uint uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  int local_428;
  int local_424;
  int aiStack_400 [256];
  
  iVar1 = *(int *)(in_EAX + 0x78);
  iVar7 = in_ECX + 0x1c;
  local_424 = 0x7fffffff;
  local_428 = 0;
  if (iVar1 < 1) {
    local_424 = 0x7fffffff;
  }
  else {
    piVar2 = *(int **)(in_EAX + 0x7c);
    iVar10 = *piVar2;
    iVar3 = piVar2[1];
    iVar4 = piVar2[2];
    do {
      uVar5 = (uint)*(byte *)(iVar10 + local_428);
      if ((int)uVar5 < param_1) {
        iVar11 = (uVar5 - param_1) * (uVar5 - param_1);
        iVar9 = param_1 + 0x18;
LAB_10056e9a:
        iVar6 = iVar9;
      }
      else {
        iVar6 = param_1 + 0x18;
        iVar9 = param_1;
        if (iVar6 < (int)uVar5) {
          iVar11 = (uVar5 - iVar6) * (uVar5 - iVar6);
          goto LAB_10056e9a;
        }
        iVar11 = 0;
        if (param_1 * 2 + 0x18 >> 1 < (int)uVar5) goto LAB_10056e9a;
      }
      uVar8 = (uint)*(byte *)(iVar3 + local_428);
      if ((int)uVar8 < in_ECX) {
        iVar9 = (uVar8 - in_ECX) * 3;
        iVar11 = iVar11 + iVar9 * iVar9;
        iVar9 = uVar8 - iVar7;
      }
      else {
        if (iVar7 < (int)uVar8) {
          iVar9 = (uVar8 - iVar7) * 3;
          iVar11 = iVar11 + iVar9 * iVar9;
        }
        else if ((int)uVar8 <= iVar7 + in_ECX >> 1) {
          iVar9 = uVar8 - iVar7;
          goto LAB_10056eff;
        }
        iVar9 = uVar8 - in_ECX;
      }
LAB_10056eff:
      uVar8 = (uint)*(byte *)(iVar4 + local_428);
      if ((int)uVar8 < param_2) {
        iVar12 = (uVar8 - param_2) * 2;
        iVar11 = iVar11 + iVar12 * iVar12;
        iVar12 = uVar8 - (param_2 + 0x18);
      }
      else {
        iVar12 = param_2 + 0x18;
        if (iVar12 < (int)uVar8) {
          iVar12 = (uVar8 - iVar12) * 2;
          iVar11 = iVar11 + iVar12 * iVar12;
        }
        else if ((int)uVar8 <= param_2 * 2 + 0x18 >> 1) {
          iVar12 = uVar8 - iVar12;
          goto LAB_10056f63;
        }
        iVar12 = uVar8 - param_2;
      }
LAB_10056f63:
      iVar6 = (uVar5 - iVar6) * (uVar5 - iVar6) + iVar9 * 3 * iVar9 * 3 + iVar12 * 2 * iVar12 * 2;
      aiStack_400[local_428] = iVar11;
      if (iVar6 < local_424) {
        local_424 = iVar6;
      }
      local_428 = local_428 + 1;
    } while (local_428 < iVar1);
  }
  iVar7 = 0;
  iVar10 = 0;
  if (0 < iVar1) {
    do {
      if (aiStack_400[iVar10] <= local_424) {
        *(char *)(iVar7 + param_3) = (char)iVar10;
        iVar7 = iVar7 + 1;
      }
      iVar10 = iVar10 + 1;
    } while (iVar10 < iVar1);
  }
  return;
}


