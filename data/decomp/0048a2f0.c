
void FUN_0048a2f0(uint param_1,char *param_2,undefined4 param_3)

{
  undefined4 *puVar1;
  int iVar2;
  
  iVar2 = FUN_0047db10(0x400);
  puVar1 = (undefined4 *)(&DAT_01147dd8)[iVar2];
  while( true ) {
    if (puVar1 == (undefined4 *)0x0) {
      if ((DAT_012334f8 == 0) && (DAT_0124a43b == '\0')) {
        iVar2 = FUN_0047d980("Hunk_OverrideDataForFile: could not find data",
                             "\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x40d,0,1);
        if (iVar2 == 0) {
                    /* WARNING: Could not recover jumptable at 0x0048a387. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          DebugBreak();
          return;
        }
        if (iVar2 == 2) {
          DAT_0124a43b = '\x01';
        }
      }
      return;
    }
    if ((*(byte *)(puVar1 + 2) == param_1) &&
       (iVar2 = __stricmp((char *)((int)puVar1 + 9),param_2), iVar2 == 0)) break;
    puVar1 = (undefined4 *)puVar1[1];
  }
  *puVar1 = param_3;
  return;
}

