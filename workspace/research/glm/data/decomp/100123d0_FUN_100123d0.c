// 100123d0 size=738 FUN_100123d0

void FUN_100123d0(void)

{
  undefined4 uVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  int *piVar7;
  int *piVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  uint uVar13;
  char *_Dest;
  int *piVar14;
  int iVar15;
  int *piVar16;
  int aiStack_c0c [254];
  int aiStack_814 [517];
  
  uVar2 = (**(code **)(*DAT_101d1bf4 + 0x18))(DAT_101d1bf4);
  iVar11 = 0;
  uVar13 = 0;
  DAT_101d1c04 = 0;
  if (uVar2 != 0) {
    do {
      if (0xff < DAT_101d1c04) break;
      iVar3 = (**(code **)(*DAT_101d1bf4 + 0x1c))(DAT_101d1bf4);
      if (-1 < iVar3) {
        if ((&DAT_101d1c10)[DAT_101d1c04 * 4] == 0) {
          (&DAT_101d1c10)[DAT_101d1c04 * 4] = 0x3c;
        }
        DAT_101d1c04 = DAT_101d1c04 + 1;
      }
      uVar13 = uVar13 + 1;
    } while (uVar13 < uVar2);
  }
  FUN_10013950(&DAT_101d1c08,&DAT_101d1c08 + DAT_101d1c04 * 4,(int)(DAT_101d1c04 * 0x10) >> 4,
               &LAB_10012320);
  iVar15 = 0;
  iVar3 = 0;
  if (DAT_101d1c04 != 0) {
    piVar8 = (int *)&stack0xfffff3f0;
    piVar9 = &DAT_101d1c08;
    piVar14 = aiStack_814 + 1;
    uVar2 = DAT_101d1c04;
    piVar16 = piVar8;
    do {
      iVar3 = piVar9[1];
      iVar10 = *piVar9;
      if ((((iVar15 < 1) || (piVar14[-1] != iVar10)) || (*piVar14 != iVar3)) &&
         ((0x27f < iVar10 && (0x1df < iVar3)))) {
        piVar14[1] = iVar10;
        iVar15 = iVar15 + 1;
        piVar14[2] = iVar3;
        piVar14 = piVar14 + 2;
      }
      iVar3 = piVar9[2];
      iVar4 = 0;
      piVar7 = piVar8;
      iVar10 = iVar11;
      if (0 < iVar11) {
        do {
          if (aiStack_c0c[iVar4] == iVar3) goto LAB_10012524;
          iVar4 = iVar4 + 1;
        } while (iVar4 < iVar11);
      }
      for (; (0 < iVar10 && (piVar7 = piVar16, iVar3 < *piVar8)); piVar8 = piVar8 + -1) {
        piVar8[1] = *piVar8;
        iVar10 = iVar10 + -1;
      }
      iVar11 = iVar11 + 1;
      piVar8 = piVar7 + 1;
      aiStack_c0c[iVar10] = iVar3;
      piVar16 = piVar8;
LAB_10012524:
      piVar9 = piVar9 + 4;
      uVar2 = uVar2 - 1;
      iVar3 = iVar11;
    } while (uVar2 != 0);
  }
  _Dest = &DAT_101d3410;
  if (iVar15 == 0) {
    uVar5 = FUN_10060c70("No valid resolutions of %i x %i or above found",0x280,0x1e0);
    (*(code *)RI_Printf)
              (0,
               "********** DirectX returned an unrecoverable error code during initialization  **********\n"
              );
    (*(code *)RI_Printf)
              (0,
               "********** Initialization also happens while playing if DirectX loses a device **********\n"
              );
    (*(code *)RI_Printf)
              (0,
               "********** Consult the readme for how to continue from this problem            **********\n"
              );
    (*(code *)RI_Printf)(0,&DAT_10194088,uVar5);
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  iVar10 = 0;
  iVar4 = 0;
  iVar11 = 0;
  if (0 < iVar15) {
    iVar12 = 0;
    do {
      uVar5 = *(undefined4 *)((int)aiStack_814 + iVar10 + 0xc);
      uVar1 = *(undefined4 *)((int)aiStack_814 + iVar10 + 8);
      (&DAT_101d2c08)[iVar4] = _Dest;
      iVar6 = _sprintf(_Dest,"%ix%i",uVar1,uVar5);
      _Dest = _Dest + iVar6 + 1;
      if ((*(int *)((int)aiStack_814 + iVar12 + 8) < 0x280) ||
         (*(int *)((int)aiStack_814 + iVar12 + 0xc) < 0x1e0)) {
        iVar12 = iVar10;
        iVar11 = iVar4;
      }
      iVar4 = iVar4 + 1;
      iVar10 = iVar10 + 8;
    } while (iVar4 < iVar15);
  }
  (&DAT_101d2c08)[iVar4] = 0;
  DAT_101ce688 = (*(code *)RI_Dvar_RegisterString)("r_mode",&DAT_101d2c08,iVar11,0x2021);
  iVar15 = 0;
  iVar11 = 0;
  if (0 < iVar3) {
    iVar10 = 0;
    iVar4 = 0;
    do {
      uVar5 = *(undefined4 *)((int)aiStack_c0c + iVar4);
      *(char **)((int)&DAT_101d300c + iVar4) = _Dest;
      iVar12 = _sprintf(_Dest,"%i Hz",uVar5);
      _Dest = _Dest + iVar12 + 1;
      if (*(int *)((int)aiStack_c0c + iVar10) < 0x3c) {
        iVar10 = iVar4;
        iVar11 = iVar15;
      }
      iVar15 = iVar15 + 1;
      iVar4 = iVar4 + 4;
    } while (iVar15 < iVar3);
  }
  (&DAT_101d300c)[iVar15] = 0;
  DAT_101ce7fc = (*(code *)RI_Dvar_RegisterString)("r_displayRefresh",&DAT_101d300c,iVar11,0x2021);
  return;
}


