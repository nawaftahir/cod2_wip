// 100fea07 size=149 __Getmonths

/* Library Function - Single Match
    __Getmonths
   
   Library: Visual Studio 2003 Release */

char * __cdecl __Getmonths(void)

{
  undefined *puVar1;
  size_t sVar2;
  size_t sVar3;
  char *pcVar4;
  char *pcVar5;
  int iVar6;
  char *pcVar7;
  undefined4 *puVar8;
  int local_c;
  int local_8;
  
  puVar1 = PTR_PTR_101a4fd0;
  local_8 = 0;
  puVar8 = (undefined4 *)(PTR_PTR_101a4fd0 + 0x38);
  local_c = 0xc;
  do {
    sVar2 = _strlen((char *)puVar8[0xc]);
    sVar3 = _strlen((char *)*puVar8);
    local_8 = sVar3 + local_8 + 2 + sVar2;
    puVar8 = puVar8 + 1;
    local_c = local_c + -1;
  } while (local_c != 0);
  pcVar4 = _malloc(local_8 + 1);
  if (pcVar4 != (char *)0x0) {
    puVar8 = (undefined4 *)(puVar1 + 0x68);
    iVar6 = 0xc;
    pcVar7 = pcVar4;
    do {
      *pcVar7 = ':';
      pcVar7 = pcVar7 + 1;
      pcVar5 = (char *)FUN_100fe890(pcVar7,puVar8[-0xc]);
      sVar2 = _strlen(pcVar5);
      pcVar7 = pcVar7 + sVar2;
      *pcVar7 = ':';
      pcVar5 = (char *)FUN_100fe890(pcVar7 + 1,*puVar8);
      sVar2 = _strlen(pcVar5);
      pcVar7 = pcVar7 + 1 + sVar2;
      puVar8 = puVar8 + 1;
      iVar6 = iVar6 + -1;
    } while (iVar6 != 0);
    *pcVar7 = '\0';
  }
  return pcVar4;
}


