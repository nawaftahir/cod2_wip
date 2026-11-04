
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00489410(float param_1)

{
  float *in_EAX;
  int iVar1;
  
  if ((((*in_EAX == _DAT_00556a70) && (in_EAX[1] == _DAT_00556a70)) && (in_EAX[2] == _DAT_00556a70))
     && (DAT_0124a3c2 == '\0')) {
    iVar1 = FUN_0047d980("normal[0] || normal[1] || normal[2]",
                         "\\trees\\cod2src\\src\\universal\\com_math.cpp",0xf06,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3c2 = '\x01';
    }
  }
  fcos((float10)(param_1 * _DAT_00556b88));
  fsin((float10)(param_1 * _DAT_00556b88));
  FUN_00488b70();
  FUN_00484640();
  return;
}

