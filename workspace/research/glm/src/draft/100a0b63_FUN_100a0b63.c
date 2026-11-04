extern int FUN_1006506e();
extern int FUN_10082db5();
extern int FUN_100994dd();
extern int FUN_100a07e3();


int FUN_100a0b63(int param_1,unsigned int param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = FUN_100a07e3(param_2,&param_2);
  if (iVar3 < 0) {
    FUN_100994dd();
  }
  else {
    iVar3 = FUN_1006506e(0x18);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10082db5(0,param_2);
    }
    if (iVar3 != 0) {
      piVar1 = &param_1;
      iVar2 = param_1;
      while ((iVar2 != 0 && (*(int *)(*piVar1 + 4) == 8))) {
        piVar1 = (int *)(*piVar1 + 0x10);
        iVar2 = *piVar1;
      }
      *(int *)(iVar3 + 0x10) = *piVar1;
      *piVar1 = iVar3;
      return param_1;
    }
  }
  return 0;
}


