// 10082325 size=144 FUN_10082325

undefined4 FUN_10082325(HMODULE param_1,undefined4 param_2,int param_3,int param_4)

{
  HRSRC hResInfo;
  DWORD DVar1;
  HGLOBAL hResData;
  LPVOID pvVar2;
  int *in_ECX;
  code *pcVar3;
  
  if (*in_ECX != 0) {
    FUN_10082304();
  }
  pcVar3 = FindResourceW_exref;
  if (param_4 == 0) {
    pcVar3 = FindResourceA_exref;
  }
  if (((param_3 != 0) && (hResInfo = (HRSRC)(*pcVar3)(param_1,param_2,2), hResInfo != (HRSRC)0x0))
     || (hResInfo = (HRSRC)(*pcVar3)(param_1,param_2,10), hResInfo != (HRSRC)0x0)) {
    DVar1 = SizeofResource(param_1,hResInfo);
    in_ECX[2] = DVar1;
    if (DVar1 != 0) {
      hResData = LoadResource(param_1,hResInfo);
      *in_ECX = (int)hResData;
      if (hResData != (HGLOBAL)0x0) {
        pvVar2 = LockResource(hResData);
        in_ECX[1] = (int)pvVar2;
        if (pvVar2 != (LPVOID)0x0) {
          return 0;
        }
      }
    }
  }
  GetLastError();
  return 0x88760b59;
}


