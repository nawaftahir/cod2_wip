// 100f799f size=43 __strdup

/* Library Function - Single Match
    __strdup
   
   Library: Visual Studio 2003 Release */

char * __cdecl __strdup(char *_Src)

{
  size_t sVar1;
  void *pvVar2;
  char *pcVar3;
  
  if (_Src != (char *)0x0) {
    sVar1 = _strlen(_Src);
    pvVar2 = _malloc(sVar1 + 1);
    if (pvVar2 != (void *)0x0) {
      pcVar3 = (char *)FUN_100fe890(pvVar2,_Src);
      return pcVar3;
    }
  }
  return (char *)0x0;
}


