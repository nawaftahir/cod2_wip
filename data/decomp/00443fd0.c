
void FUN_00443fd0(void)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  
  if ((in_EAX == 0) && (DAT_0124a1f0 == '\0')) {
    iVar2 = FUN_0047d980("entity",".\\Undo.cpp",0x1f2);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a1f0 = '\x01';
    }
  }
  cVar1 = FUN_00443cd0();
  if (cVar1 == '\0') {
    iVar2 = FUN_004672e0();
    if ((*(int *)(iVar2 + 0x78) != 0) && (DAT_0124a1ef == '\0')) {
      uVar3 = FUN_004969e0("%s\n\t(clone->refCount) = %i","(clone->refCount == 0)",
                           *(int *)(iVar2 + 0x78),".\\Undo.cpp",0x1f8,1,1);
      iVar4 = FUN_0047d980(uVar3);
      if (iVar4 == 0) {
        DebugBreak();
      }
      else if (iVar4 == 2) {
        DAT_0124a1ef = '\x01';
      }
    }
    *(int *)(iVar2 + 0x78) = *(int *)(iVar2 + 0x78) + 1;
    *(undefined4 *)(iVar2 + 0x6c) = *(undefined4 *)(in_EAX + 0x6c);
    iVar4 = DAT_0109fdcc;
    *(undefined4 *)(iVar2 + 0x74) = *(undefined4 *)(in_EAX + 0x74);
    *(undefined4 *)(in_EAX + 0x6c) = *(undefined4 *)(iVar4 + 8);
    FUN_00466110();
    iVar2 = FUN_004663b0();
    DAT_012334d4 = DAT_012334d4 + iVar2;
  }
  return;
}

