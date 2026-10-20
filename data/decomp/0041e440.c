
void FUN_0041e440(void)

{
  void *_Memory;
  int in_EAX;
  int iVar1;
  int *unaff_ESI;
  
  if (0 < in_EAX) {
    _Memory = (void *)unaff_ESI[3];
    unaff_ESI[1] = in_EAX;
    if (in_EAX < *unaff_ESI) {
      *unaff_ESI = in_EAX;
    }
    iVar1 = thunk_FUN_004ff450(in_EAX << 2);
    unaff_ESI[3] = iVar1;
    iVar1 = 0;
    if (0 < *unaff_ESI) {
      do {
        *(undefined4 *)(unaff_ESI[3] + iVar1 * 4) = *(undefined4 *)((int)_Memory + iVar1 * 4);
        iVar1 = iVar1 + 1;
      } while (iVar1 < *unaff_ESI);
    }
    if (_Memory != (void *)0x0) {
      _free(_Memory);
    }
    return;
  }
  if (DAT_0124a0fd == '\0') {
    iVar1 = FUN_0047d980("size > 0","e:\\trees\\cod2src\\src\\universal\\splines\\util_list.h",0xab,
                         0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0fd = '\x01';
    }
  }
  if ((void *)unaff_ESI[3] != (void *)0x0) {
    _free((void *)unaff_ESI[3]);
  }
  unaff_ESI[3] = 0;
  *unaff_ESI = 0;
  unaff_ESI[1] = 0;
  return;
}

