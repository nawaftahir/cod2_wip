// 10002840 size=246 FUN_10002840

void FUN_10002840(void)

{
  int iVar1;
  bool bVar2;
  float *in_EDX;
  float *unaff_ESI;
  int iVar3;
  int local_4;
  
  *unaff_ESI = 0.0;
  unaff_ESI[1] = 0.0;
  unaff_ESI[2] = 0.0;
  *in_EDX = 0.0;
  in_EDX[1] = 0.0;
  in_EDX[2] = 0.0;
  bVar2 = false;
  local_4 = 0;
  if (0 < DAT_101ae298) {
    iVar3 = 0;
    do {
      iVar1 = *(int *)(iVar3 + 8 + DAT_101ae29c);
      if (!bVar2) {
        *unaff_ESI = *(float *)(iVar1 + 4);
        unaff_ESI[1] = *(float *)(iVar1 + 8);
        unaff_ESI[2] = *(float *)(iVar1 + 0xc);
        *in_EDX = *(float *)(iVar1 + 0x10);
        in_EDX[1] = *(float *)(iVar1 + 0x14);
        in_EDX[2] = *(float *)(iVar1 + 0x18);
        bVar2 = true;
      }
      if (*(float *)(iVar1 + 4) < *unaff_ESI) {
        *unaff_ESI = *(float *)(iVar1 + 4);
      }
      if (*in_EDX < *(float *)(iVar1 + 0x10)) {
        *in_EDX = *(float *)(iVar1 + 0x10);
      }
      if (*(float *)(iVar1 + 8) < unaff_ESI[1]) {
        unaff_ESI[1] = *(float *)(iVar1 + 8);
      }
      if (in_EDX[1] < *(float *)(iVar1 + 0x14)) {
        in_EDX[1] = *(float *)(iVar1 + 0x14);
      }
      if (*(float *)(iVar1 + 0xc) < unaff_ESI[2]) {
        unaff_ESI[2] = *(float *)(iVar1 + 0xc);
      }
      if (in_EDX[2] < *(float *)(iVar1 + 0x18)) {
        in_EDX[2] = *(float *)(iVar1 + 0x18);
      }
      local_4 = local_4 + 1;
      iVar3 = iVar3 + 0xc;
    } while (local_4 < DAT_101ae298);
  }
  return;
}


