
void FUN_00453dc0(void)

{
  int iVar1;
  int *unaff_ESI;
  
  if (unaff_ESI[2] != 0) {
    if ((*unaff_ESI == 0) && (DAT_0124a2ad == '\0')) {
      iVar1 = FUN_0047d980("f->matHandle",".\\brush.cpp",0x36,0,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a2ad = '\x01';
      }
    }
    (*DAT_0059c4ac)(*unaff_ESI,unaff_ESI[1],unaff_ESI[2]);
    *unaff_ESI = 0;
    unaff_ESI[1] = 0;
    unaff_ESI[2] = 0;
  }
  return;
}

