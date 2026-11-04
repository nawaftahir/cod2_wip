extern unsigned int DAT_10193358;
extern int FUN_10067c3e();
extern int FUN_1006dc2f();


unsigned int FUN_1006dca1(int *param_1,unsigned int param_2,unsigned int param_3,char *param_4)

{
  unsigned int uVar1;
  unsigned int *puVar2;
  char *pcVar3;
  char local_104 [255];
  unsigned char local_5;
  
  param_1[0x13] = 1;
  __vsnprintf(local_104,0x100,param_4,&stack0x00000014);
  pcVar3 = local_104;
  puVar2 = &DAT_10193358;
  local_5 = 0;
  uVar1 = FUN_1006dc2f(param_2);
  FUN_10067c3e(*param_1 + 0x18,uVar1,param_3,puVar2,pcVar3);
  return 0;
}


