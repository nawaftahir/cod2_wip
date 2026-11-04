// 10046ce0 size=184 FUN_10046ce0

void FUN_10046ce0(int *param_1,undefined4 *param_2)

{
  byte *pbVar1;
  byte *pbVar2;
  byte *pbVar3;
  byte bVar4;
  undefined4 *in_EAX;
  int iVar5;
  byte *pbVar6;
  uint uVar7;
  int *unaff_EBX;
  uint uVar8;
  undefined4 *puVar9;
  
  if (*param_1 == 0) {
    iVar5 = (**(code **)unaff_EBX[1])();
    *(undefined1 *)(iVar5 + 0x111) = 0;
    *param_1 = iVar5;
  }
  puVar9 = (undefined4 *)*param_1;
  *puVar9 = *in_EAX;
  puVar9[1] = in_EAX[1];
  puVar9[2] = in_EAX[2];
  puVar9[3] = in_EAX[3];
  *(undefined1 *)(puVar9 + 4) = *(undefined1 *)(in_EAX + 4);
  uVar8 = 0;
  pbVar6 = (byte *)((int)in_EAX + 3);
  iVar5 = 4;
  do {
    pbVar1 = pbVar6 + -1;
    pbVar2 = pbVar6 + -2;
    pbVar3 = pbVar6 + 1;
    bVar4 = *pbVar6;
    pbVar6 = pbVar6 + 4;
    iVar5 = iVar5 + -1;
    uVar8 = bVar4 + uVar8 + (uint)*pbVar2 + (uint)*pbVar1 + (uint)*pbVar3;
  } while (iVar5 != 0);
  if (((int)uVar8 < 1) || (0x100 < (int)uVar8)) {
    *(undefined4 *)(*unaff_EBX + 0x14) = 8;
    (**(code **)*unaff_EBX)();
  }
  puVar9 = (undefined4 *)(*param_1 + 0x11);
  for (uVar7 = uVar8 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
    *puVar9 = *param_2;
    param_2 = param_2 + 1;
    puVar9 = puVar9 + 1;
  }
  for (uVar8 = uVar8 & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
    *(undefined1 *)puVar9 = *(undefined1 *)param_2;
    param_2 = (undefined4 *)((int)param_2 + 1);
    puVar9 = (undefined4 *)((int)puVar9 + 1);
  }
  *(undefined1 *)(*param_1 + 0x111) = 0;
  return;
}


