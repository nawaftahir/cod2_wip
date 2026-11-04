// 10038c00 size=90 FUN_10038c00

void FUN_10038c00(void)

{
  undefined1 *in_EAX;
  int iVar1;
  int *in_EDX;
  int unaff_EBX;
  int *piVar2;
  
  iVar1 = 0;
  if (*(ushort *)(DAT_1072d9bc + 0x34) != 0) {
    piVar2 = *(int **)(DAT_1072d9bc + 0x3c);
    while (unaff_EBX != *piVar2) {
      iVar1 = iVar1 + 1;
      piVar2 = piVar2 + 3;
      if ((int)(uint)*(ushort *)(DAT_1072d9bc + 0x34) <= iVar1) {
        return;
      }
    }
    if (*(char *)((int)piVar2 + 5) == '\x05') {
      *in_EDX = *(int *)(*(int *)(piVar2[2] + 0x1c) + 0x40);
      *in_EAX = (char)piVar2[1];
      FUN_10038920();
      return;
    }
    *in_EDX = piVar2[2];
    *in_EAX = (char)piVar2[1];
    FUN_10038920();
  }
  return;
}


