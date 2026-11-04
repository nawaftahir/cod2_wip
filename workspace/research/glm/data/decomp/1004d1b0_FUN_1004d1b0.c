// 1004d1b0 size=415 FUN_1004d1b0

uint FUN_1004d1b0(void)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  int *unaff_ESI;
  uint local_8;
  int *piStack_4;
  
  iVar1 = unaff_ESI[0x4b];
  if (iVar1 != 1) {
    if ((iVar1 < 1) || (4 < iVar1)) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1a;
      *(int *)(*unaff_ESI + 0x18) = unaff_ESI[0x4b];
      *(undefined4 *)(*unaff_ESI + 0x1c) = 4;
      (**(code **)*unaff_ESI)();
    }
    unaff_ESI[0x52] = 0;
    local_8 = 0;
    unaff_ESI[0x50] = (unaff_ESI[9] + -1 + unaff_ESI[0x46] * 8) / (unaff_ESI[0x46] * 8);
    uVar3 = (unaff_ESI[10] + -1 + unaff_ESI[0x47] * 8) / (unaff_ESI[0x47] * 8);
    unaff_ESI[0x51] = uVar3;
    if (0 < unaff_ESI[0x4b]) {
      piStack_4 = unaff_ESI + 0x4c;
      do {
        iVar1 = *piStack_4;
        uVar3 = *(uint *)(iVar1 + 8);
        uVar2 = *(uint *)(iVar1 + 0xc);
        *(uint *)(iVar1 + 0x40) = *(int *)(iVar1 + 0x24) * uVar3;
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
        if (10 < unaff_ESI[0x52] + iVar5) {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0xd;
          (**(code **)*unaff_ESI)();
        }
        if (0 < iVar5) {
          do {
            unaff_ESI[unaff_ESI[0x52] + 0x53] = local_8;
            iVar5 = iVar5 + -1;
            unaff_ESI[0x52] = unaff_ESI[0x52] + 1;
          } while (iVar5 != 0);
        }
        uVar3 = local_8 + 1;
        piStack_4 = piStack_4 + 1;
        local_8 = uVar3;
      } while ((int)uVar3 < unaff_ESI[0x4b]);
    }
    return uVar3;
  }
  iVar1 = unaff_ESI[0x4c];
  unaff_ESI[0x50] = *(int *)(iVar1 + 0x1c);
  unaff_ESI[0x51] = *(int *)(iVar1 + 0x20);
  uVar3 = *(uint *)(iVar1 + 0xc);
  *(undefined4 *)(iVar1 + 0x40) = *(undefined4 *)(iVar1 + 0x24);
  uVar2 = *(uint *)(iVar1 + 0x20);
  uVar4 = uVar2 % uVar3;
  *(undefined4 *)(iVar1 + 0x34) = 1;
  *(undefined4 *)(iVar1 + 0x38) = 1;
  *(undefined4 *)(iVar1 + 0x3c) = 1;
  *(undefined4 *)(iVar1 + 0x44) = 1;
  if (uVar4 == 0) {
    uVar4 = uVar3;
  }
  *(uint *)(iVar1 + 0x48) = uVar4;
  unaff_ESI[0x52] = 1;
  unaff_ESI[0x53] = 0;
  return uVar2 / uVar3;
}


