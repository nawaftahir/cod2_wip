
int FUN_004bef10(byte *param_1,byte *param_2)

{
  byte *pbVar1;
  byte bVar2;
  byte bVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  
  bVar2 = *param_1;
  while ((bVar2 != 0 && (bVar2 == *param_2))) {
    pbVar1 = param_1 + 1;
    param_1 = param_1 + 1;
    param_2 = param_2 + 1;
    bVar2 = *pbVar1;
  }
  bVar3 = *param_1;
  bVar2 = *param_2;
  uVar4 = (uint)bVar3;
  iVar5 = uVar4 - bVar2;
  if (DAT_005631a8 != 0) {
    while (bVar3 != 0) {
      if ((bVar3 < 0x41) || (0x5a < bVar3)) {
        uVar7 = (uint)bVar3;
      }
      else {
        uVar7 = bVar3 + 0x20;
      }
      bVar3 = *param_2;
      if ((bVar3 < 0x41) || (0x5a < bVar3)) {
        uVar6 = (uint)bVar3;
      }
      else {
        uVar6 = bVar3 + 0x20;
      }
      if (uVar7 != uVar6) break;
      pbVar1 = param_1 + 1;
      param_1 = param_1 + 1;
      param_2 = param_2 + 1;
      bVar3 = *pbVar1;
    }
    bVar3 = *param_1;
    if ((bVar3 < 0x41) || (0x5a < bVar3)) {
      uVar7 = (uint)bVar3;
    }
    else {
      uVar7 = bVar3 + 0x20;
    }
    bVar3 = *param_2;
    if ((bVar3 < 0x41) || (0x5a < bVar3)) {
      uVar6 = (uint)bVar3;
    }
    else {
      uVar6 = bVar3 + 0x20;
    }
    if ((uVar7 - uVar6 != 0) || (DAT_005631a8 == 1)) {
      iVar5 = uVar7 - uVar6;
    }
  }
  return iVar5;
}

