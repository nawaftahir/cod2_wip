// 100f5871 size=41 _StringCchPrintfW

/* Library Function - Single Match
    _StringCchPrintfW
   
   Library: Visual Studio 2005 Release */

HRESULT _StringCchPrintfW(STRSAFE_LPWSTR pszDest,size_t cchDest,STRSAFE_LPCWSTR pszFormat,...)

{
  HRESULT HVar1;
  
  if (0x7fffffff < cchDest) {
    return -0x7ff8ffa9;
  }
  HVar1 = _StringVPrintfWorkerW_16(pszDest,cchDest,pszFormat,&stack0x00000010);
  return HVar1;
}


