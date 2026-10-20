
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

char * FUN_00481fd0(void)

{
  int iVar1;
  int local_8;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  _DAT_01143494 = 1;
  iVar1 = FUN_0047ed20("default_localize.cfg",&local_8,0,0);
  if (local_8 != 0) {
    FUN_0047e300(local_8);
    if (0 < iVar1) {
      return "default_localize.cfg";
    }
  }
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  _DAT_01143494 = 1;
  iVar1 = FUN_0047ed20("default.cfg",&local_8,0,0);
  if (local_8 != 0) {
    FUN_0047e300(local_8);
    if (0 < iVar1) {
      return "default.cfg";
    }
  }
  return (char *)0x0;
}

