// 10012c80 size=289 FUN_10012c80

void FUN_10012c80(void)

{
  char cVar1;
  HWND local_24;
  
  if (DAT_101d1bf8 != 0) {
    FUN_10012040();
    return;
  }
  FUN_10012820();
  do {
    FUN_10012b90();
    cVar1 = FUN_100129c0();
    if (cVar1 != '\0') {
      cVar1 = FUN_100128b0();
      if (cVar1 != '\0') {
        (*(code *)RI_HideWindow)();
        DAT_101d4934 = 0;
        ShowWindow(local_24,5);
        return;
      }
    }
    if (*(int *)(DAT_101ce6dc + 8) < 2) {
      if ((*(int *)(DAT_101ce7fc + 8) < 1) || (DAT_101d4c74 < 0x3d)) {
        if ((*(int *)(DAT_101ce688 + 8) < 1) || ((DAT_101d4c6c < 0x281 && (DAT_101d4c70 < 0x1e1))))
        {
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
          (*(code *)RI_Printf)(0,&DAT_10194088,"Couldn\'t initialize renderer");
          (*(code *)RI_Sys_DirectXFatalError)();
        }
        else {
          (*(code *)RI_Dvar_SetBool)(DAT_101ce688,*(int *)(DAT_101ce688 + 8) + -1);
        }
      }
      else {
        (*(code *)RI_Dvar_SetBool)(DAT_101ce7fc,*(int *)(DAT_101ce7fc + 8) + -1);
      }
    }
    else {
      (*(code *)RI_Dvar_SetBool)(DAT_101ce6dc,*(int *)(DAT_101ce6dc + 8) + -1);
    }
  } while( true );
}


