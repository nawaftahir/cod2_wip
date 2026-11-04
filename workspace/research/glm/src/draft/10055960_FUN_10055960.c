extern unsigned int DAT_101911f0;


int FUN_10055960(int *param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  unsigned char bVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  
  iVar1 = param_1[0x1b];
  iVar2 = param_1[0x17];
  iVar7 = 1;
  do {
    iVar9 = iVar7;
    iVar7 = iVar9 + 1;
    iVar4 = iVar7;
    if (1 < iVar1) {
      iVar6 = iVar1 + -1;
      do {
        iVar4 = iVar4 * iVar7;
        iVar6 = iVar6 + -1;
      } while (iVar6 != 0);
    }
  } while (iVar4 <= iVar2);
  if (iVar9 < 2) {
    *(unsigned int *)(*param_1 + 0x14) = 0x38;
    *(int *)(*param_1 + 0x18) = iVar4;
    (**(void **)*param_1)(param_1);
  }
  iVar4 = 1;
  iVar7 = iVar1;
  piVar8 = param_2;
  if (0 < iVar1) {
    for (; iVar6 = iVar1, iVar7 != 0; iVar7 = iVar7 + -1) {
      *piVar8 = iVar9;
      piVar8 = piVar8 + 1;
    }
    do {
      iVar4 = iVar4 * iVar9;
      iVar6 = iVar6 + -1;
    } while (iVar6 != 0);
  }
  do {
    iVar7 = 0;
    bVar3 = false;
    if (iVar1 < 1) {
      return iVar4;
    }
    do {
      iVar9 = iVar7;
      if (param_1[0xd] == 2) {
        iVar9 = (&DAT_101911f0)[iVar7];
      }
      iVar6 = param_2[iVar9] + 1;
      iVar5 = (iVar4 / param_2[iVar9]) * iVar6;
      if (iVar5 - iVar2 != 0 && iVar2 <= iVar5) {
        if (!bVar3) {
          return iVar4;
        }
        break;
      }
      iVar7 = iVar7 + 1;
      param_2[iVar9] = iVar6;
      bVar3 = true;
      iVar4 = iVar5;
    } while (iVar7 < iVar1);
  } while( true );
}


