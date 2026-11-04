// 10067d05 size=349 FUN_10067d05

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

int FUN_10067d05(int param_1,int param_2,int param_3,char *param_4)

{
  int iVar1;
  uint uVar2;
  uint *puVar3;
  size_t sVar4;
  char *_Dest;
  size_t _Count;
  char local_1010 [4096];
  uint local_10;
  char *local_c;
  int *local_8;
  
  local_8 = (int *)0x10067d14;
  _Dest = local_1010;
  _Count = 0xffe;
  iVar1 = FUN_100674ae(param_3,&local_8);
  if (-1 < iVar1) {
    iVar1 = (int)local_8 * 4;
    local_10 = *(uint *)(iVar1 + *(int *)(param_1 + 0x1c));
    uVar2 = local_10 & 0xf;
    if (uVar2 == 0xf) {
      local_8 = (int *)(param_1 + 8);
      local_c = "error";
    }
    else {
      local_8 = (int *)(param_1 + 0xc);
      local_c = "warning";
      if ((((*(uint *)(param_1 + 0x10) == 0) || (uVar2 == 0)) || (*(uint *)(param_1 + 0x10) < uVar2)
          ) || (((local_10 & 0x10) != 0 && ((local_10 & 0x20) != 0)))) {
        return 0;
      }
      puVar3 = (uint *)(*(int *)(param_1 + 0x1c) + iVar1);
      *puVar3 = *puVar3 | 0x20;
    }
    if (param_2 != 0) {
      if (*(int *)(param_2 + 0x10) != 0) {
        iVar1 = __snprintf(local_1010,0xffe,"%s",*(int *)(param_2 + 0x10));
        if (iVar1 < 0) {
          iVar1 = 0xffe;
        }
        _Dest = local_1010 + iVar1;
        _Count = 0xffe - iVar1;
      }
      iVar1 = *(int *)(param_2 + 0x14);
      if (iVar1 == 0) {
        iVar1 = 1;
      }
      sVar4 = __snprintf(_Dest,_Count,"(%u): ",iVar1);
      if ((int)sVar4 < 0) {
        sVar4 = _Count;
      }
      _Dest = _Dest + sVar4;
      _Count = _Count - sVar4;
    }
    if (param_3 != 0) {
      sVar4 = __snprintf(_Dest,_Count,"%s X%u: ",local_c,param_3);
      if ((int)sVar4 < 0) {
        sVar4 = _Count;
      }
      _Dest = _Dest + sVar4;
      _Count = _Count - sVar4;
    }
    sVar4 = __vsnprintf(_Dest,_Count,param_4,&stack0x00000014);
    if ((int)sVar4 < 0) {
      sVar4 = _Count;
    }
    _Dest[sVar4] = '\n';
    (_Dest + sVar4)[1] = '\0';
    *local_8 = *local_8 + 1;
    iVar1 = FUN_10067634(local_1010);
  }
  return iVar1;
}


