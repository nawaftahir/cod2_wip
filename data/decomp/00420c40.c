
void __fastcall FUN_00420c40(int *param_1)

{
  int iVar1;
  int *_Memory;
  
  iVar1 = *param_1;
  while (iVar1 != 0) {
    _Memory = (int *)*param_1;
    *param_1 = *_Memory;
    _free(_Memory);
    iVar1 = *param_1;
  }
  return;
}

