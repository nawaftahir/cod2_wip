
void FUN_00489b70(void)

{
  undefined4 uVar1;
  int iVar2;
  char *pcVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  
  if ((DAT_012334f8 == 0) && (DAT_0124a44b == '\0')) {
    uVar6 = 1;
    uVar5 = 0;
    uVar4 = 0xde;
    pcVar3 = "\\trees\\cod2src\\src\\universal\\com_memory.cpp";
    uVar1 = FUN_004969e0("Z_Malloc: failed to allocate %d bytes");
    iVar2 = FUN_0047d980(uVar1,pcVar3,uVar4,uVar5,uVar6);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a44b = '\x01';
    }
  }
  FUN_00408f20("Z_Malloc: failed to allocate %d bytes\n");
  FUN_0047ae50(0,"Z_Malloc: EXE_ERR_OUT_OF_MEMORY");
  return;
}

