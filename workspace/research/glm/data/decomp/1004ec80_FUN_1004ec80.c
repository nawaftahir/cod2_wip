// 1004ec80 size=326 FUN_1004ec80

undefined1 FUN_1004ec80(int *param_1)

{
  byte bVar1;
  undefined4 *puVar2;
  char cVar3;
  byte *pbVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  uint uStack_1c;
  uint uStack_18;
  byte abStack_10 [16];
  
  puVar2 = (undefined4 *)param_1[8];
  iVar5 = puVar2[1];
  pbVar4 = (byte *)*puVar2;
  if (iVar5 == 0) {
    cVar3 = (*(code *)puVar2[3])(param_1);
    if (cVar3 == '\0') {
      return 0;
    }
    pbVar4 = (byte *)*puVar2;
    iVar5 = puVar2[1];
  }
  bVar1 = *pbVar4;
  iVar5 = iVar5 + -1;
  pbVar4 = pbVar4 + 1;
  if (iVar5 == 0) {
    cVar3 = (*(code *)puVar2[3])(param_1);
    if (cVar3 == '\0') {
      return 0;
    }
    pbVar4 = (byte *)*puVar2;
    iVar5 = puVar2[1];
  }
  iVar5 = iVar5 + -1;
  uVar6 = ((uint)bVar1 * 0x100 + (uint)*pbVar4) - 2;
  pbVar4 = pbVar4 + 1;
  if ((int)uVar6 < 0xe) {
    uStack_1c = ((int)uVar6 < 1) - 1 & uVar6;
  }
  else {
    uStack_1c = 0xe;
  }
  uStack_18 = 0;
  if (uStack_1c != 0) {
    do {
      if (iVar5 == 0) {
        cVar3 = (*(code *)puVar2[3])(param_1);
        if (cVar3 == '\0') {
          return 0;
        }
        pbVar4 = (byte *)*puVar2;
        iVar5 = puVar2[1];
      }
      bVar1 = *pbVar4;
      iVar5 = iVar5 + -1;
      pbVar4 = pbVar4 + 1;
      abStack_10[uStack_18] = bVar1;
      uStack_18 = uStack_18 + 1;
    } while (uStack_18 < uStack_1c);
  }
  iVar7 = uVar6 - uStack_1c;
  if (param_1[0x61] == 0xe0) {
    FUN_1004e980();
  }
  else if (param_1[0x61] == 0xee) {
    FUN_1004ebd0(iVar7);
  }
  else {
    *(undefined4 *)(*param_1 + 0x14) = 0x44;
    *(int *)(*param_1 + 0x18) = param_1[0x61];
    (**(code **)*param_1)(param_1);
  }
  *puVar2 = pbVar4;
  puVar2[1] = iVar5;
  if (0 < iVar7) {
    (**(code **)(param_1[8] + 0x10))(param_1,iVar7);
  }
  return 1;
}


