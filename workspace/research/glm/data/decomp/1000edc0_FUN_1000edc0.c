// 1000edc0 size=79 FUN_1000edc0

void FUN_1000edc0(void)

{
  int in_EAX;
  byte bVar1;
  int in_ECX;
  int in_EDX;
  int iVar2;
  int unaff_EDI;
  
  if (((in_ECX == 0x31545844) || (in_ECX == 0x33545844)) || (iVar2 = 1, in_ECX == 0x35545844)) {
    iVar2 = 4;
  }
  if (-1 < in_EAX - in_EDX) {
    in_EAX = in_EDX;
  }
  bVar1 = 3;
  do {
    if (iVar2 <= in_EAX >> (bVar1 & 0x1f)) break;
    bVar1 = bVar1 - 1;
  } while (bVar1 != 0);
  iVar2 = 0;
  do {
    if (bVar1 < *(byte *)(iVar2 + unaff_EDI)) {
      *(byte *)(iVar2 + unaff_EDI) = bVar1;
    }
    iVar2 = iVar2 + 1;
  } while (iVar2 < 2);
  return;
}


