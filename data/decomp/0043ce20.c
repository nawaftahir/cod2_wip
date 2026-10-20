
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_0043ce20(void)

{
  float fVar1;
  int iVar2;
  int iVar3;
  float10 fVar4;
  undefined4 local_10;
  
  iVar2 = DAT_012485bc;
  if (0 < DAT_012485bc) {
    if (*(int *)(*DAT_012485b8 + 0x20) == 0) {
      fVar4 = (float10)FUN_0043cb80();
    }
    else {
      fVar4 = (float10)FUN_0043cc70();
    }
    fVar1 = (float)fVar4;
    if (fVar1 == _DAT_00556a70) {
LAB_0043cf0c:
      return (float10)_DAT_00556a70;
    }
    local_10 = 1;
    if (1 < iVar2) {
      iVar3 = 0xc;
      do {
        if ((iVar3 < 0) || (DAT_012485bc <= local_10)) goto LAB_0043cf19;
        if (*(int *)(*(int *)(iVar3 + (int)DAT_012485b8) + 0x20) == 0) {
          fVar4 = (float10)FUN_0043cb80();
        }
        else {
          fVar4 = (float10)FUN_0043cc70();
        }
        if (fVar1 != (float)fVar4) goto LAB_0043cf0c;
        local_10 = local_10 + 1;
        iVar3 = iVar3 + 0xc;
      } while (local_10 < iVar2);
    }
    return (float10)fVar1;
  }
LAB_0043cf19:
                    /* WARNING: Subroutine does not return */
  FUN_004f3bd2();
}

