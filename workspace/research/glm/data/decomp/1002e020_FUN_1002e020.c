// 1002e020 size=847 FUN_1002e020

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002e020(void)

{
  float fVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 *puVar5;
  float *pfVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  float *pfVar9;
  undefined4 *puVar10;
  int local_8c;
  int local_88;
  float local_84 [5];
  float local_70;
  float local_54;
  float local_50;
  undefined4 local_48;
  undefined4 local_44 [17];
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  DAT_1072debd = 1;
  if (DAT_10766724 == 1) {
    local_8c = DAT_1076671c;
    local_88 = DAT_10766720;
  }
  else {
    local_8c = DAT_1072dde8;
    local_88 = DAT_1072ddec;
  }
  pfVar6 = local_84;
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *pfVar6 = 0.0;
    pfVar6 = pfVar6 + 1;
  }
  fVar1 = 1.0 / (float)local_8c;
  puVar8 = &DAT_10191368;
  puVar5 = local_44;
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar5 = *puVar8;
    puVar8 = puVar8 + 1;
    puVar5 = puVar5 + 1;
  }
  local_48 = 0x3f800000;
  iVar2 = DAT_10730550 * 0xcd0;
  (&DAT_1072e320)[iVar2] = 1;
  puVar8 = (undefined4 *)(&DAT_1072def0 + iVar2);
  local_84[0] = fVar1 + fVar1;
  local_70 = (1.0 / (float)local_88) * -2.0;
  local_54 = -1.0 - fVar1;
  local_50 = 1.0 / (float)local_88 + 1.0;
  pfVar6 = local_84;
  pfVar9 = (float *)(&DAT_1072e220 + iVar2);
  for (iVar3 = 0x10; iVar3 != 0; iVar3 = iVar3 + -1) {
    *pfVar9 = *pfVar6;
    pfVar6 = pfVar6 + 1;
    pfVar9 = pfVar9 + 1;
  }
  *(undefined2 *)(&DAT_1072e321 + iVar2) = 0;
  (&DAT_1072e323)[iVar2] = 0;
  iVar3 = 0;
  puVar5 = puVar8;
  do {
    puVar7 = local_44;
    puVar10 = puVar5;
    for (iVar4 = 0x10; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = *puVar7;
      puVar7 = puVar7 + 1;
      puVar10 = puVar10 + 1;
    }
    (&DAT_1072dff0)[iVar3 + iVar2] = 1;
    iVar3 = iVar3 + 1;
    puVar5 = puVar5 + 0x10;
  } while (iVar3 < 4);
  puVar5 = puVar8;
  puVar7 = (undefined4 *)(&DAT_1072e110 + iVar2);
  for (iVar3 = 0x44; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar7 = puVar7 + 1;
  }
  puVar5 = puVar8;
  puVar7 = (undefined4 *)(&DAT_1072e330 + iVar2);
  for (iVar3 = 0x44; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar7 = puVar7 + 1;
  }
  puVar5 = (undefined4 *)(&DAT_1072e220 + iVar2);
  puVar7 = (undefined4 *)(&DAT_1072e550 + iVar2);
  for (iVar3 = 0x44; iVar4 = DAT_101ce708, iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar7 = puVar7 + 1;
  }
  puVar5 = (undefined4 *)(&DAT_1072e220 + iVar2);
  puVar7 = (undefined4 *)(&DAT_1072e660 + iVar2);
  for (iVar3 = 0x44; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar7 = puVar7 + 1;
  }
  puVar5 = puVar8;
  puVar7 = (undefined4 *)(&DAT_1072e000 + iVar2);
  for (iVar3 = 0x44; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar7 = puVar7 + 1;
  }
  puVar5 = puVar8;
  puVar7 = (undefined4 *)(&DAT_1072e440 + iVar2);
  for (iVar3 = 0x44; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar7 = puVar7 + 1;
  }
  puVar5 = (undefined4 *)(&DAT_1072e770 + iVar2);
  for (iVar3 = 0x44; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar5 = *puVar8;
    puVar8 = puVar8 + 1;
    puVar5 = puVar5 + 1;
  }
  if (*(int *)(iVar4 + 8) == 2) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &identity )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,0x100,local_44);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetTransform( D3DTS_VIEW, &identity )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,2,local_44);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetTransform( D3DTS_PROJECTION, &transform )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,3,local_84);
    } while (DAT_1076a830 != 0);
  }
  _DAT_1072dab0 = 0;
  _DAT_1072dab4 = 0;
  _DAT_1072dac0 = 0;
  _DAT_1072dac4 = 0;
  _DAT_1072dacc = 0;
  _DAT_1072dad4 = 0;
  _DAT_1072dad8 = 0;
  _DAT_1072dadc = 0;
  _DAT_1072dae0 = 0;
  _DAT_1072dae8 = 0;
  _DAT_1072daec = 0;
  _DAT_1072dab8 = 0x3f800000;
  _DAT_1072dabc = 0x3f800000;
  _DAT_1072dac8 = 0x3f800000;
  _DAT_1072dad0 = 0x3f800000;
  _DAT_1072dae4 = 0x3f800000;
  return;
}


