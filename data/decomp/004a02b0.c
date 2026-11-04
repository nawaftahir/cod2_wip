
void FUN_004a02b0(void)

{
  int *_Memory;
  int iVar1;
  undefined4 *puVar2;
  int *unaff_EDI;
  int local_8;
  
  if ((*unaff_EDI == 0) && (DAT_0124a62b == '\0')) {
    iVar1 = FUN_0047d980("m_data","\\trees\\cod2src\\src\\universal\\splines\\util_str.cpp",0x141,0,
                         1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a62b = '\x01';
    }
  }
  _Memory = (int *)*unaff_EDI;
  if (_Memory[1] != 0) {
    if (_Memory == (int *)0x0) {
      local_8 = 0;
    }
    else {
      local_8 = *_Memory;
    }
    puVar2 = (undefined4 *)FUN_004ff450(0x10);
    if (puVar2 == (undefined4 *)0x0) {
      puVar2 = (undefined4 *)0x0;
    }
    else {
      *puVar2 = 0;
      puVar2[1] = 0;
      puVar2[2] = 0;
      puVar2[3] = 0;
    }
    *unaff_EDI = (int)puVar2;
    FUN_004a0380(local_8 + 1U,0);
    _strncpy(*(char **)(*unaff_EDI + 8),(char *)_Memory[2],local_8 + 1U);
    *(int *)*unaff_EDI = local_8;
    iVar1 = _Memory[1];
    _Memory[1] = iVar1 + -1;
    if (iVar1 + -1 < 0) {
      if ((void *)_Memory[2] != (void *)0x0) {
        _free((void *)_Memory[2]);
      }
      _free(_Memory);
    }
  }
  return;
}

