
/* WARNING: Type propagation algorithm not settling */

int __fastcall
FUN_00480d50(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            char *param_5,int param_6)

{
  char *pcVar1;
  undefined4 *puVar2;
  char cVar3;
  void *_Memory;
  int iVar4;
  undefined4 *_Memory_00;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  int iVar8;
  undefined4 *puVar9;
  int iVar10;
  int local_8;
  
  iVar8 = 0;
  *param_5 = '\0';
  local_8 = 0;
  iVar10 = 0;
  _Memory_00 = (undefined4 *)FUN_00480440(DAT_01233508,param_2,0,&local_8,3);
  iVar4 = local_8;
  if (0 < local_8) {
    do {
      pcVar6 = (char *)_Memory_00[iVar8];
      pcVar1 = pcVar6 + 1;
      pcVar5 = pcVar6;
      do {
        cVar3 = *pcVar5;
        pcVar5 = pcVar5 + 1;
      } while (cVar3 != '\0');
      pcVar7 = param_5;
      iVar4 = iVar8;
      if (param_6 <= (int)(pcVar5 + iVar10 + (2 - (int)pcVar1))) break;
      do {
        cVar3 = *pcVar6;
        pcVar6 = pcVar6 + 1;
        *pcVar7 = cVar3;
        pcVar7 = pcVar7 + 1;
      } while (cVar3 != '\0');
      param_5 = param_5 + (int)(pcVar5 + (1 - (int)pcVar1));
      iVar10 = iVar10 + (int)(pcVar5 + (1 - (int)pcVar1));
      iVar8 = iVar8 + 1;
      iVar4 = local_8;
    } while (iVar8 < local_8);
  }
  local_8 = iVar4;
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if (_Memory_00 != (undefined4 *)0x0) {
    _Memory = (void *)*_Memory_00;
    puVar9 = _Memory_00;
    while (_Memory != (void *)0x0) {
      _free(_Memory);
      puVar2 = puVar9 + 1;
      puVar9 = puVar9 + 1;
      _Memory = (void *)*puVar2;
    }
    _free(_Memory_00);
  }
  return local_8;
}

