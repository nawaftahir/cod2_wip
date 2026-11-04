// 1002c470 size=252 FUN_1002c470

void FUN_1002c470(float param_1)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  int unaff_ESI;
  int unaff_EDI;
  int local_14;
  
  local_14 = -(*(int *)(unaff_ESI + 0x10) / 2);
  iVar2 = 0;
  if (local_14 < *(int *)(unaff_ESI + 0x10) / 2) {
    do {
      iVar3 = -(*(int *)(unaff_ESI + 0xc) / 2);
      if (iVar3 < *(int *)(unaff_ESI + 0xc) / 2) {
        do {
          if (*(float *)(*(int *)(unaff_ESI + 8) + iVar2 * 4) == 0.0) {
            *(undefined4 *)(unaff_EDI + iVar2 * 8) = 0;
            *(undefined4 *)(unaff_EDI + 4 + iVar2 * 8) = 0;
          }
          else {
            uVar1 = (int)ROUND(param_1 * *(float *)(*(int *)(unaff_ESI + 8) + iVar2 * 4) * 162.97466
                               + 9.313226e-10) & 0x3ff;
            *(float *)(unaff_EDI + iVar2 * 8) =
                 (float)(&DAT_101d6210)[uVar1 + 0xff & 0x3ff] *
                 *(float *)(*(int *)(unaff_ESI + 4) + iVar2 * 8);
            *(float *)(unaff_EDI + 4 + iVar2 * 8) =
                 (float)(&DAT_101d6210)[uVar1] * *(float *)(*(int *)(unaff_ESI + 4) + 4 + iVar2 * 8)
            ;
          }
          iVar2 = iVar2 + 1;
          iVar3 = iVar3 + 1;
        } while (iVar3 < *(int *)(unaff_ESI + 0xc) / 2);
      }
      local_14 = local_14 + 1;
    } while (local_14 < *(int *)(unaff_ESI + 0x10) / 2);
  }
  return;
}


