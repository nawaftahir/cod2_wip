
void FUN_0041e2e0(void)

{
  uchar *puVar1;
  void *_Dst;
  int iVar2;
  uchar *_Ptr;
  int *unaff_EDI;
  
  _Ptr = (uchar *)*unaff_EDI;
  iVar2 = __ismbcspace((int)(char)*_Ptr);
  while (iVar2 != 0) {
    _Ptr = __mbsinc(_Ptr);
    iVar2 = __ismbcspace((int)(char)*_Ptr);
  }
  puVar1 = (uchar *)*unaff_EDI;
  if (_Ptr != puVar1) {
    if ((int)(1U - *(int *)(puVar1 + -4) | *(int *)(puVar1 + -8) - *(int *)(puVar1 + -0xc)) < 0) {
      FUN_00402d30(*(int *)(puVar1 + -0xc));
    }
    _Dst = (void *)*unaff_EDI;
    iVar2 = *(int *)((int)_Dst + -0xc) - ((int)_Ptr - (int)puVar1);
    _memmove(_Dst,(void *)((int)_Dst + ((int)_Ptr - (int)puVar1)),iVar2 + 1);
    if ((iVar2 < 0) || (*(int *)(*unaff_EDI + -8) < iVar2)) {
                    /* WARNING: Subroutine does not return */
      FUN_00402c90(0x80070057);
    }
    *(int *)(*unaff_EDI + -0xc) = iVar2;
    *(undefined1 *)(iVar2 + *unaff_EDI) = 0;
  }
  return;
}

