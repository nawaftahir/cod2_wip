extern unsigned int DAT_10194088;
extern unsigned int DAT_101d1bf4;
extern int FUN_10060c70();
extern int FUN_100efe3c();


void FUN_100116c0(unsigned int param_1)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  
  iVar3 = 0;
  do {
    iVar1 = (**(void **)(*g_101d1bf4 + 0x38))(g_101d1bf4,param_1,1);
   
	int g_101d1bf4 = DAT_101d1bf4; if (iVar1 >= 0) {
      return;
    }
    Sleep(100);
    iVar3 = iVar3 + 1;
  } while (iVar3 != 0x14);
  uVar2 = FUN_100efe3c(iVar1);
  uVar2 = FUN_10060c70("GetDeviceCaps failed: %s",uVar2);
  (*(void *)RI_Printf)
            (0,
             "********** DirectX returned an unrecoverable error code during initialization  **********\n"
            );
  (*(void *)RI_Printf)
            (0,
             "********** Initialization also happens while playing if DirectX loses a device **********\n"
            );
  (*(void *)RI_Printf)
            (0,
             "********** Consult the readme for how to continue from this problem            **********\n"
            );
  (*(void *)RI_Printf)(0,&DAT_10194088,uVar2);
                    /* WARNING: Could not recover jumptable at 0x10011741. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(void *)RI_Sys_DirectXFatalError)();
  return;
}


