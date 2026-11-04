// 10009480 size=234 FUN_10009480

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10009480(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  float *pfVar3;
  float10 fVar4;
  
  if (*(int *)(DAT_101d7e94 + param_1 * 8) != DAT_10678500) {
    *(int *)(DAT_101d7e94 + param_1 * 8) = DAT_10678500;
    pfVar3 = (float *)(param_1 * 0x60 + *(int *)(DAT_101d1b9c + 0xf8));
    if ((*(float *)(param_1 * 0x60 + *(int *)(DAT_101d1b9c + 0xf8)) != 0.0) &&
       (fVar4 = (float10)FUN_10058d20(),
       (float10)*pfVar3 < fVar4 * (float10)_DAT_101d7e88 + (float10)_DAT_101d7e8c)) {
      return;
    }
    if (*(char *)(DAT_101ce738 + 8) != '\0') {
      uVar1 = (*(code *)RI_XModelGetSurfaceName)(pfVar3[4]);
      FUN_10005680(pfVar3 + 1,0x3e99999a,uVar1);
    }
    iVar2 = FUN_10023b90(param_1);
    if (-1 < iVar2) {
      FUN_1001f6f0(&DAT_10678ac4 + iVar2 * 0x34,iVar2 * 0x74 + DAT_10678510,param_1);
      *(undefined4 *)(&DAT_10678ad0 + iVar2 * 0x34) = 5;
      FUN_10024680(iVar2);
    }
  }
  return;
}


