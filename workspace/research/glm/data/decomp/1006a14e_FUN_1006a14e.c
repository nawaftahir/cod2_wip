// 1006a14e size=626 FUN_1006a14e

int FUN_1006a14e(void)

{
  int iVar1;
  void *_Base;
  undefined4 *in_ECX;
  uint uVar2;
  uint uVar3;
  int iVar4;
  undefined4 *puVar5;
  undefined4 local_40;
  undefined1 local_3c [4];
  undefined4 local_38;
  uint local_34;
  undefined1 local_30 [4];
  uint local_2c;
  undefined1 local_24 [16];
  void *local_14;
  undefined4 *local_10;
  uint local_c;
  undefined4 *local_8;
  
  iVar4 = 0;
  FUN_10084086(0x464e4946);
  iVar1 = in_ECX[0x1e];
  local_14 = (void *)0x0;
  local_8 = (undefined4 *)0x0;
  iVar1 = *(int *)(iVar1 + 0xac) + *(int *)(iVar1 + 0xa8) + *(int *)(iVar1 + 0xa4) +
          *(int *)(iVar1 + 0xa0) + *(int *)(iVar1 + 0x9c);
  if (iVar1 != 0) {
    _Base = operator_new(iVar1 * 4);
    local_14 = _Base;
    if (_Base == (void *)0x0) {
      iVar4 = -0x7ff8fff2;
    }
    else {
      FUN_10068bfc(_Base);
      iVar1 = *(int *)(in_ECX[0x1e] + 0xac);
      FUN_10068bfc((void *)((int)_Base + iVar1 * 4));
      iVar1 = iVar1 + *(int *)(in_ECX[0x1e] + 0xa8);
      FUN_10068bfc((void *)((int)_Base + iVar1 * 4));
      iVar1 = iVar1 + *(int *)(in_ECX[0x1e] + 0x9c);
      FUN_10068bfc((void *)((int)_Base + iVar1 * 4));
      iVar1 = iVar1 + *(int *)(in_ECX[0x1e] + 0xa0);
      FUN_10068bfc((void *)((int)_Base + iVar1 * 4));
      uVar3 = iVar1 + *(int *)(in_ECX[0x1e] + 0xa4);
      _qsort(_Base,uVar3,4,FUN_1006a087);
      local_10 = (undefined4 *)(uVar3 * 0x14);
      local_8 = operator_new((uint)local_10);
      if (local_8 == (undefined4 *)0x0) {
        iVar4 = -0x7ff8fff2;
      }
      else {
        puVar5 = &local_40;
        for (iVar1 = 7; iVar1 != 0; iVar1 = iVar1 + -1) {
          *puVar5 = 0;
          puVar5 = puVar5 + 1;
        }
        local_38 = 0;
        local_2c = in_ECX[0xf] | 4;
        local_40 = 0x1c;
        local_34 = uVar3;
        iVar4 = FUN_100840db(&local_40,0x1c,1,0);
        if (-1 < iVar4) {
          puVar5 = local_8;
          for (uVar2 = (uint)local_10 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
            *puVar5 = 0;
            puVar5 = puVar5 + 1;
          }
          for (uVar2 = (uint)local_10 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
            *(undefined1 *)puVar5 = 0;
            puVar5 = (undefined4 *)((int)puVar5 + 1);
          }
          iVar4 = FUN_100840db(local_8,local_10,1,local_30);
          if (-1 < iVar4) {
            local_c = 0;
            if (uVar3 != 0) {
              local_10 = local_8;
              do {
                puVar5 = *(undefined4 **)((int)local_14 + local_c * 4);
                iVar4 = FUN_100845fb(local_24,local_10,*puVar5,puVar5[1],*(undefined4 *)in_ECX[0x16]
                                    );
                if (iVar4 < 0) goto LAB_1006a3a0;
                local_c = local_c + 1;
                local_10 = local_10 + 5;
              } while (local_c < uVar3);
            }
            iVar4 = FUN_100840db("Microsoft (R) D3DX9 Shader Assembler 5.04.00.2904",0xffffffff,5,
                                 local_3c);
            if (-1 < iVar4) {
              uVar3 = FUN_10084214();
              if (uVar3 < 0x8001) {
                iVar4 = FUN_10069851(uVar3);
                if (-1 < iVar4) {
                  _memmove((void *)(in_ECX[0x16] + 4 + uVar3 * 4),(void *)(in_ECX[0x16] + 4),
                           in_ECX[0x17] * 4 - 4);
                  iVar4 = FUN_10084220(in_ECX[0x16] + 4,uVar3);
                  if (-1 < iVar4) {
                    in_ECX[0x17] = in_ECX[0x17] + uVar3;
                    in_ECX[0x1a] = in_ECX[0x1a] + uVar3;
                    in_ECX[0x19] = in_ECX[0x17];
                    iVar4 = 0;
                  }
                }
              }
              else {
                FUN_10067c3e(*in_ECX,in_ECX + 4,0x7ef,"fragment info exceeds maximum comment size");
                iVar4 = -0x7fffbffb;
              }
            }
          }
        }
      }
    }
  }
LAB_1006a3a0:
  _free(local_14);
  _free(local_8);
  FUN_100840a3();
  return iVar4;
}


