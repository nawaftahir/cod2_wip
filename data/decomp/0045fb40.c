
undefined4 FUN_0045fb40(int param_1,char param_2)

{
  int *piVar1;
  char cVar2;
  undefined4 *puVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined4 *puVar9;
  bool bVar10;
  int iStack_28;
  int iStack_24;
  int iStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  int iStack_8;
  
  if (param_1 == 0) {
    return 0;
  }
  iStack_8 = param_1;
  do {
    iStack_10 = *(int *)(*(int *)(iStack_8 + 0x14) + 0x3c);
    iStack_18 = 0;
    if (0 < *(int *)(*(int *)(iStack_8 + 0x14) + 0x38)) {
      iVar7 = iStack_10 + 0x80;
      iVar5 = param_1;
LAB_0045fb87:
      do {
        if (iVar5 == iStack_8) {
LAB_0045fbde:
          piVar1 = (int *)(iVar5 + 4);
          iVar5 = *piVar1;
          if (*piVar1 != 0) goto LAB_0045fb87;
          for (iVar5 = *(int *)(iStack_8 + 4); iVar5 != 0; iVar5 = *(int *)(iVar5 + 4)) {
            iStack_28 = *(int *)(*(int *)(iVar5 + 0x14) + 0x3c);
            iStack_c = 0;
            if (0 < *(int *)(*(int *)(iVar5 + 0x14) + 0x38)) {
              iStack_14 = iStack_28 + 0x80;
              iVar8 = param_1;
LAB_0045fc23:
              do {
                if (iVar8 == iVar5) {
LAB_0045fc73:
                  piVar1 = (int *)(iVar8 + 4);
                  iVar8 = *piVar1;
                  if (*piVar1 != 0) goto LAB_0045fc23;
                  cVar2 = FUN_00447a50();
                  if (cVar2 == '\0') {
                    cVar2 = FUN_004481e0(iVar7,(float)*(double *)(iVar7 + 0x10),
                                         (float)*(double *)(iStack_14 + 0x10));
                    bVar10 = cVar2 == '\0';
                  }
                  else {
                    if (param_2 != '\0') goto LAB_0045fce3;
                    bVar10 = *(int *)(DAT_01128d90 * 0x1c + 0x24 + iStack_10) ==
                             *(int *)(DAT_01128d90 * 0x1c + 0x24 + iStack_28);
                  }
                  if (!bVar10) {
                    return 0;
                  }
                }
                else {
                  iVar6 = 0;
                  if (0 < *(int *)(*(int *)(iVar8 + 0x14) + 0x38)) {
                    do {
                      cVar2 = FUN_00447a50();
                      if (cVar2 != '\0') break;
                      iVar6 = iVar6 + 1;
                    } while (iVar6 < *(int *)(*(int *)(iVar8 + 0x14) + 0x38));
                  }
                  if (*(int *)(*(int *)(iVar8 + 0x14) + 0x38) <= iVar6) goto LAB_0045fc73;
                }
LAB_0045fce3:
                iStack_28 = iStack_28 + 0xa8;
                iStack_14 = iStack_14 + 0xa8;
                iStack_c = iStack_c + 1;
                iVar8 = param_1;
              } while (iStack_c < *(int *)(*(int *)(iVar5 + 0x14) + 0x38));
            }
          }
        }
        else {
          iVar8 = 0;
          if (0 < *(int *)(*(int *)(iVar5 + 0x14) + 0x38)) {
            do {
              cVar2 = FUN_00447a50();
              if (cVar2 != '\0') break;
              iVar8 = iVar8 + 1;
            } while (iVar8 < *(int *)(*(int *)(iVar5 + 0x14) + 0x38));
          }
          if (*(int *)(*(int *)(iVar5 + 0x14) + 0x38) <= iVar8) goto LAB_0045fbde;
        }
        iStack_10 = iStack_10 + 0xa8;
        iStack_18 = iStack_18 + 1;
        iVar7 = iVar7 + 0xa8;
        iVar5 = param_1;
      } while (iStack_18 < *(int *)(*(int *)(iStack_8 + 0x14) + 0x38));
    }
    iStack_8 = *(int *)(iStack_8 + 4);
    if (iStack_8 == 0) {
      puVar3 = (undefined4 *)FUN_004ff450(0x48);
      puVar9 = puVar3;
      for (iVar5 = 0x12; iVar5 != 0; iVar5 = iVar5 + -1) {
        *puVar9 = 0;
        puVar9 = puVar9 + 1;
      }
      iStack_8 = param_1;
      do {
        iStack_18 = 0;
        if (0 < *(int *)(iStack_8 + 0x18)) {
          iStack_24 = 0;
          do {
            iVar5 = *(int *)(*(int *)(iStack_8 + 0x14) + 0x3c);
            iVar7 = param_1;
            do {
              if (iVar7 != iStack_8) {
                iStack_c = 0;
                if (0 < *(int *)(*(int *)(iVar7 + 0x14) + 0x38)) {
                  do {
                    cVar2 = FUN_00447a50();
                    if (cVar2 != '\0') break;
                    iStack_c = iStack_c + 1;
                  } while (iStack_c < *(int *)(*(int *)(iVar7 + 0x14) + 0x38));
                }
                if (iStack_c < *(int *)(*(int *)(iVar7 + 0x14) + 0x38)) goto LAB_0045fe82;
              }
              iVar7 = *(int *)(iVar7 + 4);
            } while (iVar7 != 0);
            iStack_28 = 0;
            if (0 < (int)puVar3[0xe]) {
              do {
                cVar2 = FUN_00447a50();
                if ((cVar2 != '\0') || (cVar2 = FUN_00447a50(), cVar2 != '\0')) break;
                iStack_28 = iStack_28 + 1;
              } while (iStack_28 < (int)puVar3[0xe]);
            }
            if ((int)puVar3[0xe] <= iStack_28) {
              FUN_00455a30(puVar3,iVar5 + iStack_24);
            }
LAB_0045fe82:
            iStack_18 = iStack_18 + 1;
            iStack_24 = iStack_24 + 0xa8;
          } while (iStack_18 < *(int *)(iStack_8 + 0x18));
        }
        iStack_8 = *(int *)(iStack_8 + 4);
        if (iStack_8 == 0) {
          FUN_004671b0();
          if ((puVar3[2] != *(int *)(*(int *)(param_1 + 8) + 8)) && (DAT_0124a2b8 == '\0')) {
            iVar5 = FUN_0047d980("newBrushDef->owner == brushList->owner->def",".\\csg.cpp",0xbc,0,1
                                );
            if (iVar5 == 0) {
              DebugBreak();
            }
            else if (iVar5 == 2) {
              DAT_0124a2b8 = '\x01';
            }
          }
          uVar4 = FUN_00458440();
          FUN_0045a220(0);
          return uVar4;
        }
      } while( true );
    }
  } while( true );
}

