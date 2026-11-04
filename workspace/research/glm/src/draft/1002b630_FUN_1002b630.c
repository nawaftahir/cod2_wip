extern unsigned int DAT_101ce708;
extern int FUN_1002adb0();
extern int FUN_1002b3c0();


void FUN_1002b630(unsigned int param_1,unsigned int param_2,unsigned int param_3)

{
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_1002b3c0(param_2,param_3);
    return;
  }
  FUN_1002adb0(param_1,param_3);
  return;
}


