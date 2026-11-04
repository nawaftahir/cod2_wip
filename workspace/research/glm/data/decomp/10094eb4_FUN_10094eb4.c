// 10094eb4 size=647 FUN_10094eb4

uint FUN_10094eb4(uint param_1)

{
  int iVar1;
  int iVar2;
  uint *puVar3;
  uint uVar4;
  uint uVar5;
  undefined4 *puVar6;
  bool bVar7;
  bool bVar8;
  uint *_Memory;
  int *piVar9;
  int iVar10;
  uint uVar11;
  int in_ECX;
  uint uVar12;
  uint local_24;
  uint *local_14;
  uint local_10;
  uint local_8;
  
  local_8 = 0;
  _Memory = operator_new(*(int *)(in_ECX + 0xc) << 2);
  if (_Memory == (uint *)0x0) {
    uVar12 = 0x8007000e;
  }
  else {
    local_10 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar3 = *(uint **)(*(int *)(in_ECX + 0x18) + local_10 * 4);
        uVar12 = *puVar3 & 0xfff00000;
        if ((((uVar12 != 0) &&
             ((((param_1 == 0 || (puVar3[9] == 0)) && (uVar12 != 0x10f00000)) &&
              ((uVar12 != 0x20700000 && (uVar12 != 0x11100000)))))) && (uVar12 != 0x11200000)) &&
           (((uVar12 != 0x11300000 && (uVar12 != 0x11400000)) &&
            ((uVar12 != 0x20800000 && ((uVar12 != 0x20900000 && (uVar12 != 0x11500000)))))))) {
          uVar12 = puVar3[3];
          local_14 = (uint *)0x0;
          if (uVar12 != 0) {
            piVar9 = (int *)puVar3[4];
            do {
              if ((*(ushort *)
                    (*(int *)(*(int *)(in_ECX + 0x10) +
                             *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar9 * 4) + 4) * 4) + 4)
                  & 0x1020) != 0) break;
              local_14 = (uint *)((int)local_14 + 1);
              piVar9 = piVar9 + 1;
            } while (local_14 < uVar12);
          }
          if (uVar12 <= local_14) {
            _Memory[local_8] = local_10;
            local_8 = local_8 + 1;
          }
        }
        local_10 = local_10 + 1;
      } while (local_10 < *(uint *)(in_ECX + 0xc));
    }
    bVar8 = false;
    while( true ) {
      uVar12 = local_8;
      bVar7 = false;
      FUN_1008af0b();
      FUN_10086920(FUN_1008b352,_Memory,local_8,in_ECX);
      if (local_8 == 0) break;
      local_10 = 1;
      local_24 = local_8;
      local_14 = _Memory;
      do {
        uVar4 = *local_14;
        uVar11 = local_10;
        if (uVar4 != 0xffffffff) {
          for (; uVar11 < local_8; uVar11 = uVar11 + 1) {
            uVar5 = _Memory[uVar11];
            if (uVar5 != 0xffffffff) {
              if ((uVar5 <= uVar4) || (iVar10 = FUN_1008b1b3(uVar5,in_ECX), iVar10 != 0)) break;
              iVar10 = *(int *)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
              puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
              param_1 = 0;
              if (*(int *)(iVar10 + 0xc) != 0) {
                do {
                  iVar1 = param_1 * 4;
                  iVar2 = param_1 * 4;
                  param_1 = param_1 + 1;
                  *(undefined4 *)
                   (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar6[4] + iVar1) * 4) + 0x30) =
                       *(undefined4 *)(*(int *)(iVar10 + 0x10) + iVar2);
                } while (param_1 < *(uint *)(iVar10 + 0xc));
              }
              _Memory[uVar11] = 0xffffffff;
              *puVar6 = 0;
              puVar6[1] = 0;
              puVar6[3] = 0;
              bVar8 = true;
              bVar7 = true;
            }
          }
        }
        local_14 = local_14 + 1;
        local_10 = local_10 + 1;
        local_24 = local_24 - 1;
      } while (local_24 != 0);
      if (!bVar7) break;
      local_8 = 0;
      local_24 = 0;
      if (uVar12 != 0) {
        do {
          uVar4 = _Memory[local_24];
          if (uVar4 != 0xffffffff) {
            iVar10 = *(int *)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
            uVar11 = *(uint *)(iVar10 + 4);
            param_1 = 0;
            if (uVar11 != 0) {
              piVar9 = *(int **)(iVar10 + 8);
              do {
                if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar9 * 4) + 0x30) != *piVar9)
                break;
                param_1 = param_1 + 1;
                piVar9 = piVar9 + 1;
              } while (param_1 < uVar11);
            }
            if (param_1 != uVar11) {
              _Memory[local_8] = uVar4;
              local_8 = local_8 + 1;
            }
          }
          local_24 = local_24 + 1;
        } while (local_24 < uVar12);
      }
      FUN_1008af24();
    }
    if (bVar8) {
      FUN_10094810();
    }
    uVar12 = (uint)!bVar8;
  }
  _free(_Memory);
  return uVar12;
}


