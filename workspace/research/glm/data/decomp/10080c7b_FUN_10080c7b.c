// 10080c7b size=411 FUN_10080c7b

void FUN_10080c7b(uint param_1)

{
  ushort uVar1;
  short sVar2;
  int iVar3;
  ushort uVar4;
  undefined4 *puVar5;
  void *pvVar6;
  int iVar7;
  ushort uVar8;
  undefined4 *in_ECX;
  uint uVar9;
  int iVar10;
  undefined4 *puVar11;
  undefined4 local_1c;
  ushort local_16;
  ushort uStack_14;
  int local_c;
  int local_8;
  
  uVar1 = *(ushort *)(in_ECX[6] + 8);
  if ((param_1 < uVar1) && (uVar1 != 1)) {
    if (in_ECX[0xf] == 0) {
      puVar5 = operator_new((uint)uVar1 << 2);
      in_ECX[0xf] = puVar5;
      if (puVar5 == (undefined4 *)0x0) {
        return;
      }
      for (uVar9 = (uint)*(ushort *)(in_ECX[6] + 8); uVar9 != 0; uVar9 = uVar9 - 1) {
        *puVar5 = 0;
        puVar5 = puVar5 + 1;
      }
      for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
        *(undefined1 *)puVar5 = 0;
        puVar5 = (undefined4 *)((int)puVar5 + 1);
      }
    }
    local_8 = param_1 * 4;
    if (*(int *)(local_8 + in_ECX[0xf]) == 0) {
      if (in_ECX[0x10] == 0) {
        puVar5 = operator_new(0x10);
        in_ECX[0x10] = puVar5;
        if (puVar5 == (undefined4 *)0x0) {
          return;
        }
        puVar11 = (undefined4 *)in_ECX[6];
        *puVar5 = *puVar11;
        puVar5[1] = puVar11[1];
        puVar5[2] = puVar11[2];
        puVar5[3] = puVar11[3];
        *(undefined2 *)(in_ECX[0x10] + 8) = 1;
      }
      sVar2 = *(short *)(in_ECX + 0xb);
      uVar1 = *(ushort *)((int)in_ECX + 10);
      puVar11 = &local_1c;
      puVar5 = in_ECX;
      for (iVar10 = 5; puVar5 = puVar5 + 1, iVar10 != 0; iVar10 = iVar10 + -1) {
        *puVar11 = *puVar5;
        puVar11 = puVar11 + 1;
      }
      uVar8 = *(ushort *)(in_ECX + 0xb);
      uVar4 = sVar2 * (short)param_1 + uVar1;
      if ((int)(((uint)*(ushort *)(in_ECX + 3) - (uint)uVar4) + (uint)uVar1) < (int)(uint)uVar8) {
        uVar8 = (*(ushort *)(in_ECX + 3) - uVar4) + uVar1;
      }
      _local_16 = CONCAT22(uVar8,uVar4);
      iVar10 = (-(uint)(*(short *)(in_ECX + 2) != 0) & 3) + 1;
      if (in_ECX[5] != 0) {
        local_c = in_ECX[5] + in_ECX[0xb] * iVar10 * param_1 * 4;
      }
      iVar7 = in_ECX[0xb];
      iVar3 = in_ECX[8];
      pvVar6 = operator_new(0x44);
      if (pvVar6 == (void *)0x0) {
        iVar10 = 0;
      }
      else {
        iVar10 = FUN_1007d869(*in_ECX,&local_1c,in_ECX[0x10],in_ECX[7],
                              iVar3 + iVar7 * iVar10 * param_1 * 4);
      }
      *(int *)(local_8 + in_ECX[0xf]) = iVar10;
      if ((iVar10 != 0) && (iVar7 = FUN_10080af7(), iVar10 = local_8, iVar7 < 0)) {
        if (*(int *)(local_8 + in_ECX[0xf]) != 0) {
          FUN_1007e2e2(1);
        }
        *(undefined4 *)(iVar10 + in_ECX[0xf]) = 0;
      }
    }
  }
  return;
}


