
void __fastcall FUN_00495490(undefined4 *param_1)

{
  int iVar1;
  
  iVar1 = DAT_00596d48 * 0x45c;
  if ((&DAT_00592b8c)[iVar1] != '\0') {
    (&DAT_00592b8c)[iVar1] = 0;
    if ((&DAT_00592b8d)[iVar1] == '\0') {
      return;
    }
    *param_1 = *(undefined4 *)(&DAT_00592ba0 + iVar1);
    *(undefined4 *)(&DAT_00592b88 + iVar1) = *(undefined4 *)(&DAT_00592b9c + iVar1);
  }
  FUN_00495060(param_1,0);
  return;
}

