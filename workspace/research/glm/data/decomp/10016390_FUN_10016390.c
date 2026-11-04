// 10016390 size=150 FUN_10016390

float * FUN_10016390(void)

{
  float *pfVar1;
  int iVar2;
  float *unaff_EDI;
  
  iVar2 = 0;
  if (0 < DAT_101da2d4) {
    pfVar1 = (float *)&DAT_101da2e0;
    do {
      if ((((*unaff_EDI == pfVar1[-2]) && (unaff_EDI[1] == pfVar1[-1])) && (unaff_EDI[2] == *pfVar1)
          ) && (unaff_EDI[3] == pfVar1[1])) {
        return (float *)(&DAT_101da2d8 + iVar2 * 4);
      }
      iVar2 = iVar2 + 1;
      pfVar1 = pfVar1 + 4;
    } while (iVar2 < DAT_101da2d4);
    if (iVar2 == 0x10) {
      FUN_100138c0(1,"more than %i shader literals used",0x10);
    }
  }
  (&DAT_101da2d8)[iVar2 * 4] = *unaff_EDI;
  (&DAT_101da2dc)[iVar2 * 4] = unaff_EDI[1];
  (&DAT_101da2e0)[iVar2 * 4] = unaff_EDI[2];
  (&DAT_101da2e4)[iVar2 * 4] = unaff_EDI[3];
  return (float *)(&DAT_101da2d8 + iVar2 * 4);
}


