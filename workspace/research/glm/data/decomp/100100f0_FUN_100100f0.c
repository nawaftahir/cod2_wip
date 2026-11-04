// 100100f0 size=102 FUN_100100f0

void FUN_100100f0(int *param_1,undefined1 param_2)

{
  int *piVar1;
  undefined1 in_AL;
  undefined1 in_CL;
  undefined1 in_DL;
  
  piVar1 = param_1;
  param_1 = (int *)CONCAT13(param_2,CONCAT12(in_DL,CONCAT11(in_CL,in_AL)));
  FUN_1000ee30(1,1,1,3,0);
  if (*piVar1 == 4) {
    FUN_1000ec00(piVar1,0x15,0,&param_1);
    return;
  }
  FUN_1000ea20(0x15,&param_1);
  return;
}


