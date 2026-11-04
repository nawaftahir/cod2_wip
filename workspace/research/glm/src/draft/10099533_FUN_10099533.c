extern unsigned int DAT_10193358;
extern int FUN_10067d05();


void FUN_10099533(int param_1,unsigned int param_2,unsigned int param_3,char *param_4)

{
  char local_104 [255];
  unsigned char local_5;
  
  __vsnprintf(local_104,0x100,param_4,&stack0x00000014);
  local_5 = 0;
  FUN_10067d05(*(int *)(param_1 + 4) + 0x18,param_2,param_3,&DAT_10193358,local_104);
  return;
}


