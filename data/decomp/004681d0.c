
long FUN_004681d0(void)

{
  int iVar1;
  char *pcVar2;
  long lVar3;
  undefined4 *unaff_EBX;
  char *pcVar4;
  bool bVar5;
  
  iVar1 = DAT_00596d48 * 0x45c;
  if ((&DAT_00592b8c)[iVar1] != '\0') {
    (&DAT_00592b8c)[iVar1] = 0;
    *unaff_EBX = *(undefined4 *)(&DAT_00592ba0 + iVar1);
    *(undefined4 *)(&DAT_00592b88 + iVar1) = *(undefined4 *)(&DAT_00592b9c + iVar1);
  }
  pcVar2 = (char *)FUN_00495060();
  if (*pcVar2 == '\0') {
    FUN_0047a5b0("WARNING: empty map\n");
    return -1;
  }
  iVar1 = 6;
  bVar5 = true;
  pcVar4 = "iwmap";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar5 = *pcVar2 == *pcVar4;
    pcVar2 = pcVar2 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (!bVar5) {
    FUN_00494cc0();
    return 0;
  }
  pcVar2 = (char *)FUN_00495490();
  lVar3 = _atol(pcVar2);
  return lVar3;
}

