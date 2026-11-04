
void FUN_00465bf0(int param_1,char *param_2,undefined4 param_3)

{
  int iVar1;
  
  if (((param_1 != 0) && (param_2 != (char *)0x0)) && (*param_2 != '\0')) {
    FUN_00465b50(param_1 + 100,param_3);
    FUN_004655f0();
    FUN_004656b0(param_3);
    iVar1 = __stricmp(param_2,"model");
    if (iVar1 == 0) {
      FUN_00467510(param_1);
    }
    FUN_004657a0(param_2);
    FUN_00465a70();
    FUN_00465ae0();
  }
  return;
}

