// 10060c70 size=103 FUN_10060c70

char * FUN_10060c70(char *param_1)

{
  int iVar1;
  uint uVar2;
  char *_Dest;
  
  iVar1 = (*(code *)RI_DB_EnumXAssets)(1);
  _Dest = (char *)(*(int *)(iVar1 + 0x800) * 0x400 + iVar1);
  uVar2 = *(int *)(iVar1 + 0x800) + 1U & 0x80000001;
  if ((int)uVar2 < 0) {
    uVar2 = (uVar2 - 1 | 0xfffffffe) + 1;
  }
  *(uint *)(iVar1 + 0x800) = uVar2;
  iVar1 = __vsnprintf(_Dest,0x400,param_1,&stack0x00000008);
  _Dest[0x3ff] = '\0';
  if ((iVar1 < 0) || (0x3ff < iVar1)) {
    FUN_10061cd0(1,&DAT_1019bbf8);
  }
  return _Dest;
}


