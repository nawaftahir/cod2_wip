// 10004890 size=1261 FUN_10004890

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * FUN_10004890(char *param_1)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  undefined4 *puVar6;
  char acStack_2d8 [63];
  undefined1 uStack_299;
  int iStack_298;
  int iStack_294;
  undefined1 local_290 [4];
  int iStack_28c;
  undefined4 uStack_288;
  
  puVar6 = &DAT_101ae288;
  for (iVar5 = 0x81; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  DAT_101ae490 = 0;
  DAT_101ae494 = 0;
  DAT_101ae498 = 0;
  DAT_101ae49c = 0;
  DAT_101ae4a0 = 0;
  _DAT_101ae4a4 = 0;
  iStack_298 = (*(code *)RI_Com_LoadDvarsFromBuffer)(local_290,&DAT_101ae3dc);
  pcVar3 = param_1;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  iStack_294 = iStack_298;
  pcVar3 = (char *)(*(code *)RI_Hunk_AllocInternal)(pcVar3 + (1 - (int)(param_1 + 1)));
  DAT_101ae288 = pcVar3;
  do {
    cVar2 = *param_1;
    param_1 = param_1 + 1;
    *pcVar3 = cVar2;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  cVar2 = *DAT_101ae288;
  pcVar4 = DAT_101ae288;
  pcVar3 = DAT_101ae288;
  while (cVar2 != '\0') {
    if (cVar2 == '/') {
      pcVar3 = pcVar4 + 1;
    }
    pcVar1 = pcVar4 + 1;
    pcVar4 = pcVar4 + 1;
    cVar2 = *pcVar1;
  }
  _strncpy(acStack_2d8,pcVar3,0x3f);
  uStack_299 = 0;
  FUN_10060350();
  pcVar3 = acStack_2d8;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  pcVar4 = (char *)(*(code *)RI_Hunk_AllocInternal)(pcVar3 + (1 - (int)(acStack_2d8 + 1)));
  pcVar3 = acStack_2d8;
  DAT_101ae28c = pcVar4;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
    *pcVar4 = cVar2;
    pcVar4 = pcVar4 + 1;
  } while (cVar2 != '\0');
  (*(code *)RI_Printf)(0,"Loading %s...\n","materials");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  iVar5 = iStack_298;
  uStack_288 = FUN_10001940();
  iStack_28c = *(int *)(iVar5 + 0xc) + iStack_294;
  (*(code *)RI_Printf)(0,"Loading %s...\n","sun settings");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  R_DObjReplaceMaterial(&DAT_101ae2bc,*(int *)(iStack_298 + 0x134) + iStack_294);
  FUN_10004dc0();
  (*(code *)RI_Printf)(0,"Loading %s...\n","lightmaps");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10001fb0(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","lightgrid coefficients");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  iVar5 = iStack_298;
  puVar6 = (undefined4 *)(iStack_298 + 0x20);
  _DAT_101ae3ac = FUN_10001940();
  _DAT_101ae3b0 = (*(code *)RI_Hunk_AllocInternal)(*puVar6);
  FUN_1005eaf0(_DAT_101ae3b0,*(int *)(iVar5 + 0x24) + iStack_294,*puVar6);
  (*(code *)RI_Printf)(0,"Loading %s...\n","lightgrid hash");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10002620();
  (*(code *)RI_Printf)(0,"Loading %s...\n","surfaces");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_100029c0(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","cull groups");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10004300(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","cull group indices");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_100043d0(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","portal vertices");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10004080();
  (*(code *)RI_Printf)(0,"Loading %s...\n","occluders");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10004430();
  (*(code *)RI_Printf)(0,"Loading %s...\n","occluder indices");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10004670(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","AABB trees");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10003ee0(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","cells");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10003f90(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","portals");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10004170();
  (*(code *)RI_Printf)(0,"Loading %s...\n","nodes and leafs");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10004730();
  (*(code *)RI_Printf)(0,"Loading %s...\n","submodels");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10002db0(&iStack_298);
  (*(code *)RI_Printf)(0,"Loading %s...\n","entities");
  (*(code *)RI_Cmd_Argv)(0,"updatescreen\n");
  FUN_10003880();
  DAT_101ae490 = 0;
  DAT_101ae494 = 0;
  DAT_101ae498 = 0;
  DAT_101ae49c = 0;
  DAT_101ae4a0 = 0;
  _DAT_101ae4a4 = 0;
  FUN_10029230();
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    FUN_10020640();
    FUN_10020790();
    FUN_100207f0();
    _DAT_101ae488 = FUN_1000d200(1);
    return &DAT_101ae288;
  }
  _DAT_101ae488 = 0;
  return &DAT_101ae288;
}


