
void FUN_004546a0(void)

{
  int in_EAX;
  int iVar1;
  void *unaff_EBX;
  undefined4 *puVar2;
  
  if ((unaff_EBX == (void *)0x0) && (DAT_0124a29e == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00546b30,".\\brush.cpp",200);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a29e = '\x01';
    }
  }
  if ((in_EAX < 0) && (DAT_0124a29d == '\0')) {
    iVar1 = FUN_0047d980("count >= 0",".\\brush.cpp",0xc9,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a29d = '\x01';
    }
  }
  if (0 < in_EAX) {
    puVar2 = (undefined4 *)((int)unaff_EBX + 0xa0);
    do {
      if ((puVar2 == (undefined4 *)0xa0) && (DAT_0124a2ac == '\0')) {
        iVar1 = FUN_0047d980(&DAT_00546b30,".\\brush.cpp",0x40,0,1);
        if (iVar1 == 0) {
          DebugBreak();
        }
        else if (iVar1 == 2) {
          DAT_0124a2ac = '\x01';
        }
      }
      if ((void *)*puVar2 != (void *)0x0) {
        _free((void *)*puVar2);
        *puVar2 = 0;
      }
      puVar2 = puVar2 + 0x2a;
      in_EAX = in_EAX + -1;
    } while (in_EAX != 0);
  }
  _free(unaff_EBX);
  return;
}

