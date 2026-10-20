
void FUN_0042f790(void)

{
  int *in_EAX;
  int iVar1;
  
  if ((in_EAX == (int *)0x0) && (DAT_0124a165 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_005474f4,".\\Pmesh.cpp",0xf20,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a165 = '\x01';
    }
  }
  if ((*in_EAX == 0) && (DAT_0124a164 == '\0')) {
    iVar1 = FUN_0047d980("p->def",".\\Pmesh.cpp",0xf21,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a164 = '\x01';
    }
  }
  FUN_0042ca80();
  _free(in_EAX);
  if (DAT_01234694 != 0) {
    FUN_00424b10();
    return;
  }
  return;
}

