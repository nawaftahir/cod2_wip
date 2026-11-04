// 10009570 size=283 FUN_10009570

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10009570(int param_1,undefined4 param_2,undefined4 param_3)

{
  int *piVar1;
  char cVar2;
  undefined4 uVar3;
  int iVar4;
  float *pfVar5;
  float10 fVar6;
  
  iVar4 = DAT_10678500;
  piVar1 = (int *)(DAT_101d7e94 + param_1 * 8);
  if (*piVar1 != DAT_10678500) {
    pfVar5 = (float *)(param_1 * 0x60 + *(int *)(DAT_101d1b9c + 0xf8));
    if (*(float *)(param_1 * 0x60 + *(int *)(DAT_101d1b9c + 0xf8)) != 0.0) {
      fVar6 = (float10)FUN_10058d20();
      if ((float10)*pfVar5 < fVar6 * (float10)_DAT_101d7e88 + (float10)_DAT_101d7e8c) {
        *piVar1 = iVar4;
        return;
      }
    }
    cVar2 = FUN_10006300(param_3);
    iVar4 = DAT_101ce738;
    if (cVar2 == '\0') {
      *piVar1 = DAT_10678500;
      if (*(char *)(iVar4 + 8) != '\0') {
        uVar3 = (*(code *)RI_XModelGetSurfaceName)(pfVar5[4]);
        FUN_10005680(pfVar5 + 1,0x3e99999a,uVar3);
      }
      iVar4 = FUN_10023b90(param_1);
      if (-1 < iVar4) {
        FUN_1001f6f0(&DAT_10678ac4 + iVar4 * 0x34,iVar4 * 0x74 + DAT_10678510,param_1);
        *(undefined4 *)(&DAT_10678ad0 + iVar4 * 0x34) = 5;
        FUN_10024680(iVar4);
      }
    }
  }
  return;
}


