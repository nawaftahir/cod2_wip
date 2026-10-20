
int __fastcall FUN_0047e3c0(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = FUN_004d8616(param_1);
  if (iVar1 == 0) {
    return 0;
  }
  iVar2 = FUN_0047db70();
  iVar3 = iVar2 * 0x11c;
  *(int *)(&DAT_011436b8 + iVar3) = iVar1;
  *(undefined4 *)(&DAT_011436cc + iVar3) = 0;
  FUN_00496430();
  *(undefined4 *)(&DAT_011436c0 + iVar3) = 0;
  return iVar2;
}

