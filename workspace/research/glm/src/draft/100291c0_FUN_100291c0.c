extern int FUN_10028cd0();
extern int FUN_10060c70();
extern int FUN_10061c80();


void FUN_100291c0(void)

{
  unsigned int uVar1;
  int iVar2;
  unsigned int local_4;
  
  uVar1 = FUN_10060c70("sun/%s.sun");
  iVar2 = (*(void *)RI_StatMon_Warning)(uVar1,&local_4);
  if (iVar2 < 0) {
    FUN_10061c80("^3WARNING: couldn\'t load sun file \'%s\'\n");
    return;
  }
  iVar2 = (*(void *)RI_Com_SaveDvarsToBuffer)(&PTR_s_r_sunsprite_shader_101a5a38,0x15,local_4,uVar1)
  ;
  if (iVar2 != 0) {
    FUN_10028cd0();
  }
  (*(void *)RI_FS_ReadFile)(local_4);
  return;
}


