
void __fastcall FUN_004bce40(int param_1)

{
  int _FileHandle;
  
  if (-1 < *(int *)(param_1 + 0x28)) {
    __close(*(int *)(param_1 + 0x28));
  }
  _FileHandle = *(int *)(param_1 + 0x2c);
  if ((_FileHandle != *(int *)(param_1 + 0x28)) && (-1 < _FileHandle)) {
    __close(_FileHandle);
  }
  *(undefined4 *)(param_1 + 0x2c) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x28) = 0xffffffff;
  return;
}

