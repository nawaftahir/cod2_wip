// 10080e37 size=519 FUN_10080e37

int FUN_10080e37(int param_1,int param_2)

{
  uint *puVar1;
  int *piVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  void *pvVar6;
  ushort *puVar7;
  int in_ECX;
  uint uVar8;
  uint uVar9;
  int iVar10;
  undefined4 *local_c;
  int *local_8;
  
  if (param_1 == 0) {
    return -0x7789f794;
  }
  puVar1 = (uint *)(in_ECX + 0xc);
  iVar3 = FUN_10062db3(param_1,0x42415443,&local_c,puVar1);
  if (iVar3 < 0) {
    return iVar3;
  }
  if (iVar3 == 1) {
    return -0x7789f4a7;
  }
  puVar4 = operator_new(*puVar1);
  *(undefined4 **)(in_ECX + 8) = puVar4;
  if (puVar4 == (undefined4 *)0x0) {
    return -0x7ff8fff2;
  }
  uVar9 = *puVar1;
  for (uVar8 = uVar9 >> 2; uVar8 != 0; uVar8 = uVar8 - 1) {
    *puVar4 = *local_c;
    local_c = local_c + 1;
    puVar4 = puVar4 + 1;
  }
  for (uVar9 = uVar9 & 3; uVar9 != 0; uVar9 = uVar9 - 1) {
    *(undefined1 *)puVar4 = *(undefined1 *)local_c;
    local_c = (undefined4 *)((int)local_c + 1);
    puVar4 = (undefined4 *)((int)puVar4 + 1);
  }
  puVar1 = *(uint **)(in_ECX + 8);
  *(uint **)(in_ECX + 0x10) = puVar1;
  if (*puVar1 < 0x1c) {
LAB_10080eb9:
    iVar3 = -0x7789f4a7;
  }
  else {
    puVar4 = operator_new(puVar1[3] << 2);
    *(undefined4 **)(in_ECX + 0x14) = puVar4;
    if (puVar4 != (undefined4 *)0x0) {
      for (uVar9 = *(uint *)(*(int *)(in_ECX + 0x10) + 0xc) & 0x3fffffff; uVar9 != 0;
          uVar9 = uVar9 - 1) {
        *puVar4 = 0;
        puVar4 = puVar4 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(undefined1 *)puVar4 = 0;
        puVar4 = (undefined4 *)((int)puVar4 + 1);
      }
      iVar3 = *(int *)(in_ECX + 0x10);
      *(undefined4 *)(in_ECX + 0x18) = *(undefined4 *)(iVar3 + 0xc);
      if (*(uint *)(in_ECX + 0xc) < (uint)(*(int *)(iVar3 + 0x10) + *(int *)(iVar3 + 0xc) * 0x14))
      goto LAB_10080eb9;
      param_1 = 0;
      iVar3 = *(int *)(in_ECX + 8) + *(int *)(iVar3 + 0x10);
      uVar9 = 0;
      if (*(int *)(in_ECX + 0x18) != 0) {
        local_8 = (int *)(iVar3 + 0xc);
        do {
          if (*(uint *)(in_ECX + 0xc) < *local_8 + 0x10U) goto LAB_10080eb9;
          uVar5 = FUN_1008085f(in_ECX,local_8 + -3,*(int *)(in_ECX + 8) + *local_8,0);
          *(undefined4 *)(*(int *)(in_ECX + 0x14) + uVar9 * 4) = uVar5;
          piVar2 = (int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
          if (*piVar2 == 0) goto LAB_10080ed9;
          iVar10 = *piVar2;
          local_8 = local_8 + 5;
          param_1 = param_1 + ((-(uint)(*(short *)(iVar10 + 8) != 0) & 3) + 1) *
                              (uint)*(ushort *)(*(int *)(iVar10 + 0x18) + 8) *
                              *(int *)(iVar10 + 0x2c);
          uVar9 = uVar9 + 1;
        } while (uVar9 < *(uint *)(in_ECX + 0x18));
      }
      pvVar6 = operator_new(param_1 << 2);
      uVar9 = 0;
      *(void **)(in_ECX + 0x1c) = pvVar6;
      if (pvVar6 != (void *)0x0) {
        param_1 = 0;
        if (*(int *)(in_ECX + 0x18) != 0) {
          do {
            FUN_1007d968(*(int *)(in_ECX + 0x1c) + param_1 * 4);
            iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
            param_1 = param_1 + ((-(uint)(*(short *)(iVar10 + 8) != 0) & 3) + 1) *
                                (uint)*(ushort *)(*(int *)(iVar10 + 0x18) + 8) *
                                *(int *)(iVar10 + 0x2c);
            uVar9 = uVar9 + 1;
          } while (uVar9 < *(uint *)(in_ECX + 0x18));
        }
        uVar9 = 0;
        if (param_2 != 0) {
          if (*(int *)(in_ECX + 0x18) != 0) {
            iVar10 = *(int *)(in_ECX + 0x18);
            puVar7 = (ushort *)(iVar3 + 8);
            do {
              if ((puVar7[-2] == 2) && (uVar9 < (uint)puVar7[-1] + (uint)*puVar7)) {
                uVar9 = (uint)puVar7[-1] + (uint)*puVar7;
              }
              puVar7 = puVar7 + 10;
              iVar10 = iVar10 + -1;
            } while (iVar10 != 0);
          }
          iVar3 = FUN_10081e27(uVar9 << 4,param_2);
          if (iVar3 < 0) {
            return iVar3;
          }
        }
        return 0;
      }
    }
LAB_10080ed9:
    iVar3 = -0x7ff8fff2;
  }
  return iVar3;
}


