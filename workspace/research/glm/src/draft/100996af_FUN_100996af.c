extern int FUN_1006506e();
extern int FUN_10082872();
extern int FUN_10082916();


unsigned int FUN_100996af(int param_1,int param_2)

{
  int *piVar1;
  byte bVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  byte *pbVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  byte *pbVar9;
  unsigned int uVar10;
  int *piVar11;
  unsigned char bVar12;
  
  iVar8 = *(int *)(param_2 + 0x14);
  piVar11 = (int *)(param_1 + 0x1c);
  if (*piVar11 != 0) {
    do {
      iVar7 = *piVar11;
      pbVar9 = *(byte **)(iVar8 + 0x18);
      pbVar5 = *(byte **)(iVar7 + 0x10);
      do {
        bVar2 = *pbVar9;
        bVar12 = bVar2 < *pbVar5;
        if (bVar2 != *pbVar5) {
LAB_100996f8:
          iVar6 = (1 - (unsigned int)bVar12) - (unsigned int)(bVar12 != 0);
          goto LAB_100996fd;
        }
        if (bVar2 == 0) break;
        bVar2 = pbVar9[1];
        bVar12 = bVar2 < pbVar5[1];
        if (bVar2 != pbVar5[1]) goto LAB_100996f8;
        pbVar9 = pbVar9 + 2;
        pbVar5 = pbVar5 + 2;
      } while (bVar2 != 0);
      iVar6 = 0;
LAB_100996fd:
      if (iVar6 < 0) {
        piVar11 = (int *)(iVar7 + 8);
      }
      else {
        if (iVar6 < 1) break;
        piVar11 = (int *)(iVar7 + 0xc);
      }
    } while (*piVar11 != 0);
    if (*piVar11 != 0) goto LAB_1009973f;
  }
  iVar7 = FUN_1006506e(0x18);
  if (iVar7 == 0) {
    iVar8 = 0;
  }
  else {
    iVar8 = FUN_10082916(*(unsigned int *)(iVar8 + 0x18),0,0,0);
  }
  *piVar11 = iVar8;
  if (iVar8 == 0) {
    return 0x8007000e;
  }
LAB_1009973f:
  iVar8 = FUN_1006506e(0x14);
  uVar10 = 0;
  if (iVar8 == 0) {
    iVar8 = 0;
  }
  else {
    iVar8 = FUN_10082872(param_2,*(unsigned int *)(*piVar11 + 0x14),"Stmts");
  }
  *(int *)(*piVar11 + 0x14) = iVar8;
  if (iVar8 == 0) {
    return 0x8007000e;
  }
  if (*(int *)(*(int *)(*piVar11 + 0x14) + 0xc) == 0) {
    iVar8 = *piVar11;
    piVar1 = piVar11;
    while (iVar8 != 0) {
      while ((iVar8 = *piVar1, iVar8 != 0 && (iVar7 = *(int *)(iVar8 + 8), iVar7 != 0))) {
        uVar3 = *(unsigned int *)(iVar7 + 0xc);
        *(int *)(iVar7 + 0xc) = iVar8;
        *(unsigned int *)(iVar8 + 8) = uVar3;
        *piVar1 = iVar7;
      }
      piVar1 = (int *)(iVar8 + 0xc);
      uVar10 = uVar10 + 1;
      iVar8 = *piVar1;
    }
    while (uVar10 = uVar10 >> 1, uVar4 = uVar10, piVar1 = piVar11, uVar10 != 0) {
      for (; uVar4 != 0; uVar4 = uVar4 - 1) {
        iVar8 = *piVar1;
        if ((iVar8 != 0) && (iVar7 = *(int *)(iVar8 + 0xc), iVar7 != 0)) {
          uVar3 = *(unsigned int *)(iVar7 + 8);
          *(int *)(iVar7 + 8) = iVar8;
          *(unsigned int *)(iVar8 + 0xc) = uVar3;
          *piVar1 = iVar7;
        }
        piVar1 = (int *)(*piVar1 + 0xc);
      }
    }
  }
  return 0;
}


