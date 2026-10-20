
int * FUN_00420fe0(void)

{
  int *piVar1;
  void *pvVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *unaff_EBX;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  
  piVar1 = _malloc(0x14);
  *piVar1 = unaff_EBX[1];
  iVar5 = *unaff_EBX;
  piVar1[1] = iVar5;
  pvVar2 = _malloc(*piVar1 * iVar5 * 0x2c);
  piVar1[3] = (int)pvVar2;
  iVar5 = 0;
  if (0 < unaff_EBX[1]) {
    iVar6 = *unaff_EBX;
    do {
      iVar3 = 0;
      if (0 < iVar6) {
        do {
          puVar7 = (undefined4 *)((iVar6 * iVar5 + iVar3) * 0x2c + unaff_EBX[3]);
          puVar8 = (undefined4 *)((unaff_EBX[1] * iVar3 + iVar5) * 0x2c + piVar1[3]);
          for (iVar4 = 0xb; iVar4 != 0; iVar4 = iVar4 + -1) {
            *puVar8 = *puVar7;
            puVar7 = puVar7 + 1;
            puVar8 = puVar8 + 1;
          }
          iVar6 = *unaff_EBX;
          iVar3 = iVar3 + 1;
        } while (iVar3 < iVar6);
      }
      iVar5 = iVar5 + 1;
    } while (iVar5 < unaff_EBX[1]);
  }
  _free(unaff_EBX);
  return piVar1;
}

