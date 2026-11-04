
void __fastcall FUN_00407c40(undefined4 param_1,int param_2,LPCWSTR param_3)

{
  int in_EAX;
  UINT CodePage;
  DWORD dwFlags;
  LPSTR lpMultiByteStr;
  LPCSTR lpDefaultChar;
  LPBOOL lpUsedDefaultChar;
  
  lpUsedDefaultChar = (LPBOOL)0x0;
  lpDefaultChar = (LPCSTR)0x0;
  dwFlags = 0;
  CodePage = (*(code *)PTR_FUN_005984fc)();
  WideCharToMultiByte(CodePage,dwFlags,param_3,param_2,lpMultiByteStr,in_EAX,lpDefaultChar,
                      lpUsedDefaultChar);
  return;
}

