// 10047580 size=598 FUN_10047580

void FUN_10047580(void)

{
  int iVar1;
  int *in_EAX;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  
  iVar1 = in_EAX[0x11];
  if (in_EAX[5] != 100) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x14;
    *(int *)(*in_EAX + 0x18) = in_EAX[5];
    (**(code **)*in_EAX)();
  }
  if (iVar1 == 3) {
    if (in_EAX[0x12] == 3) {
      iVar4 = 10;
      goto LAB_100475cc;
    }
  }
  else if (4 < iVar1) {
    iVar4 = iVar1 * 6;
    goto LAB_100475cc;
  }
  iVar4 = iVar1 * 4 + 2;
LAB_100475cc:
  if ((in_EAX[0x5a] == 0) || (in_EAX[0x5b] < iVar4)) {
    iVar2 = iVar4;
    if (iVar4 < 0xb) {
      iVar2 = 10;
    }
    in_EAX[0x5b] = iVar2;
    iVar2 = (**(code **)in_EAX[1])();
    in_EAX[0x5a] = iVar2;
  }
  in_EAX[0x2d] = in_EAX[0x5a];
  in_EAX[0x2c] = iVar4;
  if ((iVar1 == 3) && (in_EAX[0x12] == 3)) {
    puVar3 = (undefined4 *)FUN_10047510(0);
    *puVar3 = 1;
    puVar3[1] = 0;
    puVar3[5] = 1;
    puVar3[6] = 5;
    puVar3[7] = 0;
    puVar3[8] = 2;
    puVar3[9] = 1;
    puVar3[10] = 2;
    puVar3[0xe] = 1;
    puVar3[0x10] = 0;
    puVar3[0x11] = 1;
    puVar3[0xf] = 0x3f;
    puVar3[0x12] = 1;
    puVar3[0x13] = 1;
    puVar3[0x17] = 1;
    puVar3[0x18] = 0x3f;
    puVar3[0x19] = 0;
    puVar3[0x1a] = 1;
    puVar3[0x1b] = 1;
    puVar3[0x1c] = 0;
    puVar3[0x20] = 6;
    puVar3[0x21] = 0x3f;
    puVar3[0x22] = 0;
    puVar3[0x23] = 2;
    puVar3[0x24] = 1;
    puVar3[0x25] = 0;
    puVar3[0x29] = 1;
    puVar3[0x2a] = 0x3f;
    puVar3[0x2b] = 2;
    puVar3[0x2c] = 1;
    puVar3 = (undefined4 *)FUN_10047510(1);
    *puVar3 = 1;
    puVar3[5] = 1;
    puVar3[6] = 0x3f;
    puVar3[7] = 1;
    puVar3[8] = 0;
    puVar3[1] = 2;
    puVar3[9] = 1;
    puVar3[10] = 1;
    puVar3[0xe] = 1;
    puVar3[0xf] = 0x3f;
    puVar3[0x10] = 1;
    puVar3[0x11] = 0;
    puVar3[0x18] = 0x3f;
    puVar3[0x12] = 1;
    puVar3[0x17] = 1;
    puVar3[0x19] = 1;
    puVar3[0x13] = 0;
    puVar3[0x1a] = 0;
    return;
  }
  puVar3 = (undefined4 *)FUN_10047510(0);
  iVar4 = 0;
  if (0 < iVar1) {
    do {
      puVar3[1] = iVar4;
      *puVar3 = 1;
      puVar3[5] = 1;
      puVar3[6] = 5;
      puVar3[7] = 0;
      puVar3[8] = 2;
      puVar3 = puVar3 + 9;
      iVar4 = iVar4 + 1;
    } while (iVar4 < iVar1);
  }
  iVar4 = 0;
  if (0 < iVar1) {
    do {
      puVar3[1] = iVar4;
      *puVar3 = 1;
      puVar3[5] = 6;
      puVar3[6] = 0x3f;
      puVar3[7] = 0;
      puVar3[8] = 2;
      puVar3 = puVar3 + 9;
      iVar4 = iVar4 + 1;
    } while (iVar4 < iVar1);
  }
  iVar4 = 0;
  if (0 < iVar1) {
    do {
      puVar3[1] = iVar4;
      *puVar3 = 1;
      puVar3[5] = 1;
      puVar3[6] = 0x3f;
      puVar3[7] = 2;
      puVar3[8] = 1;
      puVar3 = puVar3 + 9;
      iVar4 = iVar4 + 1;
    } while (iVar4 < iVar1);
  }
  puVar3 = (undefined4 *)FUN_10047510(1);
  iVar4 = 0;
  if (0 < iVar1) {
    do {
      puVar3[1] = iVar4;
      *puVar3 = 1;
      puVar3[5] = 1;
      puVar3[6] = 0x3f;
      puVar3[7] = 1;
      puVar3[8] = 0;
      puVar3 = puVar3 + 9;
      iVar4 = iVar4 + 1;
    } while (iVar4 < iVar1);
  }
  return;
}


