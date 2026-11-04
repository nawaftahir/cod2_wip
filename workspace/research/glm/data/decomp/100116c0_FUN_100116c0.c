// 100116c0 size=139 FUN_100116c0

void FUN_100116c0(undefined4 param_1)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  
  iVar3 = 0;
  do {
    iVar1 = (**(code **)(*DAT_101d1bf4 + 0x38))(DAT_101d1bf4,param_1,1);
    if (-1 < iVar1) {
      return;
    }
    Sleep(100);
    iVar3 = iVar3 + 1;
  } while (iVar3 != 0x14);
  uVar2 = FUN_100efe3c(iVar1);
  uVar2 = FUN_10060c70("GetDeviceCaps failed: %s",uVar2);
  (*(code *)RI_Printf)
            (0,
             "********** DirectX returned an unrecoverable error code during initialization  **********\n"
            );
  (*(code *)RI_Printf)
            (0,
             "********** Initialization also happens while playing if DirectX loses a device **********\n"
            );
  (*(code *)RI_Printf)
            (0,
             "********** Consult the readme for how to continue from this problem            **********\n"
            );
  (*(code *)RI_Printf)(0,&DAT_10194088,uVar2);
                    /* WARNING: Could not recover jumptable at 0x10011741. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)RI_Sys_DirectXFatalError)();
  return;
}


