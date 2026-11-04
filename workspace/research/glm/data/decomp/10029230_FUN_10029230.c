// 10029230 size=208 FUN_10029230

void FUN_10029230(void)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  undefined4 uVar4;
  int iVar5;
  char *in_ECX;
  undefined4 local_48;
  char local_44 [63];
  undefined1 local_5;
  
  FUN_1005ec20();
  cVar2 = *in_ECX;
  pcVar3 = in_ECX;
  while (cVar2 != '\0') {
    if ((cVar2 == '/') || (cVar2 == '\\')) {
      pcVar3 = in_ECX + 1;
    }
    pcVar1 = in_ECX + 1;
    in_ECX = in_ECX + 1;
    cVar2 = *pcVar1;
  }
  _strncpy(local_44,pcVar3,0x3f);
  local_5 = 0;
  pcVar3 = _strchr(local_44,0x2e);
  if (pcVar3 != (char *)0x0) {
    *pcVar3 = '\0';
  }
  if (local_44[0] != '\0') {
    uVar4 = FUN_10060c70("sun/%s.sun",local_44);
    iVar5 = (*(code *)RI_StatMon_Warning)(uVar4,&local_48);
    if (iVar5 < 0) {
      FUN_10061c80("^3WARNING: couldn\'t load sun file \'%s\'\n");
      return;
    }
    iVar5 = (*(code *)RI_Com_SaveDvarsToBuffer)
                      (&PTR_s_r_sunsprite_shader_101a5a38,0x15,local_48,uVar4);
    if (iVar5 != 0) {
      FUN_10028cd0();
    }
    (*(code *)RI_FS_ReadFile)(local_48);
  }
  return;
}


