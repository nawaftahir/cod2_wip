
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

BOOL FUN_00420470(LCID param_1,DWORD param_2,LPCWSTR param_3,int param_4,LPWORD param_5)

{
  UINT UVar1;
  uint cbMultiByte;
  BOOL BVar2;
  DWORD dwFlags;
  LPCWSTR lpWideCharStr;
  int cchWideChar;
  LPSTR lpMultiByteStr;
  int cbMultiByte_00;
  LPCSTR lpDefaultChar;
  LPBOOL lpUsedDefaultChar;
  LPCSTR local_94;
  CHAR aCStack_90 [128];
  undefined4 local_10;
  void *pvStack_c;
  undefined1 *puStack_8;
  undefined4 local_4;
  
  puStack_8 = &LAB_00524c3b;
  pvStack_c = ExceptionList;
  local_10 = DAT_0058ea68;
  local_94 = (LPCSTR)0x0;
  lpUsedDefaultChar = (LPBOOL)0x0;
  lpDefaultChar = (LPCSTR)0x0;
  cbMultiByte_00 = 0;
  lpMultiByteStr = (LPSTR)0x0;
  dwFlags = 0;
  local_4 = 0;
  ExceptionList = &pvStack_c;
  lpWideCharStr = param_3;
  cchWideChar = param_4;
  UVar1 = (*(code *)PTR_FUN_005984fc)();
  cbMultiByte = WideCharToMultiByte(UVar1,dwFlags,lpWideCharStr,cchWideChar,lpMultiByteStr,
                                    cbMultiByte_00,lpDefaultChar,lpUsedDefaultChar);
  if (cbMultiByte < 0x81) {
    local_94 = aCStack_90;
  }
  else {
    FUN_00420dd0(cbMultiByte);
  }
  UVar1 = (*(code *)PTR_FUN_005984fc)();
  WideCharToMultiByte(UVar1,0,param_3,param_4,local_94,cbMultiByte,(LPCSTR)0x0,(LPBOOL)0x0);
  if (param_4 == -1) {
    cbMultiByte = 0xffffffff;
  }
  BVar2 = GetStringTypeExA(param_1,param_2,local_94,cbMultiByte,param_5);
  if (local_94 != aCStack_90) {
    FUN_00420d40();
  }
  ExceptionList = pvStack_c;
  return BVar2;
}

