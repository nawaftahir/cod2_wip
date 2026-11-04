// 10041850 size=97 FUN_10041850

void FUN_10041850(void)

{
  int in_EAX;
  int *piVar1;
  undefined1 in_DL;
  int iVar2;
  
  if (*(int *)(in_EAX + 0x50) != 0) {
    *(undefined1 *)(*(int *)(in_EAX + 0x50) + 0x80) = in_DL;
  }
  if (*(int *)(in_EAX + 0x54) != 0) {
    *(undefined1 *)(*(int *)(in_EAX + 0x54) + 0x80) = in_DL;
  }
  if (*(int *)(in_EAX + 0x58) != 0) {
    *(undefined1 *)(*(int *)(in_EAX + 0x58) + 0x80) = in_DL;
  }
  if (*(int *)(in_EAX + 0x5c) != 0) {
    *(undefined1 *)(*(int *)(in_EAX + 0x5c) + 0x80) = in_DL;
  }
  piVar1 = (int *)(in_EAX + 0x70);
  iVar2 = 4;
  do {
    if (piVar1[-4] != 0) {
      *(undefined1 *)(piVar1[-4] + 0x111) = in_DL;
    }
    if (*piVar1 != 0) {
      *(undefined1 *)(*piVar1 + 0x111) = in_DL;
    }
    piVar1 = piVar1 + 1;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  return;
}


