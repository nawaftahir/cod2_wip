
undefined4 FUN_0046cbd0(char *param_1)

{
  int iVar1;
  int *unaff_ESI;
  __uint64 _Var2;
  CFile local_20 [16];
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005244b8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CFile::CFile(local_20);
  local_8 = 0;
  iVar1 = CFile::Open(local_20,param_1,0x40,(CFileException *)0x0);
  if (iVar1 != 0) {
    _Var2 = CFile::GetLength(local_20);
    *unaff_ESI = *unaff_ESI + (int)_Var2;
    CFile::Close(local_20);
    local_8 = 0xffffffff;
    CFile::~CFile(local_20);
    ExceptionList = local_10;
    return 1;
  }
  local_8 = 0xffffffff;
  CFile::~CFile(local_20);
  ExceptionList = local_10;
  return 0;
}

