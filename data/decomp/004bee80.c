
int FUN_004bee80(byte *param_1,byte *param_2)

{
  byte *pbVar1;
  byte bVar2;
  uint uVar3;
  uint uVar4;
  
  bVar2 = *param_1;
  if (bVar2 == 0) {
LAB_004bee9f:
    bVar2 = *param_1;
    while (bVar2 != 0) {
      if ((bVar2 < 0x41) || (0x5a < bVar2)) {
        uVar4 = (uint)bVar2;
      }
      else {
        uVar4 = bVar2 + 0x20;
      }
      bVar2 = *param_2;
      if ((bVar2 < 0x41) || (0x5a < bVar2)) {
        uVar3 = (uint)bVar2;
      }
      else {
        uVar3 = bVar2 + 0x20;
      }
      if (uVar4 != uVar3) break;
      pbVar1 = param_1 + 1;
      param_1 = param_1 + 1;
      param_2 = param_2 + 1;
      bVar2 = *pbVar1;
    }
  }
  else {
    do {
      if (bVar2 != *param_2) goto LAB_004bee9f;
      bVar2 = param_1[1];
      param_1 = param_1 + 1;
      param_2 = param_2 + 1;
    } while (bVar2 != 0);
  }
  bVar2 = *param_1;
  if ((bVar2 < 0x41) || (0x5a < bVar2)) {
    uVar4 = (uint)bVar2;
  }
  else {
    uVar4 = bVar2 + 0x20;
  }
  bVar2 = *param_2;
  if ((0x40 < bVar2) && (bVar2 < 0x5b)) {
    return uVar4 - (bVar2 + 0x20);
  }
  return uVar4 - bVar2;
}

