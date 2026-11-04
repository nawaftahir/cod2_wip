// 10004f40 size=222 FUN_10004f40

undefined4 FUN_10004f40(void)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 *unaff_EDI;
  undefined1 auStack_20 [4];
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  
  uStack_14 = 0;
  uStack_18 = 0;
  uStack_1c = 8;
  iVar1 = (**(code **)(*DAT_101d1bf8 + 0x68))(DAT_101d1bf8);
  if (iVar1 < 0) {
    FUN_100efe3c(iVar1);
    uVar2 = FUN_10060c70("DirectX didn\'t create a %i-byte vertex buffer: %s\n");
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
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  uVar2 = 0;
  iVar1 = (**(code **)(*(int *)*unaff_EDI + 0x2c))((int *)*unaff_EDI,0,0,auStack_20,0);
  if (iVar1 < 0) {
    uVar3 = FUN_100efe3c(iVar1);
    uVar3 = FUN_10060c70("DirectX didn\'t lock a vertex buffer: %s\n",uVar3);
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
    (*(code *)RI_Printf)(0,&DAT_10194088,uVar3);
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  return uVar2;
}


