// 100266f0 size=97 FUN_100266f0

void FUN_100266f0(void)

{
  undefined4 uVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int unaff_EDI;
  
  iVar6 = 0;
  uVar2 = DAT_101d4928;
  if (DAT_101d4928 >> 1 != 0) {
    do {
      uVar5 = (uint)uVar2;
      iVar7 = 0;
      if (uVar5 != 0) {
        do {
          iVar4 = (uVar5 * iVar6 + iVar7) * 4;
          uVar1 = *(undefined4 *)(iVar4 + unaff_EDI);
          iVar3 = (((uVar5 - iVar6) + -1) * uVar5 + iVar7) * 4;
          *(undefined4 *)(iVar4 + unaff_EDI) = *(undefined4 *)(iVar3 + unaff_EDI);
          *(undefined4 *)(iVar3 + unaff_EDI) = uVar1;
          uVar5 = (uint)DAT_101d4928;
          iVar7 = iVar7 + 1;
          uVar2 = DAT_101d4928;
        } while (iVar7 < (int)uVar5);
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 < (int)(uint)(uVar2 >> 1));
  }
  return;
}


