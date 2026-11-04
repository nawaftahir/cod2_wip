// 10106b03 size=42 __isatty

/* Library Function - Single Match
    __isatty
   
   Library: Visual Studio 2003 Release */

int __cdecl __isatty(int _FileHandle)

{
  if (DAT_1076ac9c <= (uint)_FileHandle) {
    return 0;
  }
  return (int)*(char *)((&DAT_1076aca0)[_FileHandle >> 5] + 4 + (_FileHandle & 0x1fU) * 0x24) & 0x40
  ;
}


