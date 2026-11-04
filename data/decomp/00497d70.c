
void __fastcall FUN_00497d70(float *param_1,float *param_2,float param_3)

{
  float *in_EAX;
  int iVar1;
  
  if ((param_1 == in_EAX) && (DAT_0124a4dd == '\0')) {
    iVar1 = FUN_0047d980("plane != out","\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x642,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4dd = '\x01';
    }
  }
  FUN_00497950();
  in_EAX[3] = (param_1[3] -
              (*param_2 * *param_1 + param_2[1] * param_1[1] + param_2[2] * param_1[2])) / param_3;
  return;
}

