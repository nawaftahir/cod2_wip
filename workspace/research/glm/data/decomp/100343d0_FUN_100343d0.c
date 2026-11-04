// 100343d0 size=233 FUN_100343d0

void FUN_100343d0(void)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uVar2 = (*(code *)RI_Z_MallocInternal)(0xaa50);
  iVar3 = 0;
  uStack_8 = 0;
  if (0 < *(int *)(DAT_106d3194 + 0x249d28)) {
    uStack_c = 0;
    iVar5 = DAT_106d3194;
    do {
      iVar6 = *(int *)(iVar5 + 0x249d24) + uStack_c;
      iVar1 = *(int *)(iVar5 + 0x249d18) +
              *(int *)(*(int *)(iVar5 + 0x249d24) + 0x10 + uStack_c) * 0xc;
      iVar4 = *(int *)(iVar6 + 0x14);
      if (0 < iVar4) {
        iVar8 = 0;
        iVar4 = (iVar4 * 3 + -3) * 4;
        iVar7 = 0;
        do {
          iVar3 = FUN_10034010(iVar4 + iVar1,iVar7 + iVar1,0,iVar3);
          iVar8 = iVar8 + 1;
          iVar4 = iVar7;
          iVar5 = DAT_106d3194;
          iVar7 = iVar7 + 0xc;
        } while (iVar8 < *(int *)(iVar6 + 0x14));
      }
      uStack_8 = uStack_8 + 1;
      uStack_c = uStack_c + 0x18;
    } while (uStack_8 < *(int *)(iVar5 + 0x249d28));
  }
  if (iVar3 / 2 != 0) {
    FUN_10031780(iVar3 / 2,1,uVar2,0);
  }
  (*(code *)RI_Z_FreeInternal)(uVar2);
  return;
}


