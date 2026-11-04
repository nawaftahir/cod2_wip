// 10005590 size=231 FUN_10005590

void FUN_10005590(undefined4 *param_1)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *in_EAX;
  uint uVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 *in_EDX;
  int unaff_ESI;
  undefined4 local_60 [24];
  
  uVar4 = 0;
  puVar6 = (undefined4 *)&stack0xffffff98;
  do {
    if ((uVar4 & 1) == 0) {
      uVar5 = *in_EAX;
    }
    else {
      uVar5 = *in_EDX;
    }
    puVar6[2] = uVar5;
    if ((uVar4 & 2) == 0) {
      uVar5 = in_EAX[1];
    }
    else {
      uVar5 = in_EDX[1];
    }
    puVar6[3] = uVar5;
    if ((uVar4 & 4) == 0) {
      uVar5 = in_EAX[2];
    }
    else {
      uVar5 = in_EDX[2];
    }
    puVar6[4] = uVar5;
    uVar4 = uVar4 + 1;
    puVar6 = puVar6 + 3;
  } while ((int)uVar4 < 8);
  uVar4 = 0;
  do {
    iVar1 = *(int *)((int)&DAT_101924cc + uVar4);
    iVar2 = *(int *)((int)&DAT_101924c8 + uVar4);
    if (*(int *)(unaff_ESI + 0x34) + 1 <= *(int *)(unaff_ESI + 0x38)) {
      if (*(int *)(unaff_ESI + 0x30) == 0) {
        uVar5 = (*(code *)RI_Z_MallocInternal)(*(int *)(unaff_ESI + 0x38) * 0x2c);
        *(undefined4 *)(unaff_ESI + 0x30) = uVar5;
      }
      puVar6 = (undefined4 *)(*(int *)(unaff_ESI + 0x34) * 0x2c + *(int *)(unaff_ESI + 0x30));
      uVar5 = local_60[iVar2 * 3 + 1];
      *puVar6 = local_60[iVar2 * 3];
      uVar3 = local_60[iVar2 * 3 + 2];
      puVar6[1] = uVar5;
      uVar5 = local_60[iVar1 * 3];
      puVar6[2] = uVar3;
      uVar3 = local_60[iVar1 * 3 + 1];
      puVar6[3] = uVar5;
      puVar6[5] = local_60[iVar1 * 3 + 2];
      puVar6[4] = uVar3;
      puVar6[6] = *param_1;
      puVar6[7] = param_1[1];
      puVar6[8] = param_1[2];
      puVar6[9] = param_1[3];
      puVar6[10] = 0;
      *(int *)(unaff_ESI + 0x34) = *(int *)(unaff_ESI + 0x34) + 1;
    }
    uVar4 = uVar4 + 8;
  } while (uVar4 < 0x60);
  return;
}


