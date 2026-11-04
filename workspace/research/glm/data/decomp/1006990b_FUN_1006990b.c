// 1006990b size=1916 FUN_1006990b

int FUN_1006990b(uint param_1)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 *in_ECX;
  uint uVar7;
  int *piVar8;
  bool bVar9;
  bool bVar10;
  undefined4 uVar11;
  char *pcVar12;
  int *local_8;
  
  iVar4 = param_1;
  *(undefined4 *)(param_1 + 0x58) = in_ECX[0x17] << 2;
  iVar5 = *(int *)(param_1 + 0x30);
  local_8 = (int *)0x1;
  bVar9 = false;
  if (iVar5 == 0x1f) {
    local_8 = (int *)0x2;
  }
  if (in_ECX[0x1e] != 0) {
    if ((((iVar5 == 0x1a) || (iVar5 == 0x19)) || (iVar5 == 0x1c)) || (iVar5 == 0x1e)) {
      pcVar12 = "call, callnz, label, and ret instructions are not allowed in assembly fragments";
      uVar11 = 0x7e9;
LAB_10069985:
      FUN_10067c3e(*in_ECX,param_1 + 0x10,uVar11,pcVar12);
      return -0x7fffbffb;
    }
    if (((((iVar5 == 0x14) || (iVar5 == 0x15)) ||
         ((iVar5 == 0x16 || ((iVar5 == 0x17 || (iVar5 == 0x18)))))) &&
        (*(int *)(param_1 + 0x48) != 0)) && (*(int *)(*(int *)(param_1 + 0x48) + 0x10) == 0)) {
      pcVar12 = "Matrices cannot be specified in temp registers with the fragment linker";
      uVar11 = 0x7ea;
      goto LAB_10069985;
    }
  }
  iVar5 = *(int *)(param_1 + 0x3c);
  piVar8 = local_8;
  if ((iVar5 != 0) && (*(int *)(iVar5 + 4) == 0x13)) {
    bVar9 = *(int *)(iVar5 + 0x10) == -1;
    if (*(int *)(iVar5 + 0x14) != 0) {
      FUN_10067c3e(*in_ECX,param_1 + 0x10,0x7de,
                   "source modifiers are not allowed on destination parameters");
      in_ECX[0x13] = 1;
    }
    iVar5 = *(int *)(iVar5 + 0x28);
    piVar8 = (int *)((int)local_8 + 1);
    if (iVar5 != 0) {
      if (((int)in_ECX[0xe] < 4) || (5 < (int)in_ECX[0xe])) {
        FUN_10067c3e(*in_ECX,param_1 + 0x10,0x7d8,
                     "relative addressing of destination parameters is not supported in this shader version"
                    );
        in_ECX[0x13] = 1;
      }
      else {
        bVar9 = *(int *)(iVar5 + 0x10) == -1 || bVar9;
        if (*(int *)(iVar5 + 0x28) != 0) {
          FUN_10067c3e(*in_ECX,param_1 + 0x10,0x7d9,
                       "only one address register reference is allowed in a relative address expression"
                      );
          in_ECX[0x13] = 1;
        }
        piVar8 = (int *)((int)local_8 + 2);
      }
    }
  }
  local_8 = piVar8;
  if ((*(int *)(param_1 + 0x40) != 0) && (*(int *)(*(int *)(param_1 + 0x40) + 4) == 0x13)) {
    iVar5 = in_ECX[0xe];
    if (((-1 < iVar5) && (iVar5 < 2)) || ((5 < iVar5 && (iVar5 < 0xb)))) {
      FUN_10067c3e(*in_ECX,param_1 + 0x10,0x7e5,
                   "predicates are not supported in this shader version");
      in_ECX[0x13] = 1;
    }
    iVar5 = *(int *)(param_1 + 0x40);
    local_8 = (int *)((int)local_8 + 1);
    if (*(int *)(iVar5 + 0x10) == -1) {
      bVar9 = true;
    }
    if ((*(int *)(iVar5 + 0x14) != 0) && (*(int *)(iVar5 + 0x14) != 0xd000000)) {
      FUN_10067c3e(*in_ECX,param_1 + 0x10,0x7e3,"source modifiers are not allowed on predicates");
      in_ECX[0x13] = 1;
    }
    if (*(int *)(iVar5 + 0x28) != 0) {
      FUN_10067c3e(*in_ECX,param_1 + 0x10,0x7e4,
                   "relative addressing of predicates is not supported in this shader version");
      in_ECX[0x13] = 1;
    }
  }
  param_1 = 0;
  piVar8 = (int *)(iVar4 + 0x44);
  do {
    iVar5 = *piVar8;
    if (iVar5 == 0) break;
    iVar6 = *(int *)(iVar4 + 0x30);
    piVar1 = (int *)((int)local_8 + 1);
    if (((iVar6 != 0x51) && (iVar6 != 0x30)) && (iVar6 != 0x2f)) {
      if (*(int *)(iVar5 + 0x10) == -1) {
        bVar9 = true;
      }
      iVar5 = *(int *)(iVar5 + 0x28);
      if (iVar5 != 0) {
        if (*(int *)(iVar5 + 0x10) == -1) {
          bVar9 = true;
        }
        if (*(int *)(iVar5 + 0x28) != 0) {
          FUN_10067c3e(*in_ECX,iVar4 + 0x10,0x7d9,
                       "only one address register reference is allowed in a relative address expression"
                      );
          in_ECX[0x13] = 1;
        }
        if (in_ECX[0xe] != 0) {
          piVar1 = (int *)((int)local_8 + 2);
        }
      }
    }
    local_8 = piVar1;
    param_1 = param_1 + 1;
    piVar8 = piVar8 + 1;
  } while (param_1 < 4);
  iVar5 = FUN_10069851(local_8);
  if (iVar5 < 0) {
    return iVar5;
  }
  iVar5 = in_ECX[0x17] + (int)local_8;
  uVar7 = *(uint *)(iVar4 + 0x30);
  if ((uVar7 != 3) ||
     (((iVar6 = in_ECX[0xe], iVar6 < 0 || (5 < iVar6)) && ((iVar6 < 10 || (0xe < iVar6))))))
  goto LAB_10069cb5;
  iVar6 = *(int *)(iVar4 + 0x48);
  uVar2 = *(uint *)(iVar6 + 0x14);
  uVar11 = 0x7000000;
  uVar7 = 2;
  if (uVar2 < 0x7000001) {
    if (uVar2 == 0x7000000) {
      *(undefined4 *)(iVar6 + 0x14) = 0x8000000;
      goto LAB_10069cb5;
    }
    if (uVar2 == 0) {
      *(undefined4 *)(iVar6 + 0x14) = 0x1000000;
      goto LAB_10069cb5;
    }
    if (uVar2 == 0x1000000) {
      *(undefined4 *)(iVar6 + 0x14) = 0;
      goto LAB_10069cb5;
    }
    uVar11 = 0x2000000;
    if (uVar2 == 0x2000000) {
      *(undefined4 *)(iVar6 + 0x14) = 0x3000000;
      goto LAB_10069cb5;
    }
    if (uVar2 != 0x3000000) {
      uVar11 = 0x4000000;
      if (uVar2 == 0x4000000) {
        *(undefined4 *)(iVar6 + 0x14) = 0x5000000;
        goto LAB_10069cb5;
      }
      if (uVar2 != 0x5000000) {
        bVar10 = uVar2 == 0x6000000;
        goto LAB_10069c24;
      }
    }
  }
  else if (uVar2 != 0x8000000) {
    if ((uVar2 != 0x9000000) && (uVar2 != 0xa000000)) {
      uVar11 = 0xb000000;
      if (uVar2 == 0xb000000) {
        *(undefined4 *)(iVar6 + 0x14) = 0xc000000;
        goto LAB_10069cb5;
      }
      if (uVar2 == 0xc000000) goto LAB_10069cb2;
      bVar10 = uVar2 == 0xd000000;
LAB_10069c24:
      if (!bVar10) goto LAB_10069cb5;
    }
    FUN_10067c3e(*in_ECX,iVar4 + 0x10,0x7dd,"source modifiers incompatible with SUB instruction");
    in_ECX[0x13] = 1;
    goto LAB_10069cb5;
  }
