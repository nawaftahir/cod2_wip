
int FUN_0041e950(void)

{
  int iVar1;
  int unaff_ESI;
  int *unaff_EDI;
  
  if ((unaff_ESI < 0) && (DAT_0124a0f9 == '\0')) {
    iVar1 = FUN_0047d980("index >= 0","e:\\trees\\cod2src\\src\\universal\\splines\\util_list.h",
                         0xdb,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0f9 = '\x01';
    }
  }
  if ((*unaff_EDI <= unaff_ESI) && (DAT_0124a0f8 == '\0')) {
    iVar1 = FUN_0047d980("index < m_num","e:\\trees\\cod2src\\src\\universal\\splines\\util_list.h",
                         0xdc,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0f8 = 1;
      return unaff_EDI[3] + unaff_ESI * 4;
    }
  }
  return unaff_EDI[3] + unaff_ESI * 4;
}

