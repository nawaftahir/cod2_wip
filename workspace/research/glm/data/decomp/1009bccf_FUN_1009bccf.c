// 1009bccf size=254 FUN_1009bccf

int FUN_1009bccf(int *param_1,int *param_2,undefined4 *param_3,undefined4 *param_4,int *param_5)

{
  int *piVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  int *piVar5;
  
  piVar1 = param_2;
  if ((param_3 != (undefined4 *)0x0) && (param_4 != (undefined4 *)0x0)) {
    *param_3 = 0;
    *param_4 = 0;
    if (param_5 != (int *)0x0) {
      *param_5 = 0;
    }
    if (param_1 == (int *)0x0) {
      if (param_2 == (int *)0x0) {
        return 0;
      }
    }
    else if (param_2 != (int *)0x0) {
      uVar2 = FUN_10099b4f(param_1);
      uVar3 = FUN_10099b4f(piVar1);
      if ((((uVar3 <= uVar2) &&
           (iVar4 = FUN_1009b666(param_1,piVar1,0), piVar5 = param_1, iVar4 != 0)) ||
          (iVar4 = FUN_1009b666(piVar1,param_1,0), piVar5 = piVar1, iVar4 != 0)) ||
         (iVar4 = FUN_1009b666(param_1,piVar1,0), piVar5 = param_1, iVar4 != 0)) {
        iVar4 = FUN_1009a02d(param_1,piVar1,&param_2);
        piVar1 = param_2;
        if (iVar4 < 0) {
          return iVar4;
        }
        if ((int *)piVar5[5] != param_2) {
          piVar5 = (int *)(**(code **)(*piVar5 + 4))();
          if (piVar5 == (int *)0x0) {
            return -0x7ff8fff2;
          }
          piVar5[5] = (int)piVar1;
        }
        piVar1 = param_5;
        if (param_5 != (int *)0x0) {
          iVar4 = (**(code **)(*piVar5 + 4))();
          *piVar1 = iVar4;
          if (iVar4 == 0) {
            return -0x7ff8fff2;
          }
          FUN_1009991f(iVar4,1);
        }
        *param_3 = piVar5;
        *param_4 = piVar5;
        return 0;
      }
    }
  }
  return -0x7fffbffb;
}


