extern int FUN_10065ae3();
extern int FUN_10065bd0();
extern int FUN_1006702e();
extern int FUN_1006768e();
extern int FUN_100676fc();
extern int FUN_10084946();


int FUN_100850af(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
                unsigned int param_5,unsigned int *param_6,int param_7)

{
  int iVar1;
  int iVar2;
  unsigned char local_2b4 [688];
  
  if (param_6 != (unsigned int *)0x0) {
    *param_6 = 0;
  }
  FUN_10065ae3();
  iVar1 = FUN_1006702e(param_1,param_2,param_3,param_4);
  if (iVar1 >= 0) {
    iVar1 = FUN_10084946(local_2b4,param_5,param_6,param_7);
    if (iVar1 >= 0) {
      iVar2 = FUN_100676fc();
      if (iVar2 != 0) {
        iVar1 = -0x7789f4a7;
      }
    }
  }
  if (param_7 != 0) {
    FUN_1006768e(param_7);
  }
  FUN_10065bd0();
  return iVar1;
}


