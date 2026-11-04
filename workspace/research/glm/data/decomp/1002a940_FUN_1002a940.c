// 1002a940 size=121 FUN_1002a940

undefined4 FUN_1002a940(void)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int iStack_8;
  
  iVar1 = (*(code *)RI_Hunk_OverrideDataForFile)();
  iVar5 = 0;
  if (0 < iVar1) {
    do {
      iVar2 = (*(code *)RI_XModelPrecache)();
      iVar4 = 0;
      if (0 < iVar2) {
        do {
          if (*(short *)(*(int *)(iStack_8 + iVar4 * 4) + 6) == -1) {
            uVar3 = (*(code *)RI_XModelGetSurfaceName)();
            FUN_10061c80("^1ERROR: model \'%s\' is not a valid static model, since lod %i surf %i has more than one bone.  Static models should be set to \'rigid\' in asset manager.\n"
                         ,uVar3,iVar5,iVar4);
            return 0;
          }
          iVar4 = iVar4 + 1;
        } while (iVar4 < iVar2);
      }
      iVar5 = iVar5 + 1;
    } while (iVar5 < iVar1);
  }
  return 1;
}


