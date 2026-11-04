// 1003eea0 size=123 FUN_1003eea0

void FUN_1003eea0(void)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = DAT_10730550 * 0xcd0;
  *(undefined4 *)(&DAT_1072def0 + iVar1) = *(undefined4 *)(in_ECX + 8);
  *(undefined4 *)(&DAT_1072def4 + iVar1) = *(undefined4 *)(in_ECX + 0xc);
  *(undefined4 *)(&DAT_1072def8 + iVar1) = *(undefined4 *)(in_ECX + 0x10);
  *(undefined4 *)(&DAT_1072defc + iVar1) = 0;
  *(undefined4 *)(&DAT_1072df00 + iVar1) = *(undefined4 *)(in_ECX + 0x14);
  *(undefined4 *)(&DAT_1072df04 + iVar1) = *(undefined4 *)(in_ECX + 0x18);
  *(undefined4 *)(&DAT_1072df08 + iVar1) = *(undefined4 *)(in_ECX + 0x1c);
  *(undefined4 *)(&DAT_1072df0c + iVar1) = 0;
  *(undefined4 *)(&DAT_1072df10 + iVar1) = *(undefined4 *)(in_ECX + 0x20);
  *(undefined4 *)(&DAT_1072df14 + iVar1) = *(undefined4 *)(in_ECX + 0x24);
  *(undefined4 *)(&DAT_1072df18 + iVar1) = *(undefined4 *)(in_ECX + 0x28);
  *(undefined4 *)(&DAT_1072df1c + iVar1) = 0;
  *(undefined4 *)(&DAT_1072df20 + iVar1) = *(undefined4 *)(in_ECX + 0x2c);
  *(undefined4 *)(&DAT_1072df24 + iVar1) = *(undefined4 *)(in_ECX + 0x30);
  *(undefined4 *)(&DAT_1072df28 + iVar1) = *(undefined4 *)(in_ECX + 0x34);
  *(undefined4 *)(&DAT_1072df2c + iVar1) = 0x3f800000;
  FUN_1003de30();
  return;
}


