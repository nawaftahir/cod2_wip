
undefined4 FUN_00462bf0(void)

{
  int iVar1;
  int *unaff_ESI;
  int unaff_EDI;
  
  if ((unaff_ESI[3] != 0) && (*unaff_ESI != 0)) {
    if ((unaff_EDI < 0) && (DAT_0124a2bb == '\0')) {
      iVar1 = FUN_0047d980("index >= 0","e:\\trees\\cod2src\\src\\universal\\splines\\util_list.h",
                           0x131,0,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a2bb = '\x01';
      }
    }
    if ((*unaff_ESI <= unaff_EDI) && (DAT_0124a2ba == '\0')) {
      iVar1 = FUN_0047d980("index < m_num",
                           "e:\\trees\\cod2src\\src\\universal\\splines\\util_list.h",0x132,0,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a2ba = '\x01';
      }
    }
    if ((-1 < unaff_EDI) && (unaff_EDI < *unaff_ESI)) {
      iVar1 = *unaff_ESI + -1;
      *unaff_ESI = iVar1;
      if (unaff_EDI < iVar1) {
        do {
          *(undefined4 *)(unaff_ESI[3] + unaff_EDI * 4) =
               *(undefined4 *)(unaff_ESI[3] + 4 + unaff_EDI * 4);
          unaff_EDI = unaff_EDI + 1;
        } while (unaff_EDI < *unaff_ESI);
      }
      return 1;
    }
  }
  return 0;
}

