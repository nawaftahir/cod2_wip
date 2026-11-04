
int FUN_00495660(void)

{
  undefined4 *in_EAX;
  int iVar1;
  char *pcVar2;
  int iVar3;
  
  FUN_00494d20();
  iVar3 = 0;
  do {
    iVar1 = DAT_00596d48 * 0x45c;
    pcVar2 = &DAT_00592788 + iVar1;
    if ((&DAT_00592b8c)[iVar1] == '\0') {
LAB_004956bf:
      pcVar2 = (char *)FUN_00495060();
    }
    else {
      (&DAT_00592b8c)[iVar1] = 0;
      if ((&DAT_00592b8d)[iVar1] != '\0') {
        *in_EAX = *(undefined4 *)(&DAT_00592ba0 + iVar1);
        *(undefined4 *)(&DAT_00592b88 + iVar1) = *(undefined4 *)(&DAT_00592b9c + iVar1);
        goto LAB_004956bf;
      }
    }
    if (*pcVar2 == '\0') {
      FUN_00494de0();
      return iVar3;
    }
    iVar3 = iVar3 + 1;
  } while( true );
}

