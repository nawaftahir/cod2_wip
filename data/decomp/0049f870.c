
undefined * FUN_0049f870(void)

{
  int *in_EAX;
  int iVar1;
  int unaff_ESI;
  
  if ((*in_EAX == 0) && (DAT_0124a630 == '\0')) {
    iVar1 = FUN_0047d980("m_data","e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",0x157,0,
                         1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a630 = '\x01';
    }
  }
  FUN_004a02b0();
  if ((int *)*in_EAX != (int *)0x0) {
    if (((unaff_ESI < 0) || (*(int *)*in_EAX <= unaff_ESI)) && (DAT_0124a62f == '\0')) {
      iVar1 = FUN_0047d980("(index >= 0) && (index < m_data->len)",
                           "e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",0x161,0,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a62f = '\x01';
      }
    }
    if ((-1 < unaff_ESI) && (unaff_ESI < *(int *)*in_EAX)) {
      return (undefined *)(((int *)*in_EAX)[2] + unaff_ESI);
    }
  }
  return &DAT_0124a631;
}

