// 10014fc0 size=193 FUN_10014fc0

int FUN_10014fc0(undefined4 param_1,undefined4 param_2,int param_3)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  undefined *puVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  int local_80 [32];
  
  iVar4 = 0;
  iVar1 = 0;
  if (0 < DAT_10678514) {
    puVar3 = &DAT_10678518;
    do {
      if ((&DAT_10678a98)[iVar1] == '\0') {
        local_80[iVar4] = (int)puVar3;
        iVar4 = iVar4 + 1;
      }
      iVar1 = iVar1 + 1;
      puVar3 = puVar3 + 0x2c;
    } while (iVar1 < DAT_10678514);
  }
  if (*(int *)(DAT_101ce6fc + 8) < in_EAX) {
    in_EAX = *(int *)(DAT_101ce6fc + 8);
  }
  if (in_EAX < iVar4) {
    FUN_10014f30(iVar4,in_EAX);
    iVar4 = in_EAX;
  }
  iVar1 = 0;
  iVar6 = 0;
  if (0 < iVar4) {
    piVar5 = (int *)(param_3 + 4);
    do {
      iVar2 = local_80[iVar6];
      piVar5[-1] = iVar2;
      *piVar5 = DAT_10678ab8;
      FUN_10014d90(iVar2 + 4,*(undefined4 *)(iVar2 + 0x10));
      iVar2 = DAT_10678ab8 - *piVar5;
      piVar5[1] = iVar2;
      if (iVar2 != 0) {
        iVar1 = iVar1 + 1;
        piVar5 = piVar5 + 3;
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 < iVar4);
  }
  return iVar1;
}


