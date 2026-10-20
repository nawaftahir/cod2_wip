
void FUN_0042e6c0(void)

{
  int *in_EAX;
  int iVar1;
  int iVar2;
  
  FUN_0042d560();
  FUN_0042d5d0(0x1d);
  iVar2 = DAT_011298c8;
  if ((in_EAX == (int *)0x0) && (DAT_0124a171 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_005471cc,".\\Pmesh.cpp",0xcaf);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a171 = '\x01';
    }
  }
  if (((short)in_EAX[1] != *(short *)(*in_EAX + 0x382c)) && (DAT_0124a170 == '\0')) {
    iVar1 = FUN_0047d980("pm->version == pm->def->version",".\\Pmesh.cpp",0xcb0,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a170 = '\x01';
    }
  }
  if (iVar2 == 0) {
    iVar2 = **(int **)(*in_EAX + 0x18 + DAT_01128d90 * 4);
  }
  (*DAT_0059c488)(iVar2,0x1d,in_EAX[4],in_EAX[3],in_EAX[5],in_EAX[7]);
  return;
}

