extern int FUN_10067634();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10067c3e(int param_1,int param_2,int param_3,char *param_4)

{
  int iVar1;
  size_t sVar2;
  char *_Dest;
  size_t _Count;
  char local_1004 [4092];
  unsigned int uStack_8;
  
  uStack_8 = 0x10067c4d;
  _Dest = local_1004;
  _Count = 0xffe;
  if (param_2 != 0) {
    if (*(int *)(param_2 + 0x10) != 0) {
      iVar1 = __snprintf(_Dest,0xffe,"%s",*(int *)(param_2 + 0x10));
      if (iVar1 < 0) {
        iVar1 = 0xffe;
      }
      _Dest = local_1004 + iVar1;
      _Count = 0xffe - iVar1;
    }
    iVar1 = *(int *)(param_2 + 0x14);
    if (iVar1 == 0) {
      iVar1 = 1;
    }
    sVar2 = __snprintf(_Dest,_Count,"(%u): ",iVar1);
    if ((int)sVar2 < 0) {
      sVar2 = _Count;
    }
    _Dest = _Dest + sVar2;
    _Count = _Count - sVar2;
  }
  if (param_3 != 0) {
    sVar2 = __snprintf(_Dest,_Count,"error X%u: ",param_3);
    if ((int)sVar2 < 0) {
      sVar2 = _Count;
    }
    _Dest = _Dest + sVar2;
    _Count = _Count - sVar2;
  }
  sVar2 = __vsnprintf(_Dest,_Count,param_4,&stack0x00000014);
  if ((int)sVar2 < 0) {
    sVar2 = _Count;
  }
  _Dest[sVar2] = '\n';
  (_Dest + sVar2)[1] = '\0';
  *(int *)(param_1 + 8) = *(int *)(param_1 + 8) + 1;
  FUN_10067634(local_1004);
  return;
}


