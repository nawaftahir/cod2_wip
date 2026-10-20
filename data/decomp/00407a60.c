
void FUN_00407a60(HMODULE param_1,uint param_2)

{
  HRSRC pHVar1;
  
  pHVar1 = FindResourceA(param_1,(LPCSTR)((param_2 >> 4) + 1 & 0xffff),(LPCSTR)0x6);
  if (pHVar1 == (HRSRC)0x0) {
    return;
  }
  FUN_00407aa0(param_1,pHVar1,param_2);
  return;
}

