
uint FUN_00407aa0(HMODULE param_1,HRSRC param_2,uint param_3)

{
  HGLOBAL hResData;
  ushort *puVar1;
  DWORD DVar2;
  ushort *puVar3;
  
  hResData = LoadResource(param_1,param_2);
  if (hResData == (HGLOBAL)0x0) {
    return 0;
  }
  puVar1 = LockResource(hResData);
  if (puVar1 != (ushort *)0x0) {
    DVar2 = SizeofResource(param_1,param_2);
    puVar3 = (ushort *)(DVar2 + (int)puVar1);
    for (param_3 = param_3 & 0xf; param_3 != 0; param_3 = param_3 - 1) {
      if (puVar3 <= puVar1) {
        return 0;
      }
      puVar1 = puVar1 + *puVar1 + 1;
    }
    if (puVar1 < puVar3) {
      return -(uint)(*puVar1 != 0) & (uint)puVar1;
    }
  }
  return 0;
}

