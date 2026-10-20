
undefined2 * FUN_0046bcd0(undefined2 param_1,undefined2 param_2)

{
  ushort in_AX;
  HGLOBAL pvVar1;
  undefined2 *pMem;
  LPVOID pvVar2;
  ushort unaff_BX;
  
  pvVar1 = GlobalAlloc(0x42,0x10);
  pMem = GlobalLock(pvVar1);
  pMem[1] = param_1;
  *pMem = 0;
  pMem[2] = unaff_BX;
  pMem[4] = param_2;
  pMem[3] = in_AX;
  pvVar1 = GlobalAlloc(0x42,(uint)unaff_BX * (uint)in_AX);
  pvVar2 = GlobalLock(pvVar1);
  *(LPVOID *)(pMem + 6) = pvVar2;
  if (pvVar2 == (LPVOID)0x0) {
    pvVar1 = GlobalHandle(pMem);
    GlobalUnlock(pvVar1);
    pvVar1 = GlobalHandle(pMem);
    GlobalFree(pvVar1);
    return (undefined2 *)0x0;
  }
  return pMem;
}

