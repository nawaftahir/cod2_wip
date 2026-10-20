
void FUN_0048cc10(void)

{
  int in_EAX;
  int iVar1;
  
  if ((in_EAX == 0) && (DAT_0124a4b0 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_005536a4,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x207);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4b0 = 1;
      FUN_0048c1a0(uRam00000010);
      return;
    }
  }
  FUN_0048c1a0(*(undefined4 *)(in_EAX + 0x10));
  return;
}

