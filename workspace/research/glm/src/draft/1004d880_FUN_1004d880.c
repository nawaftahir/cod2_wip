


void FUN_1004d880(int param_1)

{
  unsigned int *puVar1;
  int iVar2;
  int iVar3;
  unsigned int *puVar4;
  unsigned int uVar5;
  int *piVar6;
  int iVar7;
  unsigned int uVar8;
  
  iVar2 = *(int *)(param_1 + 0x18c);
  iVar7 = 0;
  if (0 < *(int *)(param_1 + 0x2c)) {
    piVar6 = (int *)(*(int *)(param_1 + 0xcc) + 0xc);
    do {
      uVar5 = piVar6[6] * *piVar6;
      iVar3 = (int)uVar5 / *(int *)(param_1 + 0x120);
      uVar8 = (unsigned int)piVar6[8] % uVar5;
      if ((unsigned int)piVar6[8] % uVar5 == 0) {
        uVar8 = uVar5;
      }
      if (iVar7 == 0) {
        *(int *)(iVar2 + 0x48) = (int)(uVar8 - 1) / iVar3 + 1;
      }
      iVar3 = iVar3 * 2;
      if (0 < iVar3) {
        puVar1 = (unsigned int *)
                 (*(int *)(*(int *)(iVar2 + 0x38 + *(int *)(iVar2 + 0x40) * 4) + iVar7 * 4) +
                 uVar8 * 4);
        puVar4 = puVar1;
        do {
          *puVar4 = puVar1[-1];
          puVar4 = puVar4 + 1;
          iVar3 = iVar3 + -1;
        } while (iVar3 != 0);
      }
      iVar7 = iVar7 + 1;
      piVar6 = piVar6 + 0x15;
    } while (iVar7 < *(int *)(param_1 + 0x2c));
  }
  return;
}


