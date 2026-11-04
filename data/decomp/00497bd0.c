
void __fastcall FUN_00497bd0(float *param_1,float *param_2,float param_3)

{
  float *in_EAX;
  int iVar1;
  
  if ((param_1 == in_EAX) && (DAT_0124a4e0 == '\0')) {
    iVar1 = FUN_0047d980("plane != out","\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x626,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4e0 = '\x01';
    }
  }
  FUN_004977a0();
  in_EAX[3] = *param_2 * *in_EAX +
              param_3 * param_1[3] + param_2[1] * in_EAX[1] + param_2[2] * in_EAX[2];
  return;
}

