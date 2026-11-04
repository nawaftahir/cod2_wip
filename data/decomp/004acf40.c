
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004acf40(uint param_1,float param_2)

{
  bool bVar1;
  int iVar2;
  
  if ((3 < param_1) && (DAT_0124a750 == '\0')) {
    iVar2 = FUN_0047d980("(unsigned)lodLevel < MAX_LODS",
                         "\\trees\\cod2src\\src\\xanim\\xmodel_utils.cpp",0xb1,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a750 = '\x01';
    }
  }
  bVar1 = _DAT_00556a70 <= param_2;
  *(float *)(&DAT_01233444 + param_1 * 8) = param_2;
  if (bVar1) {
    (&DAT_01233440)[param_1 * 8] = 1;
    return;
  }
  (&DAT_01233440)[param_1 * 8] = 0;
  return;
}

