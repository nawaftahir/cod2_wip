// 1005f4d0 size=67 FUN_1005f4d0

void FUN_1005f4d0(void)

{
  char *in_EAX;
  char cVar1;
  int iVar2;
  undefined4 *unaff_ESI;
  
  cVar1 = *in_EAX;
  iVar2 = DAT_101aac70 * 0x45c;
  if (cVar1 < '!') {
    while (cVar1 != '\0') {
      if (cVar1 == '\n') {
        *(int *)(&DAT_101a6ab0 + iVar2) = *(int *)(&DAT_101a6ab0 + iVar2) + 1;
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


