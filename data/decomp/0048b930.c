
void FUN_0048b930(void)

{
  void *pvVar1;
  void *pvVar2;
  int iVar3;
  int unaff_EBX;
  size_t _Size;
  
  _Size = (uint)*(byte *)(unaff_EBX + 6) * 0xc;
  pvVar2 = _malloc(_Size);
  if (pvVar2 == (void *)0x0) {
    FUN_00489b70();
  }
  else {
    FUN_0048b5a0(pvVar2,0,_Size);
  }
  iVar3 = (uint)*(byte *)(unaff_EBX + 6) * 4;
  pvVar1 = (void *)(iVar3 + (int)pvVar2);
  *(void **)(unaff_EBX + 8) = pvVar2;
  *(void **)(unaff_EBX + 0xc) = pvVar1;
  *(void **)(unaff_EBX + 0x10) = (void *)((int)pvVar1 + iVar3);
  return;
}

