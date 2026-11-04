// 10011ad0 size=129 FUN_10011ad0

void FUN_10011ad0(void)

{
  undefined4 *in_EAX;
  int iVar1;
  undefined4 uVar2;
  undefined4 in_ECX;
  
  *in_EAX = 0;
  in_EAX[1] = in_ECX;
  iVar1 = (**(code **)(*DAT_101d1bf8 + 0x6c))(DAT_101d1bf8);
  if (iVar1 < 0) {
    FUN_100efe3c(iVar1);
    uVar2 = FUN_10060c70("Couldn\'t create a %i-byte dynamic index buffer: %s");
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
                    /* WARNING: Could not recover jumptable at 0x10011b49. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)RI_Sys_DirectXFatalError)();
    return;
  }
  return;
}


