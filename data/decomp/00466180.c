
void FUN_00466180(void)

{
  int iVar1;
  int *unaff_ESI;
  
  if (((unaff_ESI[1] == 0) || (*unaff_ESI == 0)) && (DAT_0124a2f5 == '\0')) {
    iVar1 = FUN_0047d980("e->next && e->prev",".\\entity.cpp",0x27a,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2f5 = '\x01';
    }
  }
  *(int *)unaff_ESI[1] = *unaff_ESI;
  *(int *)(*unaff_ESI + 4) = unaff_ESI[1];
  *unaff_ESI = 0;
  unaff_ESI[1] = 0;
  return;
}

