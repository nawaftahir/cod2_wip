// 10044d80 size=126 FUN_10044d80

void FUN_10044d80(char param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  int *unaff_ESI;
  
  puVar1 = (undefined4 *)(**(code **)unaff_ESI[1])();
  unaff_ESI[0x52] = (int)puVar1;
  *puVar1 = &LAB_10044c80;
  if ((char)unaff_ESI[0x2e] == '\0') {
    if (param_1 != '\0') {
      *(undefined4 *)(*unaff_ESI + 0x14) = 4;
                    /* WARNING: Could not recover jumptable at 0x10044dba. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (**(code **)*unaff_ESI)();
      return;
    }
    iVar3 = 0;
    if (0 < unaff_ESI[0x11]) {
      puVar1 = puVar1 + 6;
      do {
        uVar2 = (**(code **)(unaff_ESI[1] + 8))();
        *puVar1 = uVar2;
        iVar3 = iVar3 + 1;
        puVar1 = puVar1 + 1;
      } while (iVar3 < unaff_ESI[0x11]);
    }
  }
  return;
}


