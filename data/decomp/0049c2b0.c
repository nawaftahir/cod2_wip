
undefined4 FUN_0049c2b0(void)

{
  undefined4 in_EAX;
  int local_c;
  int local_8;
  
  FUN_0047fa40();
  if (local_8 == 0) {
    return 0;
  }
  FUN_0040aaa0();
  FUN_00494830();
  (&DAT_00592b8d)[DAT_00596d48 * 0x45c] = 0;
  local_c = local_8;
  FUN_0049bed0(in_EAX,&local_c);
  if (DAT_00596d48 == 0) {
    FUN_0047ae50(0,"Com_EndParseSession: session underflow");
  }
  DAT_00596d48 = DAT_00596d48 + -1;
  FUN_0047fb10(local_8);
  return 1;
}

