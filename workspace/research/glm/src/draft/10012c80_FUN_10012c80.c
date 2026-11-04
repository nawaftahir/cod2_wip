extern unsigned int DAT_10194088;
extern unsigned int DAT_101ce688;
extern unsigned int DAT_101ce6dc;
extern unsigned int DAT_101ce7fc;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d4934;
extern unsigned int DAT_101d4c6c;
extern unsigned int DAT_101d4c70;
extern unsigned int DAT_101d4c74;
extern int FUN_10012040();
extern int FUN_10012820();
extern int FUN_100128b0();
extern int FUN_100129c0();
extern int FUN_10012b90();


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
        (*(void *)RI_HideWindow)();
        DAT_101d4934 = 0;
        ShowWindow(local_24,5);
        return;
      }
    }
    if (*(int *)(g_101ce6dc + 8) < 2) {
 
	int g_101ce6dc = DAT_101ce6dc;     if ((*(int *)(g_101ce7fc + 8) < 1) || (DAT_101d4c74 < 0x3d)) {
 
	int g_101ce7fc = DAT_101ce7fc;       if ((*(int *)(g_101ce688 + 8) < 1) || ((DAT_101d4c6c < 0x281 && (DAT_101d4c70 < 0x1e1))))
     
	int g_101ce688 = DAT_101ce688;   {
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
          (*(void *)RI_Printf)(0,&DAT_10194088,"Couldn\'t initialize renderer");
          (*(void *)RI_Sys_DirectXFatalError)();
        }
        else {
          (*(void *)RI_Dvar_SetBool)(g_101ce688,*(int *)(g_101ce688 + 8) + -1);
        }
      }
      else {
        (*(void *)RI_Dvar_SetBool)(g_101ce7fc,*(int *)(g_101ce7fc + 8) + -1);
      }
    }
    else {
      (*(void *)RI_Dvar_SetBool)(g_101ce6dc,*(int *)(g_101ce6dc + 8) + -1);
    }
  } while( true );
}


