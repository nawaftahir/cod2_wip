// 10045e30 size=456 FUN_10045e30

void FUN_10045e30(void)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  int *unaff_ESI;
  int *piVar5;
  
  if ((((unaff_ESI[10] == 0) || (unaff_ESI[9] == 0)) || (unaff_ESI[0x11] < 1)) ||
     (unaff_ESI[0xb] < 1)) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x20;
    (**(code **)*unaff_ESI)();
  }
  if ((0xffdc < unaff_ESI[10]) || (0xffdc < unaff_ESI[9])) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x29;
    *(undefined4 *)(*unaff_ESI + 0x18) = 0xffdc;
    (**(code **)*unaff_ESI)();
  }
  if (unaff_ESI[0x10] != 8) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0xf;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[0x10];
    (**(code **)*unaff_ESI)();
  }
  if (10 < unaff_ESI[0x11]) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x1a;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[0x11];
    *(undefined4 *)(*unaff_ESI + 0x1c) = 10;
    (**(code **)*unaff_ESI)();
  }
  iVar4 = 0;
  unaff_ESI[0x38] = 1;
  unaff_ESI[0x39] = 1;
  if (0 < unaff_ESI[0x11]) {
    piVar5 = (int *)(unaff_ESI[0x13] + 0xc);
    do {
      if (((piVar5[-1] < 1) || (4 < piVar5[-1])) || ((*piVar5 < 1 || (4 < *piVar5)))) {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x12;
        (**(code **)*unaff_ESI)();
      }
      iVar2 = unaff_ESI[0x38];
      if (unaff_ESI[0x38] <= piVar5[-1]) {
        iVar2 = piVar5[-1];
      }
      unaff_ESI[0x38] = iVar2;
      iVar2 = unaff_ESI[0x39];
      if (unaff_ESI[0x39] <= *piVar5) {
        iVar2 = *piVar5;
      }
      unaff_ESI[0x39] = iVar2;
      iVar4 = iVar4 + 1;
      piVar5 = piVar5 + 0x15;
    } while (iVar4 < unaff_ESI[0x11]);
  }
  iVar4 = 0;
  if (0 < unaff_ESI[0x11]) {
    puVar3 = (undefined4 *)(unaff_ESI[0x13] + 0x24);
    do {
      puVar3[-8] = iVar4;
      *puVar3 = 8;
      puVar3[-2] = (unaff_ESI[9] * puVar3[-7] + -1 + unaff_ESI[0x38] * 8) / (unaff_ESI[0x38] * 8);
      puVar3[-1] = (unaff_ESI[10] * puVar3[-6] + -1 + unaff_ESI[0x39] * 8) / (unaff_ESI[0x39] * 8);
      puVar3[1] = (unaff_ESI[9] * puVar3[-7] + -1 + unaff_ESI[0x38]) / unaff_ESI[0x38];
      iVar2 = unaff_ESI[10];
      iVar1 = unaff_ESI[0x39];
      *(undefined1 *)(puVar3 + 3) = 1;
      iVar4 = iVar4 + 1;
      puVar3[2] = (iVar2 * puVar3[-6] + -1 + iVar1) / iVar1;
      puVar3 = puVar3 + 0x15;
    } while (iVar4 < unaff_ESI[0x11]);
  }
  unaff_ESI[0x3a] = (unaff_ESI[0x39] * 8 + -1 + unaff_ESI[10]) / (unaff_ESI[0x39] * 8);
  return;
}


