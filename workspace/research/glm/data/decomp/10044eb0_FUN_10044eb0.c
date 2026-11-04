// 10044eb0 size=102 FUN_10044eb0

void FUN_10044eb0(void)

{
  int *piVar1;
  int iVar2;
  char cVar3;
  undefined4 unaff_EBX;
  int *unaff_ESI;
  
  piVar1 = (int *)unaff_ESI[8];
  *(char *)*piVar1 = (char)((uint)unaff_EBX >> 8);
  iVar2 = piVar1[1];
  *piVar1 = *piVar1 + 1;
  piVar1[1] = iVar2 + -1;
  if (iVar2 + -1 == 0) {
    cVar3 = (*(code *)piVar1[3])();
    if (cVar3 == '\0') {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
      (**(code **)*unaff_ESI)();
    }
  }
  piVar1 = (int *)unaff_ESI[8];
  *(char *)*piVar1 = (char)unaff_EBX;
  iVar2 = piVar1[1];
  *piVar1 = *piVar1 + 1;
  piVar1[1] = iVar2 + -1;
  if (iVar2 + -1 == 0) {
    cVar3 = (*(code *)piVar1[3])();
    if (cVar3 == '\0') {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
      (**(code **)*unaff_ESI)();
    }
  }
  return;
}


