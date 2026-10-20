
int FUN_00499210(int param_1)

{
  int iVar1;
  int unaff_ESI;
  
  if (((unaff_ESI < 0) || (3 < unaff_ESI)) && (DAT_0124a611 == '\0')) {
    iVar1 = FUN_0047d980("(index >= 0) && (index < 4)",
                         "e:\\trees\\cod2src\\src\\universal\\splines\\math_quaternion.h",0x52,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a611 = 1;
      return param_1 + unaff_ESI * 4;
    }
  }
  return param_1 + unaff_ESI * 4;
}

