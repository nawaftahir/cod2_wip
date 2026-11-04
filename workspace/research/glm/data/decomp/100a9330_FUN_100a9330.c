// 100a9330 size=591 FUN_100a9330

undefined4 FUN_100a9330(void)

{
  uint *puVar1;
  uint uVar2;
  int *piVar3;
  int iVar4;
  undefined4 uVar5;
  int in_ECX;
  int extraout_ECX;
  uint uVar6;
  int *piVar7;
  int iVar8;
  undefined8 uVar9;
  int *local_10;
  int *local_c;
  uint local_8;
  
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) == 0) {
LAB_100a946b:
    local_8 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      local_10 = *(int **)(in_ECX + 0x18);
      do {
        *(uint *)(in_ECX + 0xfc) = local_8;
        piVar3 = (int *)*local_10;
        *(int **)(in_ECX + 0x100) = piVar3;
        if (((piVar3 != (int *)0x0) && (*piVar3 != 0)) && (local_c = (int *)0x0, piVar3[1] != 0)) {
          piVar7 = (int *)piVar3[2];
          do {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4);
            if ((*(int *)(iVar4 + 4) == *(int *)(in_ECX + 0x80)) &&
               (*(char *)(iVar4 + 0x6c) == '\x05')) {
              FUN_1008b0b5(in_ECX,piVar3[0xf],0x11a0,
                           "cannot access w component from texcoord in general expression");
              goto LAB_100a9575;
            }
            local_c = (int *)((int)local_c + 1);
            piVar7 = piVar7 + 1;
          } while (local_c < *(uint *)(*(int *)(in_ECX + 0x100) + 4));
        }
        local_8 = local_8 + 1;
        local_10 = local_10 + 1;
      } while (local_8 < *(uint *)(in_ECX + 0xc));
    }
    uVar5 = 0;
  }
  else {
    local_c = *(int **)(in_ECX + 0x18);
    while( true ) {
      *(uint *)(in_ECX + 0xfc) = local_8;
      puVar1 = (uint *)*local_c;
      *(uint **)(in_ECX + 0x100) = puVar1;
      if ((puVar1 != (uint *)0x0) && (*puVar1 != 0)) break;
LAB_100a9458:
      local_8 = local_8 + 1;
      local_c = local_c + 1;
      if (*(uint *)(in_ECX + 0xc) <= local_8) goto LAB_100a946b;
    }
    uVar2 = *puVar1;
    uVar6 = uVar2 & 0xfff00000;
    if (0x60c00000 < uVar6) {
      if (uVar6 == 0x60d00000) {
        iVar4 = 2;
      }
      else {
        if (uVar6 == 0x61100000) {
          iVar4 = 3;
          goto LAB_100a94fe;
        }
        if (uVar6 != 0x61200000) goto LAB_100a9409;
        iVar4 = 3;
      }
      goto LAB_100a9506;
    }
    if (uVar6 == 0x60c00000) {
      iVar4 = 2;
LAB_100a94fe:
      iVar8 = 1;
    }
    else {
      if (uVar6 == 0x60200000) {
        iVar4 = 0;
        goto LAB_100a94fe;
      }
      if (uVar6 != 0x60300000) {
        if (uVar6 == 0x60700000) {
          if ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104) {
            iVar4 = 1;
            iVar8 = iVar4;
            goto LAB_100a9508;
          }
        }
        else if (uVar6 == 0x60800000) {
          iVar4 = 1;
          goto LAB_100a9506;
        }
LAB_100a9409:
        uVar9 = FUN_100a6e19(uVar6);
        iVar4 = (int)((ulonglong)uVar9 >> 0x20);
        in_ECX = extraout_ECX;
        if (((((int)uVar9 == 0) && (iVar4 != 0x11000000)) ||
            (iVar4 = *(int *)(*(int *)(extraout_ECX + 0x14) +
                             *(int *)(puVar1[2] +
                                     (-(uint)(iVar4 != 0x11000000) & uVar2 & 0xfffff) * 4) * 4),
            *(int *)(iVar4 + 0x3c) == 0)) ||
           (((*(uint *)(extraout_ECX + 200) & 0xffff) == 0x104 ||
            ((*(byte *)(*(int *)(*(int *)(extraout_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) &
             0x10) == 0)))) goto LAB_100a9458;
        FUN_1008b0b5(extraout_ECX,puVar1[0xf],0x11b4,
                     "dependent texture read not supported on ps_1_%i",
                     *(uint *)(extraout_ECX + 200) & 0xff);
        goto LAB_100a9575;
      }
      iVar4 = 0;
LAB_100a9506:
      iVar8 = 0;
    }
LAB_100a9508:
    FUN_1008b0b5(in_ECX,puVar1[0xf],0x11b4,"%s%s is not supported on ps_1_%i",
                 (&PTR_s_tex1D_101a4070)[iVar4],(&PTR_DAT_101a4080)[iVar8],
                 *(uint *)(in_ECX + 200) & 0xff);
LAB_100a9575:
    uVar5 = 0x80004005;
  }
  return uVar5;
}


