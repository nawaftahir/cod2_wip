// 1004e8a0 size=223 FUN_1004e8a0

undefined4 FUN_1004e8a0(int *param_1)

{
  undefined1 uVar1;
  byte bVar2;
  undefined4 *puVar3;
  char cVar4;
  int iVar5;
  int iVar6;
  undefined1 *puVar7;
  byte *pbVar8;
  
  puVar3 = (undefined4 *)param_1[8];
  iVar6 = puVar3[1];
  puVar7 = (undefined1 *)*puVar3;
  if (iVar6 == 0) {
    cVar4 = (*(code *)puVar3[3])(param_1);
    if (cVar4 == '\0') {
      return 0;
    }
    puVar7 = (undefined1 *)*puVar3;
    iVar6 = puVar3[1];
  }
  uVar1 = *puVar7;
  iVar6 = iVar6 + -1;
  puVar7 = puVar7 + 1;
  if (iVar6 == 0) {
    cVar4 = (*(code *)puVar3[3])(param_1);
    if (cVar4 == '\0') {
      return 0;
    }
    puVar7 = (undefined1 *)*puVar3;
    iVar6 = puVar3[1];
  }
  iVar6 = iVar6 + -1;
  pbVar8 = puVar7 + 1;
  if (CONCAT11(uVar1,*puVar7) != 4) {
    *(undefined4 *)(*param_1 + 0x14) = 0xb;
    (**(code **)*param_1)(param_1);
  }
  if (iVar6 == 0) {
    cVar4 = (*(code *)puVar3[3])(param_1);
    if (cVar4 == '\0') {
      return 0;
    }
    pbVar8 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  bVar2 = *pbVar8;
  iVar6 = iVar6 + -1;
  pbVar8 = pbVar8 + 1;
  if (iVar6 == 0) {
    cVar4 = (*(code *)puVar3[3])(param_1);
    if (cVar4 == '\0') {
      return 0;
    }
    pbVar8 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  iVar5 = (uint)bVar2 * 0x100 + (uint)*pbVar8;
  *(undefined4 *)(*param_1 + 0x14) = 0x52;
  *(int *)(*param_1 + 0x18) = iVar5;
  (**(code **)(*param_1 + 4))(param_1,1);
  param_1[0x41] = iVar5;
  *puVar3 = pbVar8 + 1;
  puVar3[1] = iVar6 + -1;
  return 1;
}


