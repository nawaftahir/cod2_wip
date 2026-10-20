
void __fastcall FUN_0048ccd0(undefined4 param_1,int param_2,float param_3,float param_4)

{
  int iVar1;
  int unaff_EBX;
  
  iVar1 = 0;
  if (0 < unaff_EBX) {
    do {
      if (param_3 <= *(float *)(param_2 + iVar1 * 4)) {
        if (param_4 < *(float *)(param_2 + iVar1 * 4)) {
          *(float *)(param_2 + iVar1 * 4) = param_4;
        }
      }
      else {
        *(float *)(param_2 + iVar1 * 4) = param_3;
      }
      iVar1 = iVar1 + 1;
    } while (iVar1 < unaff_EBX);
  }
  return;
}

