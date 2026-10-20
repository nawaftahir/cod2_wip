
LPVOID FUN_00489c90(void)

{
  LPVOID pvVar1;
  undefined4 uVar2;
  int iVar3;
  SIZE_T unaff_ESI;
  char *pcVar4;
  undefined4 uVar5;
  LPVOID pvVar6;
  undefined4 uVar7;
  
  pvVar1 = VirtualAlloc((LPVOID)0x0,unaff_ESI,0x1000,4);
  if (pvVar1 == (LPVOID)0x0) {
    if ((DAT_012334f8 == 0) && (DAT_0124a44a == '\0')) {
      uVar7 = 1;
      uVar5 = 0x20e;
      pcVar4 = "\\trees\\cod2src\\src\\universal\\com_memory.cpp";
      pvVar6 = pvVar1;
      uVar2 = FUN_004969e0("Z_VirtualAlloc: failed to allocate %d bytes");
      iVar3 = FUN_0047d980(uVar2,pcVar4,uVar5,pvVar6,uVar7);
      if (iVar3 == 0) {
        DebugBreak();
      }
      else if (iVar3 == 2) {
        DAT_0124a44a = '\x01';
      }
    }
    FUN_00408f20("Z_VirtualAlloc: failed to allocate %d bytes\n");
    FUN_0047ae50(0,"Z_VirtualAlloc: EXE_ERR_OUT_OF_MEMORY");
  }
  return pvVar1;
}

