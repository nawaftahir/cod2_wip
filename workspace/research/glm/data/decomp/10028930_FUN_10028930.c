// 10028930 size=173 FUN_10028930

void FUN_10028930(undefined4 *param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  int iVar6;
  undefined4 *puVar7;
  int in_EAX;
  int iVar8;
  int iVar9;
  undefined4 *unaff_EBX;
  undefined4 *puVar10;
  int iVar11;
  
  puVar5 = param_1;
  iVar8 = (int)unaff_EBX - (int)param_1 >> 3;
  iVar11 = in_EAX - (int)param_1 >> 3;
  iVar6 = iVar11;
  iVar9 = iVar8;
  while (iVar3 = iVar6, iVar3 != 0) {
    iVar6 = iVar9 % iVar3;
    iVar9 = iVar3;
  }
  if ((iVar9 < iVar8) && (0 < iVar9)) {
    puVar10 = param_1 + iVar9 * 2;
    param_1 = (undefined4 *)iVar9;
    do {
      uVar1 = *puVar10;
      uVar2 = puVar10[1];
      puVar7 = puVar10 + iVar11 * 2;
      puVar4 = puVar10;
      if (puVar10 + iVar11 * 2 == unaff_EBX) {
        puVar7 = puVar5;
      }
      while (puVar7 != puVar10) {
        *puVar4 = *puVar7;
        puVar4[1] = puVar7[1];
        iVar9 = (int)unaff_EBX - (int)puVar7 >> 3;
        puVar4 = puVar7;
        if (iVar11 < iVar9) {
          puVar7 = puVar7 + iVar11 * 2;
        }
        else {
          puVar7 = puVar5 + (iVar11 - iVar9) * 2;
        }
      }
      puVar4[1] = uVar2;
      puVar10 = puVar10 + -2;
      param_1 = (undefined4 *)((int)param_1 + -1);
      *puVar4 = uVar1;
    } while (param_1 != (undefined4 *)0x0);
  }
  return;
}


