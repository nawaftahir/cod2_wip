
void __fastcall FUN_00495880(undefined4 *param_1)

{
  int iVar1;
  char *_Str;
  
  iVar1 = DAT_00596d48 * 0x45c;
  if ((&DAT_00592b8c)[iVar1] != '\0') {
    (&DAT_00592b8c)[iVar1] = 0;
    *param_1 = *(undefined4 *)(&DAT_00592ba0 + iVar1);
    *(undefined4 *)(&DAT_00592b88 + iVar1) = *(undefined4 *)(&DAT_00592b9c + iVar1);
  }
  _Str = (char *)FUN_00495060(param_1,1);
  _atol(_Str);
  return;
}

