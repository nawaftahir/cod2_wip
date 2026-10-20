
void FUN_004bfb10(int *param_1)

{
  int _FileHandle;
  HANDLE hConsoleHandle;
  DWORD dwMode;
  
  if (param_1 != (int *)0x0) {
    dwMode = *(DWORD *)(*param_1 + 4);
    _FileHandle = FUN_004f396b(&PTR_DAT_0058e750);
    hConsoleHandle = (HANDLE)__get_osfhandle(_FileHandle);
    SetConsoleMode(hConsoleHandle,dwMode);
    _fputc(10,(FILE *)&DAT_0058e770);
    FUN_004c0410(param_1);
    _free((void *)*param_1);
    _free(param_1);
  }
  return;
}

