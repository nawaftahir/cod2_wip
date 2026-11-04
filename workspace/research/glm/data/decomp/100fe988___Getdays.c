// 100fe988 size=127 __Getdays

/* Library Function - Single Match
    __Getdays
   
   Library: Visual Studio 2003 Release */

char * __cdecl __Getdays(void)

{
  undefined *puVar1;
  size_t sVar2;
  size_t sVar3;
  char *pcVar4;
  char *pcVar5;
  uint uVar6;
  int iVar7;
  char *pcVar8;
  
  puVar1 = PTR_PTR_101a4fd0;
  iVar7 = 0;
  uVar6 = 0;
  do {
    sVar2 = _strlen(*(char **)(puVar1 + uVar6 * 4 + 0x1c));
    sVar3 = _strlen(*(char **)(puVar1 + uVar6 * 4));
    uVar6 = uVar6 + 1;
    iVar7 = sVar3 + iVar7 + 2 + sVar2;
  } while (uVar6 < 7);
  pcVar4 = _malloc(iVar7 + 1);
  if (pcVar4 != (char *)0x0) {
    uVar6 = 0;
    pcVar8 = pcVar4;
    do {
      *pcVar8 = ':';
      pcVar8 = pcVar8 + 1;
      pcVar5 = (char *)FUN_100fe890(pcVar8,*(undefined4 *)(puVar1 + uVar6 * 4));
      sVar2 = _strlen(pcVar5);
      pcVar8 = pcVar8 + sVar2;
      *pcVar8 = ':';
      pcVar5 = (char *)FUN_100fe890(pcVar8 + 1,*(undefined4 *)(puVar1 + uVar6 * 4 + 0x1c));
      sVar2 = _strlen(pcVar5);
      pcVar8 = pcVar8 + 1 + sVar2;
      uVar6 = uVar6 + 1;
    } while (uVar6 < 7);
    *pcVar8 = '\0';
  }
  return pcVar4;
}


