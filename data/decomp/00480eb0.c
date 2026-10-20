
void FUN_00480eb0(int param_1,int param_2)

{
  size_t _Size;
  int iVar1;
  undefined4 *_Memory;
  int iVar2;
  int iVar3;
  int iVar4;
  
  _Size = param_2 * 4 + 4;
  _Memory = _malloc(_Size);
  if (_Memory == (undefined4 *)0x0) {
    FUN_00489b70();
  }
  else {
    FUN_0048b5a0(_Memory,0,_Size);
  }
  iVar3 = 0;
  *_Memory = 0;
  if (0 < param_2) {
    do {
      iVar4 = 0;
      iVar1 = iVar3;
      if (0 < iVar3) {
        do {
          iVar2 = FUN_00480e50();
          if (iVar2 < 0) break;
          iVar4 = iVar4 + 1;
        } while (iVar4 < iVar3);
      }
      for (; iVar4 < iVar1; iVar1 = iVar1 + -1) {
        _Memory[iVar1] = _Memory[iVar1 + -1];
      }
      iVar1 = iVar3 * 4;
      iVar3 = iVar3 + 1;
      _Memory[iVar4] = *(undefined4 *)(param_1 + iVar1);
    } while (iVar3 < param_2);
  }
  FUN_0048b3e0(param_1,_Memory,param_2 * 4);
  _free(_Memory);
  return;
}

