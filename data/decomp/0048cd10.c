
undefined2 __fastcall FUN_0048cd10(undefined4 param_1,int param_2,float param_3,float param_4)

{
  int iVar1;
  int unaff_ESI;
  
  iVar1 = 0;
  if (0 < unaff_ESI) {
    do {
      if ((*(float *)(param_2 + iVar1 * 4) < param_3) || (param_4 < *(float *)(param_2 + iVar1 * 4))
         ) {
        return 0;
      }
      iVar1 = iVar1 + 1;
    } while (iVar1 < unaff_ESI);
  }
  return 1;
}

