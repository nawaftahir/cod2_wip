
bool __fastcall FUN_004a2590(int param_1)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  
  if ((param_1 == 0) && (DAT_0124a6b7 == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00555460,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x248,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a6b7 = '\x01';
    }
  }
  iVar1 = *(int *)(param_1 + 4);
  if ((iVar1 == 0) && (DAT_0124a6b6 == '\0')) {
    iVar2 = FUN_0047d980(&DAT_00555134,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x24b,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a6b6 = '\x01';
    }
  }
  return (1 << ((byte)in_EAX & 0x1f) & *(uint *)(iVar1 + 0x20 + (in_EAX >> 5) * 4)) != 0;
}

