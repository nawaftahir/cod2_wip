
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00468100(void)

{
  _DAT_010a4508 = DAT_00541d48;
  DAT_010a4910 = 0;
  _DAT_010a450c = DAT_00541d4c;
  _DAT_010a4510 = PTR_DAT_00541d50;
  SetWindowTextA(DAT_010bcd54,&DAT_010a4508);
  DAT_010bcd30 = 0;
  if (DAT_010a44e0 == (undefined4 *)0x0) {
    DAT_010a44e0 = &DAT_010a44dc;
    DAT_010a44dc = &DAT_010a44dc;
    DAT_010a44b8 = &DAT_010a44b4;
    DAT_010a44b4 = &DAT_010a44b4;
    DAT_010a4490 = &DAT_010a448c;
    _DAT_010a448c = &DAT_010a448c;
    DAT_010a4414 = &DAT_010a4410;
    DAT_010a4410 = &DAT_010a4410;
    DAT_012334ec = 0;
    DAT_010a43d4 = &DAT_010a43d0;
    DAT_010a43d0 = &DAT_010a43d0;
    return;
  }
  FUN_00468030();
  FUN_004634f0();
  DAT_012334ec = 0;
  return;
}

