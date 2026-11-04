// 10080af7 size=388 FUN_10080af7

undefined4 FUN_10080af7(void)

{
  ushort uVar1;
  ushort uVar2;
  undefined4 *puVar3;
  undefined4 uVar4;
  int *in_ECX;
  uint uVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  int *piVar9;
  int local_2c;
  short local_28;
  undefined4 local_26;
  int local_20;
  uint local_18;
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  uint local_8;
  
  if (*(short *)(in_ECX[6] + 10) != 0) {
    puVar3 = operator_new((uint)*(ushort *)(in_ECX[6] + 10) << 2);
    in_ECX[0xe] = (int)puVar3;
    if (puVar3 == (undefined4 *)0x0) {
      return 0x8007000e;
    }
    for (uVar5 = (uint)*(ushort *)(in_ECX[6] + 10); uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar3 = 0;
      puVar3 = puVar3 + 1;
    }
    for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
      *(undefined1 *)puVar3 = 0;
      puVar3 = (undefined4 *)((int)puVar3 + 1);
    }
    local_c = in_ECX[8];
    iVar6 = in_ECX[6];
    piVar8 = &local_2c;
    piVar9 = in_ECX;
    for (iVar7 = 5; piVar9 = piVar9 + 1, iVar7 != 0; iVar7 = iVar7 + -1) {
      *piVar8 = *piVar9;
      piVar8 = piVar8 + 1;
    }
    uVar5 = (uint)*(ushort *)(iVar6 + 10);
    iVar6 = *(int *)(iVar6 + 0xc);
    if (*(uint *)(*in_ECX + 0xc) < iVar6 + uVar5 * 8) {
      return 0x80004005;
    }
    local_8 = 0;
    piVar9 = (int *)(*(int *)(*in_ECX + 8) + iVar6);
    if (uVar5 != 0) {
      do {
        iVar6 = *in_ECX;
        if (*(uint *)(iVar6 + 0xc) < piVar9[1] + 0x10U) {
          return 0x80004005;
        }
        local_10 = 0;
        local_14 = 0;
        iVar7 = *(int *)(iVar6 + 8) + piVar9[1];
        FUN_1007d733(iVar6,&local_2c,iVar7,1,&local_10,&local_14);
        local_2c = *piVar9;
        local_20 = piVar9[1];
        uVar1 = *(ushort *)((int)in_ECX + 10);
        local_18 = (uint)uVar1;
        uVar2 = *(short *)(iVar7 + 8) * (short)local_10;
        uVar5 = local_26 & 0xffff;
        local_26._2_2_ = uVar2;
        if ((uint)uVar1 + (uint)*(ushort *)(in_ECX + 3) < uVar5 + uVar2) {
          local_26._2_2_ = (uVar1 - (short)local_26) + (short)in_ECX[3];
        }
        uVar4 = FUN_1008085f(*in_ECX,&local_2c,iVar7,local_c);
        *(undefined4 *)(in_ECX[0xe] + local_8 * 4) = uVar4;
        piVar8 = (int *)(in_ECX[0xe] + local_8 * 4);
        if (*piVar8 == 0) {
          return 0x8007000e;
        }
        local_26 = CONCAT22(local_26._2_2_,(short)local_26 + local_26._2_2_);
        local_c = local_c + ((-(uint)(local_28 != 0) & 3) + 1) * *(int *)(*piVar8 + 0x2c) *
                            (uint)*(ushort *)(iVar7 + 8) * 4;
        piVar9 = piVar9 + 2;
        local_8 = local_8 + 1;
      } while (local_8 < *(ushort *)(in_ECX[6] + 10));
    }
  }
  return 0;
}


