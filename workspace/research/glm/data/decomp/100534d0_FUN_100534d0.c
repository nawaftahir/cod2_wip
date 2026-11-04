// 100534d0 size=814 FUN_100534d0

void FUN_100534d0(int param_1)

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
    iVar2 = piVar1[-2] + piVar1[5];
    iVar5 = piVar1[-2] - piVar1[5];
    iVar3 = piVar1[-1] + piVar1[4];
    iVar9 = piVar1[-1] - piVar1[4];
    iVar4 = piVar1[3] + *piVar1;
    iVar10 = *piVar1 - piVar1[3];
    iVar7 = piVar1[2] + piVar1[1];
    iVar6 = piVar1[1] - piVar1[2];
    iVar8 = iVar7 + iVar2;
    iVar2 = iVar2 - iVar7;
    iVar7 = iVar4 + iVar3;
    iVar3 = iVar3 - iVar4;
    piVar1[-2] = (iVar7 + iVar8) * 4;
    piVar1[2] = (iVar8 - iVar7) * 4;
    iVar4 = (iVar3 + iVar2) * 0x1151;
    *piVar1 = iVar4 + 0x400 + iVar2 * 0x187e >> 0xb;
    piVar1[4] = iVar4 + iVar3 * -0x3b21 + 0x400 >> 0xb;
    iVar7 = (iVar10 + iVar5 + iVar6 + iVar9) * 0x25a1;
    iVar2 = (iVar6 + iVar5) * -0x1ccd;
    iVar3 = (iVar10 + iVar9) * -0x5203;
    iVar4 = iVar7 + (iVar6 + iVar9) * -0x3ec5;
    iVar7 = iVar7 + (iVar10 + iVar5) * -0xc7c;
    piVar1[5] = iVar6 * 0x98e + iVar4 + 0x400 + iVar2 >> 0xb;
    piVar1[3] = iVar10 * 0x41b3 + iVar7 + 0x400 + iVar3 >> 0xb;
    piVar1[1] = iVar9 * 0x6254 + iVar4 + 0x400 + iVar3 >> 0xb;
    piVar1[-1] = iVar5 * 0x300b + iVar7 + 0x400 + iVar2 >> 0xb;
    piVar1 = piVar1 + 8;
    local_4 = local_4 + -1;
  } while (local_4 != 0);
  piVar1 = (int *)(param_1 + 0x40);
  param_1 = 8;
  do {
    iVar2 = piVar1[-0x10] + piVar1[0x28];
    iVar5 = piVar1[-0x10] - piVar1[0x28];
    iVar3 = piVar1[-8] + piVar1[0x20];
    iVar9 = piVar1[-8] - piVar1[0x20];
    iVar4 = piVar1[0x18] + *piVar1;
    iVar10 = *piVar1 - piVar1[0x18];
    iVar7 = piVar1[0x10] + piVar1[8];
    iVar6 = piVar1[8] - piVar1[0x10];
    iVar8 = iVar7 + iVar2;
    iVar2 = iVar2 - iVar7;
    iVar7 = iVar4 + iVar3;
    iVar3 = iVar3 - iVar4;
    piVar1[-0x10] = iVar8 + 2 + iVar7 >> 2;
    piVar1[0x10] = (iVar8 - iVar7) + 2 >> 2;
    iVar4 = (iVar3 + iVar2) * 0x1151;
    *piVar1 = iVar4 + 0x4000 + iVar2 * 0x187e >> 0xf;
    piVar1[0x20] = iVar4 + iVar3 * -0x3b21 + 0x4000 >> 0xf;
    iVar7 = (iVar10 + iVar5 + iVar6 + iVar9) * 0x25a1;
    iVar2 = (iVar6 + iVar5) * -0x1ccd;
    iVar3 = (iVar10 + iVar9) * -0x5203;
    iVar4 = iVar7 + (iVar6 + iVar9) * -0x3ec5;
    iVar7 = iVar7 + (iVar10 + iVar5) * -0xc7c;
    piVar1[0x28] = iVar6 * 0x98e + iVar4 + 0x4000 + iVar2 >> 0xf;
    piVar1[0x18] = iVar10 * 0x41b3 + iVar7 + 0x4000 + iVar3 >> 0xf;
    piVar1[8] = iVar9 * 0x6254 + iVar4 + 0x4000 + iVar3 >> 0xf;
    piVar1[-8] = iVar5 * 0x300b + iVar7 + 0x4000 + iVar2 >> 0xf;
    piVar1 = piVar1 + 1;
    param_1 = param_1 + -1;
  } while (param_1 != 0);
  return;
}


