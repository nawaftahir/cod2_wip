// 10109d51 size=296 __flswbuf

/* Library Function - Single Match
    __flswbuf
   
   Library: Visual Studio 2003 Release */

int __cdecl __flswbuf(int _Ch,FILE *_File)

{
  uint uVar1;
  uint _FileHandle;
  char *_Buf;
  char *pcVar2;
  FILE *_File_00;
  int iVar3;
  undefined *puVar4;
  FILE *_MaxCharCount;
  
  _File_00 = _File;
  uVar1 = _File->_flag;
  _FileHandle = _File->_file;
  if (((uVar1 & 0x82) == 0) || ((uVar1 & 0x40) != 0)) {
LAB_10109e6a:
    _File->_flag = uVar1 | 0x20;
  }
  else {
    if ((uVar1 & 1) != 0) {
      _File->_cnt = 0;
      if ((uVar1 & 0x10) == 0) goto LAB_10109e6a;
      _File->_ptr = _File->_base;
      _File->_flag = uVar1 & 0xfffffffe;
    }
    uVar1 = _File->_flag;
    _File->_flag = uVar1 & 0xffffffef | 2;
    _File->_cnt = 0;
    _File = (FILE *)0x0;
    if (((uVar1 & 0x10c) == 0) &&
       (((_File_00 != (FILE *)&DAT_101a48c0 && (_File_00 != (FILE *)&DAT_101a48e0)) ||
        (iVar3 = __isatty(_FileHandle), iVar3 == 0)))) {
      __getbuf(_File_00);
    }
    if ((_File_00->_flag & 0x108) == 0) {
      _MaxCharCount = (FILE *)0x2;
      _File = (FILE *)CONCAT22(_File._2_2_,(short)_Ch);
      _File = (FILE *)__write(_FileHandle,&_File,2);
    }
    else {
      _Buf = _File_00->_base;
      pcVar2 = _File_00->_ptr;
      _File_00->_ptr = _Buf + 2;
      _MaxCharCount = (FILE *)(pcVar2 + -(int)_Buf);
      _File_00->_cnt = _File_00->_bufsiz + -2;
      if ((int)_MaxCharCount < 1) {
        if (_FileHandle == 0xffffffff) {
          puVar4 = &DAT_101a4e60;
        }
        else {
          puVar4 = (undefined *)
                   ((&DAT_1076aca0)[(int)_FileHandle >> 5] + (_FileHandle & 0x1f) * 0x24);
        }
        if ((puVar4[4] & 0x20) != 0) {
          __lseek(_FileHandle,0,2);
        }
      }
      else {
        _File = (FILE *)__write(_FileHandle,_Buf,(uint)_MaxCharCount);
      }
      *(short *)_File_00->_base = (short)_Ch;
    }
    if (_File == _MaxCharCount) {
      return _Ch & 0xffff;
    }
    _File_00->_flag = _File_00->_flag | 0x20;
  }
  return 0xffff;
}


