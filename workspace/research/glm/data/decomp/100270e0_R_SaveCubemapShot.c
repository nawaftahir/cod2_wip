// 100270e0 size=139 R_SaveCubemapShot

void R_SaveCubemapShot(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int iStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  int iStack_8;
  int iStack_4;
  
  iVar2 = (uint)DAT_101d4928 * (uint)DAT_101d4928;
  iVar1 = (*(code *)RI_Z_MallocInternal)(iVar2 * 0x48);
  iVar2 = iVar2 * 0xc;
  iStack_14 = iVar2 + iVar1;
  iStack_10 = iStack_14 + iVar2;
  iStack_c = iStack_10 + iVar2;
  iStack_8 = iStack_c + iVar2;
  iStack_4 = iVar2 + iStack_8;
  iStack_18 = iVar1;
  FUN_10026fe0(&DAT_10696bb4,DAT_101d4928,DAT_101d4928);
  FUN_10026e60(&iStack_18,DAT_101d4928,DAT_101d4928,param_1,&DAT_10696bb4);
  (*(code *)RI_Z_FreeInternal)(iVar1);
  return;
}


