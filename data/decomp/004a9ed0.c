
void FUN_004a9ed0(void)

{
  char cVar1;
  int *piVar2;
  int iVar3;
  uint uVar4;
  
  piVar2 = (int *)FUN_004a87b0();
  uVar4 = *piVar2 - 1U & 0xff;
  cVar1 = *(char *)(uVar4 + 4 + (int)piVar2);
  while (cVar1 != '\0') {
    iVar3 = uVar4 + 0x104;
    uVar4 = uVar4 + 0x100;
    cVar1 = *(char *)((int)piVar2 + iVar3);
  }
  iVar3 = FUN_004a87b0();
  *(short *)(iVar3 + 2) = *(short *)(iVar3 + 2) + -1;
  if (*(short *)(iVar3 + 2) == 0) {
    FUN_004a9ba0();
  }
  return;
}

