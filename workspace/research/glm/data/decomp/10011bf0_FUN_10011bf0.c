// 10011bf0 size=544 FUN_10011bf0

void FUN_10011bf0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  short sVar5;
  float *pfVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  short *unaff_EDI;
  int iVar11;
  int iVar12;
  short asStack_54 [6];
  float fStack_48;
  float fStack_44;
  float fStack_3c;
  undefined4 local_38;
  undefined2 local_34;
  undefined2 local_32;
  undefined2 local_30;
  undefined2 local_2e;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  local_38._2_2_ = 1;
  local_30 = 1;
  local_20 = 0;
  local_1c = 0;
  local_18 = 0;
  local_14 = 0x3f800000;
  local_10 = 0x3f800000;
  local_c = 0;
  local_8 = 0x3f800000;
  local_4 = 0x3f800000;
  local_38._0_2_ = 0;
  local_34 = 2;
  local_32 = 2;
  local_2e = 3;
  pfVar6 = (float *)FUN_10004f40();
  iVar7 = (**(code **)(*DAT_101d1bf8 + 0x6c))(DAT_101d1bf8,0x3000,8,0x65,0,&DAT_101d49ac,0);
  if (iVar7 < 0) {
    unaff_EDI = (short *)0x0;
  }
  else {
    iVar7 = (**(code **)(*DAT_101d49ac + 0x2c))(DAT_101d49ac,0,0,&stack0xffffff9c,0);
    if (iVar7 < 0) {
      (**(code **)(*DAT_101d49ac + 8))(DAT_101d49ac);
      unaff_EDI = (short *)0x0;
    }
  }
  iVar7 = 0;
  do {
    fVar3 = (float)iVar7;
    iVar8 = iVar7 << 7;
    iVar11 = 0;
    do {
      fVar4 = (float)iVar11;
      iVar12 = 0;
      do {
        sVar5 = (short)iVar8;
        iVar9 = _rand();
        fStack_48 = ((float)iVar9 * 3.051851e-05 + fVar3) * 0.25 - 1.0;
        iVar9 = _rand();
        fStack_44 = ((float)iVar9 * 3.051851e-05 + fVar4) * 0.25 - 1.0;
        iVar9 = _rand();
        iVar10 = 0;
        do {
          pfVar6[2] = ((float)iVar9 * 3.051851e-05 + (float)iVar12) * 0.125 - 1.0;
          *pfVar6 = fStack_48;
          fVar1 = (&fStack_3c)[iVar10 * 2];
          pfVar6[1] = fStack_44;
          fVar2 = (float)(&local_38)[iVar10 * 2];
          pfVar6[3] = fVar1;
          pfVar6[4] = fVar2;
          pfVar6 = pfVar6 + 5;
          iVar10 = iVar10 + 1;
        } while (iVar10 != 4);
        iVar9 = 0;
        do {
          *unaff_EDI = asStack_54[iVar9] + (sVar5 + (short)iVar12) * 4;
          unaff_EDI = unaff_EDI + 1;
          iVar9 = iVar9 + 1;
        } while (iVar9 != 6);
        iVar12 = iVar12 + 1;
      } while (iVar12 != 0x10);
      iVar11 = iVar11 + 1;
      iVar8 = iVar8 + 0x10;
    } while (iVar11 != 8);
    iVar7 = iVar7 + 1;
  } while (iVar7 != 8);
  FUN_100050e0();
  FUN_10005020();
  return;
}


