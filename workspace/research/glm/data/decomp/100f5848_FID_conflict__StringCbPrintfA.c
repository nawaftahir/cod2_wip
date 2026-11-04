// 100f5848 size=41 FID_conflict:_StringCbPrintfA

/* Library Function - Multiple Matches With Different Base Names
    _StringCbPrintfA
    _StringCchPrintfA
   
   Library: Visual Studio 2005 Release */

HRESULT FID_conflict__StringCbPrintfA
                  (STRSAFE_LPSTR pszDest,size_t cbDest,STRSAFE_LPCSTR pszFormat,...)

{
  HRESULT HVar1;
  
  if (0x7fffffff < cbDest) {
    return -0x7ff8ffa9;
  }
  HVar1 = _StringVPrintfWorkerA_16(pszDest,cbDest,pszFormat,&stack0x00000010);
  return HVar1;
}


