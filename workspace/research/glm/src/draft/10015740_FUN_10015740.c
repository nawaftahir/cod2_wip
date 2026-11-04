extern unsigned int DAT_101d1b9c;
extern int FUN_100155a0();
extern int FUN_1005da30();


void FUN_10015740(int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
                 unsigned int param_5,unsigned int param_6)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 8);
  while (iVar1 == -2) {
    iVar1 = FUN_1005da30(param_2,param_3,*(unsigned int *)(param_1 + 0xc));
    if (iVar1 == 1) {
      param_1 = *(int *)(param_1 + 0x10);
    }
    else {
      if (iVar1 != 2) {
        FUN_10015740(*(unsigned int *)(param_1 + 0x10),param_2,param_3,param_4,param_5,param_6);
      }
      param_1 = *(int *)(param_1 + 0x14);
    }
    iVar1 = *(int *)(param_1 + 8);
  }
  if (*(int *)(param_1 + 8) != -1) {
    FUN_100155a0(*(int *)(param_1 + 8) * 0x3c + *(int *)(DAT_101d1b9c + 0x100),param_2,param_3,
                 param_4,param_5,param_6);
  }
  return;
}


