
void FUN_00489d40(LPVOID param_1,SIZE_T param_2)

{
  LPVOID pvVar1;
  undefined4 uVar2;
  int iVar3;
  
  pvVar1 = VirtualAlloc(param_1,param_2,0x1000,4);
  if (pvVar1 == (LPVOID)0x0) {
    if ((DAT_012334f8 == 0) && (DAT_0124a449 == '\0')) {
      uVar2 = FUN_004969e0("Z_VirtualCommit: failed to allocate %d bytes",param_2,
                           "\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x227,0,1);
      iVar3 = FUN_0047d980(uVar2);
      if (iVar3 == 0) {
        DebugBreak();
      }
      else if (iVar3 == 2) {
        DAT_0124a449 = '\x01';
      }
    }
    FUN_00408f20("Z_VirtualCommit: failed to allocate %d bytes\n",param_2);
    FUN_0047ae50(0,"Z_VirtualCommit: EXE_ERR_OUT_OF_MEMORY");
  }
  return;
}