LAB_10069cb2:
  *(undefined4 *)(iVar6 + 0x14) = uVar11;
LAB_10069cb5:
  if (*(int *)(iVar4 + 0x54) != 0) {
    uVar7 = uVar7 | 0x40000000;
  }
  if (*(int *)(iVar4 + 0x40) != 0) {
    uVar7 = uVar7 | 0x10000000;
  }
  iVar6 = in_ECX[0xe];
  if (((0 < iVar6) && (iVar6 < 6)) || ((9 < iVar6 && (iVar6 < 0xf)))) {
    uVar7 = uVar7 | ((int)local_8 + -1) * 0x1000000;
  }
  iVar6 = *(int *)(iVar4 + 0x30);
  if (((iVar6 == 0x29) || (iVar6 == 0x2d)) || (iVar6 == 0x5e)) {
    uVar7 = uVar7 | (*(uint *)(iVar4 + 0x38) & 7) << 0x10;
  }
  *(uint *)(in_ECX[0x16] + in_ECX[0x17] * 4) = uVar7;
  in_ECX[0x17] = in_ECX[0x17] + 1;
  iVar6 = in_ECX[0x17];
  if (*(int *)(iVar4 + 0x30) == 0x1f) {
    *(uint *)(in_ECX[0x16] + iVar6 * 4) = *(uint *)(iVar4 + 0x38) | 0x80000000;
    in_ECX[0x17] = in_ECX[0x17] + 1;
    iVar6 = in_ECX[0x17];
  }
  iVar3 = *(int *)(iVar4 + 0x3c);
  if ((iVar3 != 0) && (*(int *)(iVar3 + 4) == 0x13)) {
    if ((in_ECX[0xe] == 0) && (*(int *)(iVar3 + 0x20) == 0xf0000)) {
      iVar6 = *(int *)(iVar4 + 0x30);
      if ((iVar6 == 0x15) || (iVar6 == 0x17)) {
        *(undefined4 *)(iVar3 + 0x20) = 0x70000;
      }
      else if (iVar6 == 0x18) {
        *(undefined4 *)(iVar3 + 0x20) = 0x30000;
      }
    }
    uVar7 = ((*(uint *)(iVar3 + 0x10) | 0xfffffff8) << 0x14 | *(uint *)(iVar3 + 0x10) & 0x18) << 8 |
            *(uint *)(iVar4 + 0x34) & 0xff00000 | *(uint *)(iVar3 + 0x18) & 0x7ff |
            *(uint *)(iVar3 + 0x20) & 0xf0000;
    if (*(int *)(iVar3 + 0x28) != 0) {
      uVar7 = uVar7 | 0x2000;
    }
    *(uint *)(in_ECX[0x16] + in_ECX[0x17] * 4) = uVar7;
    in_ECX[0x17] = in_ECX[0x17] + 1;
    iVar3 = *(int *)(iVar3 + 0x28);
    iVar6 = in_ECX[0x17];
    if (iVar3 != 0) {
      *(uint *)(in_ECX[0x16] + iVar6 * 4) =
           ((*(uint *)(iVar3 + 0x10) | 0xfffffff8) << 0x14 | *(uint *)(iVar3 + 0x10) & 0x18) << 8 |
           *(uint *)(iVar3 + 0x14) & 0xf000000 | *(uint *)(iVar3 + 0x18) & 0x7ff |
           *(uint *)(iVar3 + 0x24) & 0xff0000;
      in_ECX[0x17] = in_ECX[0x17] + 1;
      iVar6 = in_ECX[0x17];
    }
  }
  iVar3 = *(int *)(iVar4 + 0x40);
  if ((iVar3 != 0) && (*(int *)(iVar3 + 4) == 0x13)) {
    *(uint *)(in_ECX[0x16] + iVar6 * 4) =
         ((*(uint *)(iVar3 + 0x10) | 0xfffffff8) << 0x14 | *(uint *)(iVar3 + 0x10) & 0x18) << 8 |
         *(uint *)(iVar3 + 0x14) & 0xf000000 | *(uint *)(iVar3 + 0x18) & 0x7ff |
         *(uint *)(iVar3 + 0x24) & 0xff0000;
    in_ECX[0x17] = in_ECX[0x17] + 1;
    iVar6 = in_ECX[0x17];
  }
  iVar3 = *(int *)(iVar4 + 0x30);
  if (iVar3 == 0x51) {
    param_1 = 0;
    piVar8 = (int *)(iVar4 + 0x44);
    do {
      iVar3 = *piVar8;
      if (iVar3 == 0) break;
      if ((4 < *(int *)(iVar3 + 0x10)) && (*(int *)(iVar3 + 0x10) < 9)) {
        *(float *)(in_ECX[0x16] + iVar6 * 4) = (float)*(double *)(iVar3 + 0x18);
      }
      in_ECX[0x17] = in_ECX[0x17] + 1;
      param_1 = param_1 + 1;
      iVar6 = in_ECX[0x17];
      piVar8 = piVar8 + 1;
    } while (param_1 < 4);
  }
  else if (iVar3 == 0x30) {
    param_1 = 0;
    piVar8 = (int *)(iVar4 + 0x44);
    do {
      iVar3 = *piVar8;
      if (iVar3 == 0) break;
      if ((*(int *)(iVar3 + 0x10) == 2) || (*(int *)(iVar3 + 0x10) == 4)) {
        *(undefined4 *)(in_ECX[0x16] + iVar6 * 4) = *(undefined4 *)(iVar3 + 0x18);
      }
      in_ECX[0x17] = in_ECX[0x17] + 1;
      param_1 = param_1 + 1;
      iVar6 = in_ECX[0x17];
      piVar8 = piVar8 + 1;
    } while (param_1 < 4);
  }
  else if (iVar3 == 0x2f) {
    *(uint *)(in_ECX[0x16] + iVar6 * 4) = (uint)(*(int *)(*(int *)(iVar4 + 0x44) + 0x18) != 0);
    in_ECX[0x17] = in_ECX[0x17] + 1;
  }
  else {
    param_1 = 0;
    local_8 = (int *)(iVar4 + 0x44);
    do {
      iVar6 = *local_8;
      if (iVar6 == 0) break;
      if (((in_ECX[0xe] == 0) && (*(int *)(iVar6 + 0x24) == 0xe40000)) &&
         ((iVar3 = *(int *)(iVar4 + 0x30), iVar3 == 6 ||
          ((((iVar3 == 7 || (iVar3 == 0xe)) || (iVar3 == 0x4e)) ||
           ((iVar3 == 0xf || (iVar3 == 0x4f)))))))) {
        *(undefined4 *)(iVar6 + 0x24) = 0xff0000;
      }
      uVar7 = ((*(uint *)(iVar6 + 0x10) | 0xfffffff8) << 0x14 | *(uint *)(iVar6 + 0x10) & 0x18) << 8
              | *(uint *)(iVar6 + 0x14) & 0xf000000 | *(uint *)(iVar6 + 0x18) & 0x7ff |
              *(uint *)(iVar6 + 0x24) & 0xff0000;
      if (*(int *)(iVar6 + 0x28) != 0) {
        uVar7 = uVar7 | 0x2000;
      }
      *(uint *)(in_ECX[0x16] + in_ECX[0x17] * 4) = uVar7;
      in_ECX[0x17] = in_ECX[0x17] + 1;
      iVar6 = *(int *)(iVar6 + 0x28);
      if (iVar6 != 0) {
        if (in_ECX[0xe] == 0) {
          if (((*(int *)(iVar6 + 0x10) != 3) || (*(int *)(iVar6 + 0x14) != 0)) ||
             ((*(int *)(iVar6 + 0x18) != 0 || (*(int *)(iVar6 + 0x24) != 0)))) {
            FUN_10067c3e(*in_ECX,iVar4 + 0x10,0x7d7,
                         "only a0.x is allowed as a relative address register in vs_1_1");
            in_ECX[0x13] = 1;
          }
        }
        else {
          *(uint *)(in_ECX[0x16] + in_ECX[0x17] * 4) =
               ((*(uint *)(iVar6 + 0x10) | 0xfffffff8) << 0x14 | *(uint *)(iVar6 + 0x10) & 0x18) <<
               8 | *(uint *)(iVar6 + 0x14) & 0xf000000 | *(uint *)(iVar6 + 0x18) & 0x7ff |
               *(uint *)(iVar6 + 0x24) & 0xff0000;
          in_ECX[0x17] = in_ECX[0x17] + 1;
        }
      }
      param_1 = param_1 + 1;
      local_8 = local_8 + 1;
    } while (param_1 < 4);
  }
  if (in_ECX[0x17] != iVar5) {
    FUN_10067c3e(*in_ECX,iVar4 + 0x10,0,"internal error: instruction size mismatch");
    in_ECX[0x13] = 1;
  }
  if (bVar9) {
    in_ECX[0x19] = in_ECX[0x17];
  }
  else {
    iVar5 = FUN_100697fc(iVar4 + 0x10);
    if (iVar5 < 0) {
      in_ECX[0x14] = 1;
    }
  }
  return 0;
}


