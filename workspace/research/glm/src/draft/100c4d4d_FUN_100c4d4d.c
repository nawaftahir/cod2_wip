extern unsigned int DAT_10193358;
extern int FUN_10067c3e();


unsigned int
FUN_100c4d4d(unsigned int param_1,int param_2,short param_3,int param_4,unsigned int param_5,int param_6
            )

{
  int iVar1;
  unsigned char local_24 [16];
  unsigned int local_14;
  int local_10;
  
  if (param_2 == -1) {
    if (((*(int *)(param_6 + 0x100) != 0) &&
        (iVar1 = *(int *)(*(int *)(param_6 + 0x100) + 0x3c), iVar1 != 0)) &&
       (*(int *)(iVar1 + 4) == 0xd)) {
      param_1 = *(unsigned int *)(iVar1 + 0x40);
      param_2 = *(int *)(iVar1 + 0x44);
      if (param_2 != -1) goto LAB_100c4d8a;
    }
    param_2 = 0;
  }
LAB_100c4d8a:
  local_14 = param_1;
  if ((param_3 == 2) || (param_3 == 6)) {
    local_10 = param_2;
    FUN_10067c3e(*(unsigned int *)(param_6 + 0xc4),local_24,param_4 + 5000,&DAT_10193358,param_5);
    *(unsigned int *)(param_6 + 0xd4) = 1;
  }
  return 0;
}


