// 10094810 size=460 FUN_10094810

uint FUN_10094810(void)

{
  int *piVar1;
  uint uVar2;
  undefined4 *puVar3;
  bool bVar4;
  bool bVar5;
  undefined4 *_Memory;
  uint uVar6;
  int iVar7;
  int in_ECX;
  uint uVar8;
  undefined4 *local_14;
  uint local_c;
  uint local_8;
  
  uVar8 = 0;
  bVar5 = false;
  FUN_1008a979();
  _Memory = operator_new(*(int *)(in_ECX + 8) << 2);
  if (_Memory == (undefined4 *)0x0) {
    uVar8 = 0x8007000e;
  }
  else {
    uVar6 = 0;
    local_c = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
        *(uint *)(iVar7 + 0x30) = uVar6;
        uVar2 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 4);
        if (((uVar2 & 0x100) != 0) && ((uVar2 & 0xc00) == 0)) {
          _Memory[uVar8] = uVar6;
          uVar8 = uVar8 + 1;
        }
        uVar6 = uVar6 + 1;
        local_c = uVar8;
      } while (uVar6 < *(uint *)(in_ECX + 8));
    }
    FUN_10086920(FUN_100864e9,_Memory,local_c,in_ECX);
    local_8 = 1;
    bVar4 = false;
    if (1 < local_c) {
      do {
        bVar5 = bVar4;
        piVar1 = _Memory + local_8;
        iVar7 = FUN_100864e9(*(undefined4 *)
                              (*(int *)(*(int *)(in_ECX + 0x14) + _Memory[local_8 - 1] * 4) + 0x30),
                             *piVar1,in_ECX);
        if (iVar7 == 0) {
          *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4) + 4) =
               *(undefined4 *)(in_ECX + 0x74);
          *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4) + 0x30) =
               *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + _Memory[local_8 - 1] * 4) + 0x30);
          bVar5 = true;
        }
        local_8 = local_8 + 1;
        bVar4 = bVar5;
      } while (local_8 < local_c);
      if (bVar5) {
        FUN_1008af24();
      }
    }
    uVar8 = 0;
    uVar6 = 0;
    local_c = 0;
    bVar4 = false;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
        *(uint *)(iVar7 + 0x30) = uVar8;
        iVar7 = *(int *)(iVar7 + 4);
        if ((*(int *)(in_ECX + 0x74) != iVar7) &&
           (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar7 * 4) + 4) & 0x40) != 0 ||
            (*(int *)(in_ECX + 0xdc) != 0)))) {
          _Memory[uVar6] = uVar8;
          uVar6 = uVar6 + 1;
        }
        uVar8 = uVar8 + 1;
        local_c = uVar6;
      } while (uVar8 < *(uint *)(in_ECX + 8));
    }
    FUN_10086920(FUN_10086538,_Memory,local_c,in_ECX);
    local_14 = _Memory;
    if (local_c != 0) {
      local_14 = (undefined4 *)*_Memory;
    }
    local_8 = 1;
    if (1 < local_c) {
      do {
        puVar3 = (undefined4 *)_Memory[local_8];
        iVar7 = FUN_10086538(local_14,puVar3,in_ECX);
        if (iVar7 == 0) {
          FUN_1008d905(local_14,puVar3);
          *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + _Memory[local_8] * 4) + 4) =
               *(undefined4 *)(in_ECX + 0x74);
          bVar4 = true;
          puVar3 = local_14;
        }
        local_14 = puVar3;
        local_8 = local_8 + 1;
      } while (local_8 < local_c);
      if (bVar4) {
        FUN_1008af24();
        bVar5 = true;
      }
    }
    _free(_Memory);
    uVar8 = (uint)!bVar5;
  }
  return uVar8;
}


