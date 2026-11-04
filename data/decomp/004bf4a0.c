
void __thiscall FUN_004bf4a0(int param_1,char *param_2)

{
  char *pcVar1;
  
  if (*(int *)(param_1 + 4) != 0) {
    FUN_004bf280(&DAT_00541bdc);
  }
  pcVar1 = _strchr(param_2,0x20);
  if (pcVar1 == (char *)0x0) {
    FUN_004bf280(param_2);
    return;
  }
  FUN_004bf280(&DAT_00529d70);
  FUN_004bf280(param_2);
  FUN_004bf280(&DAT_00529d70);
  return;
}

