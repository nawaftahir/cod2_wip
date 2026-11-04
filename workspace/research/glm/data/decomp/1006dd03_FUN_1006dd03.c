// 1006dd03 size=89 FUN_1006dd03

undefined4 FUN_1006dd03(undefined4 param_1,undefined4 param_2,undefined4 param_3,char *param_4)

{
  undefined8 uVar1;
  undefined *puVar2;
  char *pcVar3;
  char local_104 [255];
  undefined1 local_5;
  
  __vsnprintf(local_104,0x100,param_4,&stack0x00000014);
  pcVar3 = local_104;
  puVar2 = &DAT_10193358;
  local_5 = 0;
  uVar1 = FUN_1006dc2f(param_2);
  FUN_10067d05(*(int *)((ulonglong)uVar1 >> 0x20) + 0x18,(int)uVar1,param_3,puVar2,pcVar3);
  return 0;
}


