
undefined4 FUN_00495590(int param_1)

{
  int iVar1;
  char *pcVar2;
  int *unaff_ESI;
  int iVar3;
  undefined4 local_8;
  
  local_8 = 0;
  iVar3 = 0;
  do {
    iVar1 = DAT_00596d48 * 0x45c;
    if ((&DAT_00592b8c)[iVar1] != '\0') {
      (&DAT_00592b8c)[iVar1] = 0;
      *unaff_ESI = *(int *)(&DAT_00592ba0 + iVar1);
      *(undefined4 *)(&DAT_00592b88 + iVar1) = *(undefined4 *)(&DAT_00592b9c + iVar1);
    }
    pcVar2 = (char *)FUN_00495060();
    if (pcVar2[1] == '\0') {
      if (*pcVar2 == '{') {
        if (iVar3 == param_1) {
          local_8 = 1;
        }
        else {
          iVar3 = iVar3 + 1;
        }
      }
      else if (*pcVar2 == '}') {
        iVar3 = iVar3 + -1;
      }
    }
  } while ((iVar3 != 0) && (*unaff_ESI != 0));
  return local_8;
}

