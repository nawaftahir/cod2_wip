// 100532c0 size=507 FUN_100532c0

void FUN_100532c0(int param_1)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int local_4;
  
  piVar1 = (int *)(param_1 + 8);
  local_4 = 8;
  do {
    iVar6 = piVar1[-2] + piVar1[5];
    iVar10 = piVar1[-2] - piVar1[5];
    iVar5 = piVar1[-1] + piVar1[4];
    iVar2 = piVar1[-1] - piVar1[4];
    iVar8 = piVar1[3] + *piVar1;
    iVar3 = *piVar1 - piVar1[3];
    iVar9 = piVar1[2] + piVar1[1];
    iVar7 = piVar1[2];
    iVar4 = iVar9 + iVar6;
    iVar6 = iVar6 - iVar9;
    piVar1[-2] = iVar8 + iVar5 + iVar4;
    piVar1[2] = iVar4 - (iVar8 + iVar5);
    iVar4 = ((iVar6 - iVar8) + iVar5) * 0xb5 >> 8;
    piVar1[4] = iVar6 - iVar4;
    iVar5 = (piVar1[1] - iVar7) + iVar3;
    *piVar1 = iVar4 + iVar6;
    iVar6 = iVar10 + iVar2;
    iVar4 = (iVar5 - iVar6) * 0x62 >> 8;
    iVar7 = (iVar5 * 0x8b >> 8) + iVar4;
    iVar4 = (iVar6 * 0x14e >> 8) + iVar4;
    iVar5 = (iVar3 + iVar2) * 0xb5 >> 8;
    iVar6 = iVar5 + iVar10;
    iVar10 = iVar10 - iVar5;
    piVar1[3] = iVar10 + iVar7;
    piVar1[1] = iVar10 - iVar7;
    piVar1[-1] = iVar6 + iVar4;
    piVar1[5] = iVar6 - iVar4;
    piVar1 = piVar1 + 8;
    local_4 = local_4 + -1;
  } while (local_4 != 0);
  piVar1 = (int *)(param_1 + 0x40);
  param_1 = 8;
  do {
    iVar6 = piVar1[-0x10] + piVar1[0x28];
    iVar10 = piVar1[-0x10] - piVar1[0x28];
    iVar5 = piVar1[-8] + piVar1[0x20];
    iVar2 = piVar1[-8] - piVar1[0x20];
    iVar8 = piVar1[0x18] + *piVar1;
    iVar3 = *piVar1 - piVar1[0x18];
    iVar9 = piVar1[0x10] + piVar1[8];
    iVar7 = piVar1[0x10];
    iVar4 = iVar9 + iVar6;
    iVar6 = iVar6 - iVar9;
    piVar1[-0x10] = iVar8 + iVar5 + iVar4;
    piVar1[0x10] = iVar4 - (iVar8 + iVar5);
    iVar4 = ((iVar6 - iVar8) + iVar5) * 0xb5 >> 8;
    piVar1[0x20] = iVar6 - iVar4;
    iVar5 = (piVar1[8] - iVar7) + iVar3;
    *piVar1 = iVar4 + iVar6;
    iVar6 = iVar10 + iVar2;
    iVar4 = (iVar5 - iVar6) * 0x62 >> 8;
    iVar7 = (iVar5 * 0x8b >> 8) + iVar4;
    iVar4 = (iVar6 * 0x14e >> 8) + iVar4;
    iVar5 = (iVar3 + iVar2) * 0xb5 >> 8;
    iVar6 = iVar5 + iVar10;
    iVar10 = iVar10 - iVar5;
    piVar1[0x18] = iVar10 + iVar7;
    piVar1[8] = iVar10 - iVar7;
    piVar1[-8] = iVar6 + iVar4;
    piVar1[0x28] = iVar6 - iVar4;
    piVar1 = piVar1 + 1;
    param_1 = param_1 + -1;
  } while (param_1 != 0);
  return;
}


