// 10044e40 size=104 FUN_10044e40

void FUN_10044e40(undefined1 param_1)

{
  int *piVar1;
  int iVar2;
  char cVar3;
  int *unaff_ESI;
  
  piVar1 = (int *)unaff_ESI[8];
  *(undefined1 *)*piVar1 = 0xff;
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
  *(undefined1 *)*piVar1 = param_1;
  iVar2 = piVar1[1];
  *piVar1 = *piVar1 + 1;
  piVar1[1] = iVar2 + -1;
  if (iVar2 + -1 == 0) {
    cVar3 = (*(code *)piVar1[3])();
    if (cVar3 == '\0') {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
                    /* WARNING: Could not recover jumptable at 0x10044ea5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (**(code **)*unaff_ESI)();
      return;
    }
  }
  return;
}


