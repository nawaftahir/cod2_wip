
void FUN_00494260(undefined4 param_1,uint param_2,uint param_3,uint param_4,int param_5,int param_6,
                 int param_7)

{
  int iVar1;
  uint *unaff_EDI;
  
  FUN_00494000();
  FUN_004941f0();
  unaff_EDI[param_5] = param_2;
  unaff_EDI[param_6] = param_3;
  unaff_EDI[param_7] = 0;
  unaff_EDI[3] = param_4;
  if ((((((*unaff_EDI & 0x7f800000) == 0x7f800000) || ((unaff_EDI[1] & 0x7f800000) == 0x7f800000))
       || ((unaff_EDI[2] & 0x7f800000) == 0x7f800000)) ||
      ((unaff_EDI[3] & 0x7f800000) == 0x7f800000)) && (DAT_0124a4d3 == '\0')) {
    iVar1 = FUN_0047d980("!IS_NAN((vec)[0]) && !IS_NAN((vec)[1]) && !IS_NAN((vec)[2]) && !IS_NAN((vec)[3])"
                         ,"\\trees\\cod2src\\src\\universal\\linearmapping.cpp",0x9f,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4d3 = 1;
      return;
    }
  }
  return;
}

