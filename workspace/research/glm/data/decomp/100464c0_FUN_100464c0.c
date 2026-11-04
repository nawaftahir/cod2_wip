// 100464c0 size=453 FUN_100464c0

uint FUN_100464c0(void)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  int *unaff_ESI;
  uint local_8;
  int *piStack_4;
  
  iVar1 = unaff_ESI[0x3b];
  if (iVar1 == 1) {
    iVar1 = unaff_ESI[0x3c];
    unaff_ESI[0x40] = *(int *)(iVar1 + 0x1c);
    unaff_ESI[0x41] = *(int *)(iVar1 + 0x20);
    uVar2 = *(uint *)(iVar1 + 0xc);
    uVar3 = *(uint *)(iVar1 + 0x20) / uVar2;
    uVar4 = *(uint *)(iVar1 + 0x20) % uVar2;
    *(undefined4 *)(iVar1 + 0x34) = 1;
    *(undefined4 *)(iVar1 + 0x38) = 1;
    *(undefined4 *)(iVar1 + 0x3c) = 1;
    *(undefined4 *)(iVar1 + 0x40) = 8;
    *(undefined4 *)(iVar1 + 0x44) = 1;
    if (uVar4 == 0) {
      uVar4 = uVar2;
    }
    *(uint *)(iVar1 + 0x48) = uVar4;
    unaff_ESI[0x42] = 1;
    unaff_ESI[0x43] = 0;
  }
  else {
    if ((iVar1 < 1) || (4 < iVar1)) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1a;
      *(int *)(*unaff_ESI + 0x18) = unaff_ESI[0x3b];
      *(undefined4 *)(*unaff_ESI + 0x1c) = 4;
      (**(code **)*unaff_ESI)();
    }
    unaff_ESI[0x42] = 0;
    local_8 = 0;
    unaff_ESI[0x40] = (unaff_ESI[9] + -1 + unaff_ESI[0x38] * 8) / (unaff_ESI[0x38] * 8);
    uVar3 = (unaff_ESI[10] + -1 + unaff_ESI[0x39] * 8) / (unaff_ESI[0x39] * 8);
    unaff_ESI[0x41] = uVar3;
    if (0 < unaff_ESI[0x3b]) {
      piStack_4 = unaff_ESI + 0x3c;
      do {
        iVar1 = *piStack_4;
        uVar3 = *(uint *)(iVar1 + 8);
        uVar2 = *(uint *)(iVar1 + 0xc);
        *(uint *)(iVar1 + 0x40) = uVar3 * 8;
        uVar4 = *(uint *)(iVar1 + 0x1c) % uVar3;
        iVar5 = uVar2 * uVar3;
        *(uint *)(iVar1 + 0x34) = uVar3;
        *(uint *)(iVar1 + 0x38) = uVar2;
        *(int *)(iVar1 + 0x3c) = iVar5;
        if (uVar4 == 0) {
          uVar4 = uVar3;
        }
        *(uint *)(iVar1 + 0x44) = uVar4;
        uVar3 = *(uint *)(iVar1 + 0x20) % uVar2;
        if (uVar3 == 0) {
          uVar3 = uVar2;
        }
        *(uint *)(iVar1 + 0x48) = uVar3;
        if (10 < unaff_ESI[0x42] + iVar5) {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0xd;
          (**(code **)*unaff_ESI)();
        }
        if (0 < iVar5) {
          do {
            unaff_ESI[unaff_ESI[0x42] + 0x43] = local_8;
            iVar5 = iVar5 + -1;
            unaff_ESI[0x42] = unaff_ESI[0x42] + 1;
          } while (iVar5 != 0);
        }
        uVar3 = local_8 + 1;
        piStack_4 = piStack_4 + 1;
        local_8 = uVar3;
      } while ((int)uVar3 < unaff_ESI[0x3b]);
    }
  }
  if (0 < unaff_ESI[0x32]) {
    uVar3 = unaff_ESI[0x40] * unaff_ESI[0x32];
    if (0xfffe < (int)uVar3) {
      uVar3 = 0xffff;
    }
    unaff_ESI[0x31] = uVar3;
  }
  return uVar3;
}


