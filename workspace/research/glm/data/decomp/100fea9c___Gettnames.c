// 100fea9c size=563 __Gettnames

/* Library Function - Single Match
    __Gettnames
   
   Library: Visual Studio 2003 Release */

void * __cdecl __Gettnames(void)

{
  undefined *puVar1;
  size_t sVar2;
  size_t sVar3;
  size_t sVar4;
  size_t sVar5;
  size_t sVar6;
  void *_Dst;
  char *pcVar7;
  undefined4 *puVar8;
  int iVar9;
  int local_14;
  undefined4 *local_10;
  undefined4 *local_c;
  int *local_8;
  
  puVar1 = PTR_PTR_101a4fd0;
  iVar9 = 0;
  local_8 = (int *)0x0;
  do {
    sVar2 = _strlen(*(char **)(puVar1 + (int)local_8 * 4 + 0x1c));
    sVar3 = _strlen(*(char **)(puVar1 + (int)local_8 * 4));
    local_8 = (int *)((int)local_8 + 1);
    iVar9 = sVar3 + iVar9 + 2 + sVar2;
  } while (local_8 < 7);
  local_10 = (undefined4 *)(puVar1 + 0x38);
  local_c = (undefined4 *)0xc;
  do {
    sVar2 = _strlen((char *)local_10[0xc]);
    sVar3 = _strlen((char *)*local_10);
    local_10 = local_10 + 1;
    local_c = (undefined4 *)((int)local_c + -1);
    iVar9 = sVar3 + iVar9 + 2 + sVar2;
  } while (local_c != (undefined4 *)0x0);
  sVar2 = _strlen(*(char **)(puVar1 + 0x98));
  sVar3 = _strlen(*(char **)(puVar1 + 0x9c));
  sVar4 = _strlen(*(char **)(puVar1 + 0xa0));
  sVar5 = _strlen(*(char **)(puVar1 + 0xa4));
  sVar6 = _strlen(*(char **)(puVar1 + 0xa8));
  _Dst = _malloc(sVar3 + iVar9 + sVar2 + sVar4 + sVar5 + sVar6 + 0xbd);
  if (_Dst != (void *)0x0) {
    iVar9 = (int)_Dst + 0xb8;
    _memcpy(_Dst,PTR_PTR_101a4fd0,0xb8);
    local_8 = (int *)0x0;
    local_c = (undefined4 *)(puVar1 + 0x1c);
    do {
      *(int *)((int)_Dst + (int)local_8 * 4) = iVar9;
      pcVar7 = (char *)FUN_100fe890(iVar9,local_c[-7]);
      sVar2 = _strlen(pcVar7);
      iVar9 = iVar9 + 1 + sVar2;
      *(int *)(((int)_Dst - (int)puVar1) + (int)local_c) = iVar9;
      pcVar7 = (char *)FUN_100fe890(iVar9,*local_c);
      sVar2 = _strlen(pcVar7);
      local_c = local_c + 1;
      local_8 = (int *)((int)local_8 + 1);
      iVar9 = iVar9 + 1 + sVar2;
    } while (local_8 < 7);
    local_8 = (int *)((int)_Dst + 0x68);
    puVar8 = (undefined4 *)(puVar1 + 0x38);
    local_14 = 0xc;
    do {
      *(int *)((int)puVar8 + ((int)_Dst - (int)puVar1)) = iVar9;
      pcVar7 = (char *)FUN_100fe890(iVar9,*puVar8);
      sVar2 = _strlen(pcVar7);
      iVar9 = iVar9 + 1 + sVar2;
      *local_8 = iVar9;
      pcVar7 = (char *)FUN_100fe890(iVar9,puVar8[0xc]);
      sVar2 = _strlen(pcVar7);
      puVar8 = puVar8 + 1;
      local_8 = local_8 + 1;
      local_14 = local_14 + -1;
      iVar9 = iVar9 + 1 + sVar2;
    } while (local_14 != 0);
    *(int *)((int)_Dst + 0x98) = iVar9;
    pcVar7 = (char *)FUN_100fe890(iVar9,*(undefined4 *)(puVar1 + 0x98));
    sVar2 = _strlen(pcVar7);
    iVar9 = iVar9 + 1 + sVar2;
    *(int *)((int)_Dst + 0x9c) = iVar9;
    pcVar7 = (char *)FUN_100fe890(iVar9,*(undefined4 *)(puVar1 + 0x9c));
    sVar2 = _strlen(pcVar7);
    iVar9 = iVar9 + 1 + sVar2;
    *(int *)((int)_Dst + 0xa0) = iVar9;
    pcVar7 = (char *)FUN_100fe890(iVar9,*(undefined4 *)(puVar1 + 0xa0));
    sVar2 = _strlen(pcVar7);
    iVar9 = iVar9 + 1 + sVar2;
    *(int *)((int)_Dst + 0xa4) = iVar9;
    pcVar7 = (char *)FUN_100fe890(iVar9,*(undefined4 *)(puVar1 + 0xa4));
    sVar2 = _strlen(pcVar7);
    iVar9 = iVar9 + 1 + sVar2;
    *(int *)((int)_Dst + 0xa8) = iVar9;
    FUN_100fe890(iVar9,*(undefined4 *)(puVar1 + 0xa8));
  }
  return _Dst;
}


