// 10099580 size=88 FUN_10099580

void FUN_10099580(int param_1,undefined4 param_2,undefined4 param_3,char *param_4)

{
  char local_104 [255];
  undefined1 local_5;
  
  __vsnprintf(local_104,0x100,param_4,&stack0x00000014);
  local_5 = 0;
  FUN_10067c3e(*(int *)(param_1 + 4) + 0x18,param_2,param_3,&DAT_10193358,local_104);
  *(undefined4 *)(param_1 + 0x40) = 1;
  *(undefined4 *)(param_1 + 0x44) = 1;
  return;
}


