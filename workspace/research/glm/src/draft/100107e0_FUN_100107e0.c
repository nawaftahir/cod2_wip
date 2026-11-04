extern int FUN_1002c370();
extern int FUN_10059250();


void FUN_100107e0(unsigned int param_1,unsigned int param_2,unsigned int *param_3)

{
  float fVar1;
  unsigned int local_4;
  
  FUN_10059250();
  *param_3 = param_2;
  fVar1 = (float)FUN_1002c370(0x3f800000,0x3faa9fbe,local_4);
  param_2._0_1_ = (unsigned char)(int)ROUND((float)(fVar1 * (float)255.0) + 9.313226e-10);
  *(unsigned char *)((int)param_3 + 3) = (unsigned char)param_2;
  return;
}


