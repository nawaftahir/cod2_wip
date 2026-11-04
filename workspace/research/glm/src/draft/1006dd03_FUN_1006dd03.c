extern unsigned int DAT_10193358;
extern int FUN_10067d05();
extern int FUN_1006dc2f();


unsigned int FUN_1006dd03(unsigned int param_1,unsigned int param_2,unsigned int param_3,char *param_4)

{
  unsigned long long uVar1;
  unsigned int *puVar2;
  char *pcVar3;
  char local_104 [255];
  unsigned char local_5;
  
  __vsnprintf(local_104,0x100,param_4,&stack0x00000014);
  pcVar3 = local_104;
  puVar2 = &DAT_10193358;
  local_5 = 0;
  uVar1 = FUN_1006dc2f(param_2);
  FUN_10067d05(*(int *)((unsigned long long)uVar1 >> 0x20) + 0x18,(int)uVar1,param_3,puVar2,pcVar3);
  return 0;
}


