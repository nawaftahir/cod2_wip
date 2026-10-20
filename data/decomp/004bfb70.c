
int * __fastcall FUN_004bfb70(int *param_1)

{
  LPDWORD lpMode;
  int iVar1;
  HANDLE pvVar2;
  DWORD dwMode;
  
  lpMode = (LPDWORD)FUN_004ff450(8);
  *param_1 = (int)lpMode;
  iVar1 = FUN_004f396b(&PTR_DAT_0058e750);
  pvVar2 = (HANDLE)__get_osfhandle(iVar1);
  GetConsoleMode(pvVar2,lpMode);
  ((undefined4 *)*param_1)[1] = *(undefined4 *)*param_1;
  *(uint *)*param_1 = *(uint *)*param_1 & 0xfffffffb;
  dwMode = *(DWORD *)*param_1;
  iVar1 = FUN_004f396b(&PTR_DAT_0058e750);
  pvVar2 = (HANDLE)__get_osfhandle(iVar1);
  SetConsoleMode(pvVar2,dwMode);
  FUN_004c03d0(FUN_004bfb10,param_1);
  return param_1;
}

