// 10009770 size=161 FUN_10009770

void FUN_10009770(undefined1 *param_1)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  float10 fVar4;
  
  if (0xff < DAT_101ce5e0) {
    FUN_100138c0(1,"More than %i queued portals",0x100);
  }
  *param_1 = 1;
  fVar4 = (float10)FUN_10006660();
  iVar3 = DAT_101ce5e0;
  while ((iVar2 = iVar3 + -1 >> 1, -1 < iVar2 &&
         (puVar1 = (undefined4 *)(DAT_101ce5e4 + iVar2 * 8),
         fVar4 < (float10)*(float *)(DAT_101ce5e4 + 4 + iVar2 * 8)))) {
    *(undefined4 *)(DAT_101ce5e4 + iVar3 * 8) = *puVar1;
    *(undefined4 *)(DAT_101ce5e4 + 4 + iVar3 * 8) = puVar1[1];
    iVar3 = iVar2;
  }
  *(undefined1 **)(DAT_101ce5e4 + iVar3 * 8) = param_1;
  *(float *)(DAT_101ce5e4 + 4 + iVar3 * 8) = (float)fVar4;
  DAT_101ce5e0 = DAT_101ce5e0 + 1;
  return;
}


