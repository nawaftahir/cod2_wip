// 10041710 size=221 FUN_10041710

void FUN_10041710(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int in_EAX;
  int in_ECX;
  int iVar5;
  int *unaff_ESI;
  int *piVar6;
  
  unaff_ESI[1] = 0;
  if (in_EAX != 0x3e) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0xc;
    *(undefined4 *)(*unaff_ESI + 0x18) = 0x3e;
    *(int *)(*unaff_ESI + 0x1c) = in_EAX;
    (**(code **)*unaff_ESI)();
  }
  if (in_ECX != 0x170) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x15;
    *(undefined4 *)(*unaff_ESI + 0x18) = 0x170;
    *(int *)(*unaff_ESI + 0x1c) = in_ECX;
    (**(code **)*unaff_ESI)();
  }
  iVar1 = unaff_ESI[6];
  iVar2 = unaff_ESI[7];
  iVar3 = *unaff_ESI;
  iVar4 = unaff_ESI[3];
  piVar6 = unaff_ESI;
  for (iVar5 = 0x5c; iVar5 != 0; iVar5 = iVar5 + -1) {
    *piVar6 = 0;
    piVar6 = piVar6 + 1;
  }
  *unaff_ESI = iVar3;
  unaff_ESI[3] = iVar4;
  unaff_ESI[6] = iVar1;
  unaff_ESI[7] = iVar2;
  *(undefined1 *)(unaff_ESI + 4) = 0;
  FUN_10055840();
  unaff_ESI[2] = 0;
  unaff_ESI[8] = 0;
  unaff_ESI[0x13] = 0;
  unaff_ESI[0x14] = 0;
  unaff_ESI[0x15] = 0;
  unaff_ESI[0x16] = 0;
  unaff_ESI[0x17] = 0;
  unaff_ESI[0x18] = 0;
  unaff_ESI[0x1c] = 0;
  unaff_ESI[0x19] = 0;
  unaff_ESI[0x1d] = 0;
  unaff_ESI[0x1a] = 0;
  unaff_ESI[0x1e] = 0;
  unaff_ESI[0x1b] = 0;
  unaff_ESI[0x1f] = 0;
  unaff_ESI[0xe] = 0;
  unaff_ESI[0xf] = 0x3ff00000;
  unaff_ESI[0x5a] = 0;
  unaff_ESI[5] = 100;
  return;
}


