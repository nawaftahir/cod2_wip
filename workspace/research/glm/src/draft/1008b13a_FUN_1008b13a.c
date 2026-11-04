extern unsigned int DAT_10193358;
extern int FUN_10067d05();


unsigned int FUN_1008b13a(int param_1,int param_2,unsigned int param_3,char *param_4)

{
  int iVar1;
  int iVar2;
  char local_104 [255];
  unsigned char local_5;
  
  __vsnprintf(local_104,0x100,param_4,&stack0x00000014);
  iVar2 = 0;
  local_5 = 0;
  if (param_2 != 0) {
    iVar1 = *(int *)(param_2 + 4);
    if (iVar1 == 3) {
      iVar2 = param_2 + 0x10;
    }
    else if (iVar1 == 6) {
      iVar2 = *(int *)(param_2 + 0x14) + 0x10;
    }
    else if (iVar1 == 0xd) {
      iVar2 = param_2 + 0x30;
    }
  }
  FUN_10067d05(*(unsigned int *)(param_1 + 0xc4),iVar2,param_3,&DAT_10193358,local_104);
  return 0;
}


