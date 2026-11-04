// 100fb4b9 size=47 __lock_file

/* Library Function - Single Match
    __lock_file
   
   Library: Visual Studio 2003 Release */

void __cdecl __lock_file(FILE *_File)

{
  if (((FILE *)0x101a489f < _File) && (_File < (FILE *)0x101a4b01)) {
    __lock(((int)(_File + -0x80d245) >> 5) + 0x10);
    return;
  }
  EnterCriticalSection((LPCRITICAL_SECTION)(_File + 1));
  return;
}


