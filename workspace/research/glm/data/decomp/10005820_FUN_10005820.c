// 10005820 size=143 FUN_10005820

void FUN_10005820(void)

{
  int *unaff_ESI;
  
  if (unaff_ESI[3] != 0) {
    (*(code *)RI_Z_FreeInternal)(unaff_ESI[3]);
    unaff_ESI[3] = 0;
  }
  if (*unaff_ESI != 0) {
    (*(code *)RI_Z_FreeInternal)(*unaff_ESI);
    *unaff_ESI = 0;
  }
  if (unaff_ESI[6] != 0) {
    (*(code *)RI_Z_FreeInternal)(unaff_ESI[6]);
    unaff_ESI[6] = 0;
  }
  if (unaff_ESI[9] != 0) {
    (*(code *)RI_Z_FreeInternal)(unaff_ESI[9]);
    unaff_ESI[9] = 0;
  }
  if (unaff_ESI[0xc] != 0) {
    (*(code *)RI_Z_FreeInternal)(unaff_ESI[0xc]);
    unaff_ESI[0xc] = 0;
  }
  if (unaff_ESI[0xf] != 0) {
    (*(code *)RI_Z_FreeInternal)(unaff_ESI[0xf]);
    unaff_ESI[0xf] = 0;
  }
  if (unaff_ESI[0x12] != 0) {
    (*(code *)RI_Z_FreeInternal)(unaff_ESI[0x12]);
    unaff_ESI[0x12] = 0;
  }
  return;
}


