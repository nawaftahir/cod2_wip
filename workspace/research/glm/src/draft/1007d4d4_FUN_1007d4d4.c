extern int FUN_1007cf9e();


void FUN_1007d4d4(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
                 unsigned int param_5,unsigned int param_6,unsigned int param_7,unsigned int *param_8,
                 unsigned int *param_9)

{
  if (param_8 != (unsigned int *)0x0) {
    *param_8 = 0;
  }
  if (param_9 != (unsigned int *)0x0) {
    *param_9 = 0;
  }
  FUN_1007cf9e(param_1,param_2,0,param_3,0,param_4,param_5,param_6,param_7 & 0xffffffe7,param_8,
               param_9);
  return;
}


