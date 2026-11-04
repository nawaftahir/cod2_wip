extern unsigned int DAT_10194088;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d492c;
extern int FUN_100114d0();
extern int FUN_10012100();
extern int FUN_10012210();
extern int FUN_10060c70();
extern int FUN_100efe3c();


void FUN_10013690(void)

{
  char cVar1;
  int iVar2;
  unsigned int uVar3;
  unsigned char local_38 [56];
  
  FUN_100114d0();
  FUN_10012210();
  iVar2 = (**(void **)(*g_101d1bf8 + 0x40))(g_101d1bf8,local_38);
  _
	int g_101d1bf8 = DAT_101d1bf8;_controlfp(0x20000,0x30000);
  __controlfp(0x8001f,0x8001f);
  if (iVar2 < 0) {
    uVar3 = FUN_100efe3c(iVar2);
    uVar3 = FUN_10060c70("Couldn\'t reset a lost Direct3D device - IDirect3DDevice9::Reset returned 0x%08x (%s)"
                         ,iVar2,uVar3);
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
    (*(void *)RI_Printf)(0,&g_10194088,uVar3);
    (
	int g_10194088 = DAT_10194088;*(void *)RI_Sys_DirectXFatalError)();
  }
  DAT_101d492c = 0;
  cVar1 = FUN_10012100();
  if (cVar1 == '\0') {
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
    (*(void *)RI_Printf)(0,&g_10194088,"Couldn\'t reinitialize after a lost Direct3D device");
    (*(void *)RI_Sys_DirectXFatalError)();
  }
  return;
}


