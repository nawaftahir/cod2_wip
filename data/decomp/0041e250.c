
void FUN_0041e250(void)

{
  uchar uVar1;
  int iVar2;
  uchar *_Ptr;
  int *unaff_EBX;
  uchar *puVar3;
  int iVar4;
  
  _Ptr = (uchar *)*unaff_EBX;
  uVar1 = *_Ptr;
  puVar3 = (uchar *)0x0;
  if (uVar1 != '\0') {
    do {
      iVar2 = __ismbcspace((int)(char)uVar1);
      if (iVar2 == 0) {
        puVar3 = (uchar *)0x0;
      }
      else if (puVar3 == (uchar *)0x0) {
        puVar3 = _Ptr;
      }
      _Ptr = __mbsinc(_Ptr);
      uVar1 = *_Ptr;
    } while (uVar1 != '\0');
    if (puVar3 != (uchar *)0x0) {
      iVar2 = *unaff_EBX;
      iVar4 = (int)puVar3 - iVar2;
      if ((int)(1U - *(int *)(iVar2 + -4) | *(int *)(iVar2 + -8) - iVar4) < 0) {
        FUN_00402d30(iVar4);
      }
      if ((iVar4 < 0) || (*(int *)(*unaff_EBX + -8) < iVar4)) {
                    /* WARNING: Subroutine does not return */
        FUN_00402c90(0x80070057);
      }
      *(int *)(*unaff_EBX + -0xc) = iVar4;
      *(undefined1 *)(iVar4 + *unaff_EBX) = 0;
    }
  }
  return;
}

