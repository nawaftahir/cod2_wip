
undefined2 __fastcall FUN_00469100(undefined4 param_1,int param_2)

{
  bool bVar1;
  int iVar2;
  float *pfVar3;
  
  pfVar3 = (float *)(param_2 + 0x2c);
  iVar2 = 0;
  while ((bVar1 = pfVar3[-3] < *(float *)((int)&DAT_00591ce8 + iVar2),
         pfVar3[-3] <= *(float *)((int)&DAT_00591ce8 + iVar2) &&
         (bVar1 = *pfVar3 < *(float *)((int)&DAT_00591cdc + iVar2), !bVar1))) {
    iVar2 = iVar2 + 4;
    pfVar3 = pfVar3 + 1;
    if (0xb < iVar2) {
      return 0;
    }
  }
  return CONCAT11(bVar1,1);
}

