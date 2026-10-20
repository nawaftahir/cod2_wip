
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_0049a420(void)

{
  int iVar1;
  float *pfVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  int in_EAX;
  int *piVar6;
  undefined4 *puVar7;
  int iVar8;
  float10 fVar9;
  float local_8;
  
  if (*(int *)(in_EAX + 4) == 0) {
    return (float10)_DAT_00556a70;
  }
  if (*(char *)(in_EAX + 0x6d) != '\0') {
    FUN_0049a2c0(in_EAX);
  }
  iVar1 = *(int *)(in_EAX + 0x14);
  iVar8 = 1;
  local_8 = 0.0;
  if (1 < iVar1) {
    do {
      piVar6 = (int *)FUN_0041e950();
      pfVar2 = (float *)*piVar6;
      fVar3 = *pfVar2;
      fVar4 = pfVar2[1];
      fVar5 = pfVar2[2];
      puVar7 = (undefined4 *)FUN_0041e950();
      pfVar2 = (float *)*puVar7;
      fVar9 = (float10)FUN_004d98d4((double)((fVar3 - *pfVar2) * (fVar3 - *pfVar2) +
                                            (fVar4 - pfVar2[1]) * (fVar4 - pfVar2[1]) +
                                            (fVar5 - pfVar2[2]) * (fVar5 - pfVar2[2])));
      local_8 = (float)fVar9 + local_8;
      iVar8 = iVar8 + 1;
    } while (iVar8 < iVar1);
  }
  return (float10)local_8;
}

