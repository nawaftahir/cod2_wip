
void FUN_0046f430(void)

{
  void *_Dst;
  int iVar1;
  int iVar2;
  int iVar3;
  int unaff_EBX;
  int *piVar4;
  int iVar5;
  int local_8;
  
  iVar5 = 0;
  if (*(int *)(unaff_EBX + 0x20) == 0) {
    local_8 = 0;
    iVar3 = DAT_012485bc;
    if (0 < *(int *)(unaff_EBX + 0x18)) {
      do {
        iVar1 = 0;
        if (0 < iVar3) {
          piVar4 = (int *)(DAT_012485b8 + 4);
          do {
            if ((iVar1 < 0) || (iVar3 <= iVar1)) {
LAB_0046f4e7:
                    /* WARNING: Subroutine does not return */
              FUN_004f3bd2();
            }
            if (*(int *)(unaff_EBX + 0x1c) + iVar5 == *piVar4) {
              if (iVar3 < iVar1 + 1) goto LAB_0046f4e7;
              iVar2 = (iVar3 - iVar1) + -1;
              if (iVar2 != 0) {
                _Dst = (void *)(DAT_012485b8 + iVar1 * 0xc);
                _memmove(_Dst,(void *)((int)_Dst + 0xc),iVar2 * 0xc);
                iVar3 = DAT_012485bc;
              }
              iVar3 = iVar3 + -1;
              DAT_012485bc = iVar3;
              break;
            }
            iVar1 = iVar1 + 1;
            piVar4 = piVar4 + 3;
          } while (iVar1 < iVar3);
        }
        local_8 = local_8 + 1;
        iVar5 = iVar5 + 0xc;
        if (*(int *)(unaff_EBX + 0x18) <= local_8) {
          return;
        }
      } while( true );
    }
  }
  else {
    FUN_004592f0();
    FUN_00459210();
  }
  return;
}

