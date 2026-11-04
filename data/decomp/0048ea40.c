
void FUN_0048ea40(void)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *unaff_ESI;
  void *_Memory;
  
  if ((unaff_ESI == (undefined4 *)0x0) && (DAT_0124a48d == '\0')) {
    iVar2 = FUN_0047d980(&DAT_005536a4,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x521);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a48d = '\x01';
    }
  }
  if ((*(ushort *)(unaff_ESI + 1) & 0x4000) == 0) {
    *(ushort *)(unaff_ESI + 1) = *(ushort *)(unaff_ESI + 1) | 0x4000;
    uVar3 = FUN_00489dd0();
    *unaff_ESI = uVar3;
  }
  cVar1 = *(char *)((int)unaff_ESI + 6);
  if (cVar1 != '\a') {
    if (((cVar1 == '\x02') || (cVar1 == '\x03')) || (cVar1 == '\x04')) {
      _Memory = (void *)unaff_ESI[2];
    }
    else {
      _Memory = (void *)0x0;
    }
    FUN_0048cc70();
    uVar3 = FUN_0048b9b0();
    unaff_ESI[2] = uVar3;
    unaff_ESI[3] = uVar3;
    FUN_0048cc10();
    FUN_0048bce0();
    *(undefined1 *)((int)unaff_ESI + 6) = 7;
    if (_Memory != (void *)0x0) {
      _free(_Memory);
    }
  }
  return;
}

