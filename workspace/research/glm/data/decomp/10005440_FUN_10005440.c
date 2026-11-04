// 10005440 size=197 FUN_10005440

void FUN_10005440(int param_1,undefined4 *param_2)

{
  undefined4 *in_EAX;
  int iVar1;
  uint uVar2;
  int *unaff_EBX;
  undefined4 *puVar3;
  
  if ((unaff_EBX[1] + param_1 <= unaff_EBX[2]) && (unaff_EBX[4] + 1 <= unaff_EBX[5])) {
    if (unaff_EBX[3] == 0) {
      iVar1 = (*(code *)RI_Z_MallocInternal)(unaff_EBX[5] * 0x18);
      unaff_EBX[3] = iVar1;
      iVar1 = (*(code *)RI_Z_MallocInternal)(unaff_EBX[2] * 0xc);
      *unaff_EBX = iVar1;
    }
    *(int *)(unaff_EBX[3] + 0x10 + unaff_EBX[4] * 0x18) = unaff_EBX[1];
    *(int *)(unaff_EBX[3] + 0x14 + unaff_EBX[4] * 0x18) = param_1;
    puVar3 = (undefined4 *)(unaff_EBX[3] + unaff_EBX[4] * 0x18);
    *puVar3 = *in_EAX;
    puVar3[1] = in_EAX[1];
    puVar3[2] = in_EAX[2];
    puVar3[3] = in_EAX[3];
    unaff_EBX[4] = unaff_EBX[4] + 1;
    puVar3 = (undefined4 *)(*unaff_EBX + unaff_EBX[1] * 0xc);
    for (uVar2 = param_1 * 3 & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar3 = *param_2;
      param_2 = param_2 + 1;
      puVar3 = puVar3 + 1;
    }
    for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
      *(undefined1 *)puVar3 = *(undefined1 *)param_2;
      param_2 = (undefined4 *)((int)param_2 + 1);
      puVar3 = (undefined4 *)((int)puVar3 + 1);
    }
    unaff_EBX[1] = unaff_EBX[1] + param_1;
  }
  return;
}


