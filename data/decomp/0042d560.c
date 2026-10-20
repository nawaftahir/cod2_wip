
void FUN_0042d560(void)

{
  int iVar1;
  int *unaff_ESI;
  
  if ((unaff_ESI[3] == 0) || ((short)unaff_ESI[1] != *(short *)(*unaff_ESI + 0x382c))) {
    FUN_0042ce10();
    if (((short)unaff_ESI[1] != *(short *)(*unaff_ESI + 0x382c)) && (DAT_0124a172 == '\0')) {
      iVar1 = FUN_0047d980("pm->version == pm->def->version",".\\Pmesh.cpp",0xca7,0,1);
      if (iVar1 == 0) {
                    /* WARNING: Could not recover jumptable at 0x0042d5c4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        DebugBreak();
        return;
      }
      if (iVar1 == 2) {
        DAT_0124a172 = '\x01';
      }
    }
  }
  return;
}

