// 100079d0 size=68 FUN_100079d0

undefined2 FUN_100079d0(void)

{
  int in_EAX;
  float *pfVar1;
  int iVar2;
  float *unaff_EDI;
  
  iVar2 = 0;
  if (0 < *(int *)(in_EAX + 0x10)) {
    pfVar1 = *(float **)(in_EAX + 0x14);
    do {
      if (0.0 < *pfVar1 * *unaff_EDI + pfVar1[2] * unaff_EDI[2] + pfVar1[1] * unaff_EDI[1] +
                unaff_EDI[3]) {
        return 0;
      }
      iVar2 = iVar2 + 1;
      pfVar1 = pfVar1 + 3;
    } while (iVar2 < *(int *)(in_EAX + 0x10));
  }
  return 1;
}


