extern int FUN_1007cf9e();


unsigned int
FUN_1007d48d(unsigned int param_1,unsigned int param_2,int param_3,unsigned int param_4,unsigned int param_5
            ,unsigned int param_6,unsigned int *param_7,unsigned int *param_8)

{
  unsigned int uVar1;
  
  if (param_7 != (unsigned int *)0x0) {
    *param_7 = 0;
  }
  if (param_8 != (unsigned int *)0x0) {
    *param_8 = 0;
  }
  if (param_3 == 0) {
    uVar1 = 0x8876086c;
  }
  else {
    uVar1 = FUN_1007cf9e(param_1,param_2,param_3,0,0,0,param_4,param_5,param_6,param_7,param_8);
  }
  return uVar1;
}


