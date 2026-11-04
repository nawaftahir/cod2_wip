// 1002acd0 size=215 FUN_1002acd0

int * FUN_1002acd0(int param_1)

{
  int *piVar1;
  int iVar2;
  char cVar3;
  int in_EAX;
  int *piVar4;
  int iVar5;
  int iVar6;
  
  iVar6 = 9 - param_1;
  if (*(int *)(in_EAX + 0xc404 + iVar6 * 8) == in_EAX + 0xc400 + iVar6 * 8) {
    cVar3 = FUN_1002abf0();
    if (cVar3 == '\0') {
      return (int *)0x0;
    }
  }
  piVar1 = *(int **)(in_EAX + 0xc404 + iVar6 * 8);
  *(int *)piVar1[1] = *piVar1;
  *(int *)(*piVar1 + 4) = piVar1[1];
  iVar2 = ((int)piVar1 - in_EAX) / 0x188;
  piVar4 = (int *)(iVar2 * 0x188 + in_EAX);
  if (iVar6 == 0) {
    *piVar4 = in_EAX + 0xc428;
    piVar4[1] = *(int *)(in_EAX + 0xc42c);
    *(int **)(in_EAX + 0xc42c) = piVar4;
    *(int **)piVar4[1] = piVar4;
  }
  iVar5 = (int)piVar1 + (-0x88 - (int)piVar4) >> 4;
  iVar6 = iVar5 + 0x10 >> (4U - (char)iVar6 & 0x1f);
  *(undefined1 *)((int)piVar4 + iVar6 * 4 + 10) = 1;
  iVar6 = iVar6 + -1;
  if (-1 < iVar6) {
    do {
      *(short *)(piVar4 + iVar6 + 3) =
           (short)piVar4[iVar6 + 3] + (short)(1 << ((byte)param_1 & 0x1f));
      iVar6 = iVar6 + -1 >> 1;
    } while (-1 < iVar6);
  }
  piVar4[iVar5 * 4 + 0x22] = (iVar2 * 0x10 + iVar5) * 0x20;
  return piVar4 + iVar5 * 4 + 0x22;
}


