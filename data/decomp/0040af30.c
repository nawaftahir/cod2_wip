
undefined4 FUN_0040af30(void)

{
  int iVar1;
  int *unaff_ESI;
  
  if ((*unaff_ESI == 0) && (DAT_0124a0ba == '\0')) {
    iVar1 = FUN_0047d980("m_data","e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",0x11a,0,
                         1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0ba = 1;
      return *(undefined4 *)(*unaff_ESI + 8);
    }
  }
  return *(undefined4 *)(*unaff_ESI + 8);
}

