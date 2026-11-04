// 10086472 size=86 FUN_10086472

undefined4 FUN_10086472(int param_1,char *param_2,size_t param_3)

{
  undefined4 uVar1;
  char *pcVar2;
  char local_44 [63];
  undefined1 local_5;
  
  _strncpy(local_44,*(char **)(*(int *)(param_1 + 0x68) + 0x18),0x3f);
  pcVar2 = local_44;
  local_5 = 0;
  uVar1 = FUN_100862e1(param_1);
  __snprintf(param_2,param_3,"%s semantic \'%s\'",uVar1,pcVar2);
  param_2[param_3 - 1] = '\0';
  return 0;
}


