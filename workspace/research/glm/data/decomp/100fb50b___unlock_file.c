// 100fb50b size=47 __unlock_file

/* Library Function - Single Match
    __unlock_file
   
   Libraries: Visual Studio 2003 Release, Visual Studio 2005 Release */

void __cdecl __unlock_file(FILE *_File)

{
  if (((FILE *)0x101a489f < _File) && (_File < (FILE *)0x101a4b01)) {
    FUN_100fbfb0(((int)(_File + -0x80d245) >> 5) + 0x10);
    return;
  }
  LeaveCriticalSection((LPCRITICAL_SECTION)(_File + 1));
  return;
}


