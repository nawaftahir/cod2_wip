
void FUN_00466110(void)

{
  int iVar1;
  int *unaff_ESI;
  int *unaff_EDI;
  
  if (((unaff_ESI[1] != 0) || (*unaff_ESI != 0)) && (DAT_0124a2f6 == '\0')) {
    iVar1 = FUN_0047d980("!e->next && !e->prev",".\\entity.cpp",0x26f,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      unaff_ESI[1] = (int)unaff_EDI;
      *unaff_ESI = *unaff_EDI;
      *(int **)(*unaff_EDI + 4) = unaff_ESI;
      DAT_0124a2f6 = 1;
      *unaff_EDI = (int)unaff_ESI;
      return;
    }
  }
  unaff_ESI[1] = (int)unaff_EDI;
  *unaff_ESI = *unaff_EDI;
  *(int **)(*unaff_EDI + 4) = unaff_ESI;
  *unaff_EDI = (int)unaff_ESI;
  return;
}

