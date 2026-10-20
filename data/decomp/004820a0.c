
void FUN_004820a0(void)

{
  FUN_00481b00();
  DAT_0114348c = FUN_00481fd0();
  if (DAT_0114348c == 0) {
    FUN_0047ae50(0,"Couldn\'t load %s.  Make sure Call of Duty is run from the correct folder.",
                 "default_localize.cfg");
  }
  FUN_00496430();
  FUN_00496430();
  return;
}

