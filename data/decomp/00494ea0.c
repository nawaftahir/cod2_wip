
void FUN_00494ea0(void)

{
  char *in_EAX;
  char cVar1;
  int iVar2;
  undefined4 *unaff_ESI;
  
  cVar1 = *in_EAX;
  iVar2 = DAT_00596d48 * 0x45c;
  if (cVar1 < '!') {
    while (cVar1 != '\0') {
      if (cVar1 == '\n') {
        *(int *)(&DAT_00592b88 + iVar2) = *(int *)(&DAT_00592b88 + iVar2) + 1;
        *unaff_ESI = 1;
      }
      cVar1 = in_EAX[1];
      in_EAX = in_EAX + 1;
      if (' ' < cVar1) {
        return;
      }
    }
  }
  return;
}

