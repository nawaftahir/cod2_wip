
undefined4 __fastcall FUN_00467ec0(undefined4 param_1,int param_2,undefined4 param_3,float param_4)

{
  int iVar1;
  float *pfVar2;
  
  iVar1 = 0;
  pfVar2 = (float *)(param_2 + 0x20);
  do {
    if (pfVar2[3] - *pfVar2 < param_4) {
      FUN_0047a5b0("Possible problem brush (too small) #%i ",param_3);
      return 1;
    }
    iVar1 = iVar1 + 1;
    pfVar2 = pfVar2 + 1;
  } while (iVar1 < 3);
  return 0;
}

