// 10098fd3 size=638 FUN_10098fd3

int FUN_10098fd3(void)

{
  uint *puVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  int in_ECX;
  uint uVar13;
  uint local_8;
  
  iVar4 = FUN_1008b71d();
  if ((((-1 < iVar4) && (iVar4 = FUN_1008bec4(), -1 < iVar4)) &&
      (iVar4 = FUN_10094810(), -1 < iVar4)) &&
     ((iVar4 = FUN_10086eae(), -1 < iVar4 && (iVar4 = FUN_1008d525(), -1 < iVar4)))) {
    uVar13 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar13 * 4);
        if ((undefined *)(*puVar1 & 0xfff00000) == &DAT_10200000) {
          *puVar1 = puVar1[3] & 0xfffff | 0x10000000;
        }
        uVar13 = uVar13 + 1;
      } while (uVar13 < *(uint *)(in_ECX + 0xc));
    }
    if ((*(byte *)(in_ECX + 0xcc) & 4) == 0) {
      iVar4 = FUN_1008f667();
      if ((-1 < iVar4) && (iVar4 = FUN_1008bbde(), -1 < iVar4)) {
        local_8 = 0;
        do {
          iVar4 = FUN_10093c67();
          if (iVar4 == 0) {
            iVar4 = 0;
          }
          else if (iVar4 < 0) {
            return iVar4;
          }
          iVar5 = FUN_1008bec4();
          if (iVar5 == 0) {
            iVar5 = 0;
          }
          else if (iVar5 < 0) {
            return iVar5;
          }
          iVar6 = FUN_100949dc();
          if (iVar6 == 0) {
            iVar6 = 0;
          }
          else if (iVar6 < 0) {
            return iVar6;
          }
          iVar7 = FUN_10094eb4(0);
          if (iVar7 == 0) {
            iVar7 = 0;
          }
          else if (iVar7 < 0) {
            return iVar7;
          }
          iVar8 = FUN_1008c376();
          if (iVar8 == 0) {
            iVar8 = 0;
          }
          else if (iVar8 < 0) {
            return iVar8;
          }
          iVar9 = FUN_1009513b();
          if (iVar9 == 0) {
            iVar9 = 0;
          }
          else if (iVar9 < 0) {
            return iVar9;
          }
          iVar10 = FUN_1008c847();
          if (iVar10 == 0) {
            iVar10 = 0;
          }
          else if (iVar10 < 0) {
            return iVar10;
          }
          iVar11 = FUN_1008cb4b();
          if (iVar11 == 0) {
            iVar11 = 0;
          }
          else if (iVar11 < 0) {
            return iVar11;
          }
          iVar12 = FUN_1009698a();
          if (iVar12 == 0) {
            iVar12 = 0;
          }
          else if (iVar12 < 0) {
            return iVar12;
          }
        } while ((iVar12 == 0 ||
                  (((((((iVar4 == 0 || iVar5 == 0) || iVar6 == 0) || iVar7 == 0) || iVar8 == 0) ||
                    iVar9 == 0) || iVar10 == 0) || iVar11 == 0)) &&
                (local_8 = local_8 + 1, local_8 < 0x100));
        if (local_8 == 0x100) {
          FUN_1008b13a();
        }
        uVar13 = 0;
        if (*(int *)(in_ECX + 8) != 0) {
          do {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + uVar13 * 4);
            uVar2 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4);
            if (((uVar2 & 0x100) != 0) && ((uVar2 & 0xc00) == 0)) {
              uVar3 = *(undefined4 *)(in_ECX + 0x78);
              *(undefined4 *)(iVar4 + 0xc) = 0xffffffff;
              *(undefined4 *)(iVar4 + 0x10) = 0xffffffff;
              *(undefined4 *)(iVar4 + 4) = uVar3;
            }
            uVar13 = uVar13 + 1;
          } while (uVar13 < *(uint *)(in_ECX + 8));
        }
        iVar4 = FUN_1009370b();
        if ((((-1 < iVar4) && (iVar4 = FUN_1008d26d(), -1 < iVar4)) &&
            (iVar4 = FUN_10094810(), -1 < iVar4)) &&
           ((iVar4 = FUN_10086eae(), -1 < iVar4 && (iVar4 = FUN_1008d525(), -1 < iVar4)))) {
          *(undefined4 *)(in_ECX + 0xd8) = 1;
          iVar4 = 0;
        }
      }
    }
    else {
      *(undefined4 *)(in_ECX + 0xd8) = 1;
      iVar4 = 0;
    }
  }
  return iVar4;
}


