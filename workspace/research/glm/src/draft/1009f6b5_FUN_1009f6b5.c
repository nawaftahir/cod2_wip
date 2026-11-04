extern int FUN_1006506e();
extern int FUN_10082816();
extern int FUN_10082872();
extern int FUN_10083159();
extern int FUN_100994dd();
extern int FUN_10099ad8();
extern int FUN_1009a36a();
extern int FUN_1009a44a();
extern int FUN_1009ee58();


int FUN_1009f6b5(int *param_1,int *param_2,int *param_3)

{
  int iVar1;
  int iVar2;
  unsigned char local_1c [16];
  double local_c;
  
  if (param_1 != (int *)0x0) {
    if ((param_1[6] * param_1[5] == 1) && (iVar1 = FUN_10099ad8(param_1[4]), iVar1 != 0)) {
      iVar1 = FUN_1009a44a(param_1);
      if (((iVar1 != 0) && (iVar1 = FUN_1009ee58(param_1,local_1c), -1 < iVar1)) &&
         (iVar1 = FUN_1009a36a(&local_c,local_1c,param_1 + 0xc), -1 < iVar1)) {
        if (local_c == 0.0) {
          param_2 = param_3;
        }
        iVar1 = FUN_10082816(param_2);
        return iVar1;
      }
      iVar1 = FUN_1006506e(0x24);
      if (iVar1 == 0) {
        iVar1 = 0;
      }
      else {
        iVar1 = FUN_10083159();
      }
      if (iVar1 != 0) {
        *(unsigned int *)(iVar1 + 0x10) = 2;
        iVar2 = (**(void **)(*param_1 + 4))();
        *(int *)(iVar1 + 0x18) = iVar2;
        if (iVar2 != 0) {
          if (param_2 != (int *)0x0) {
            iVar2 = (**(void **)(*param_2 + 4))();
            *(int *)(iVar1 + 0x1c) = iVar2;
            if (iVar2 == 0) {
              return 0;
            }
          }
          if (param_3 != (int *)0x0) {
            iVar2 = (**(void **)(*param_3 + 4))();
            *(int *)(iVar1 + 0x20) = iVar2;
            if (iVar2 == 0) {
              return 0;
            }
          }
          iVar2 = FUN_1006506e(0x14);
          if (iVar2 == 0) {
            iVar1 = 0;
          }
          else {
            iVar1 = FUN_10082872(iVar1,0,"Stmts");
          }
          if (iVar1 != 0) {
            return iVar1;
          }
        }
      }
    }
    else {
      FUN_100994dd();
    }
  }
  return 0;
}


