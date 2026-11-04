// 1006b2b4 size=1277 FUN_1006b2b4

void FUN_1006b2b4(undefined4 param_1,uint param_2)

{
  double dVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int iVar5;
  undefined4 *in_ECX;
  uint uVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  char *pcVar9;
  undefined4 *local_44 [16];
  
  puVar8 = local_44[1];
  puVar3 = local_44[0];
  uVar6 = param_2;
  if (in_ECX[0x14] != 0) {
    return;
  }
  while (local_44[0] = puVar3, local_44[1] = puVar8, uVar6 != 0) {
    iVar5 = in_ECX[0xd];
    if (iVar5 == 0) {
      FUN_10067c3e(*in_ECX,in_ECX + 4,0,"internal error: stack underflow");
      in_ECX[0x13] = 1;
      return;
    }
    local_44[uVar6 - 1] = *(undefined4 **)(iVar5 + 8);
    in_ECX[0xd] = *(undefined4 *)(iVar5 + 0xc);
    *(undefined4 *)(iVar5 + 8) = 0;
    *(undefined4 *)(iVar5 + 0xc) = 0;
    puVar8 = local_44[1];
    puVar3 = local_44[0];
    uVar6 = uVar6 - 1;
  }
  uVar6 = 1;
  puVar4 = (undefined4 *)0x0;
  puVar2 = in_ECX;
  switch(param_1) {
  case 0:
  case 6:
    puVar4 = (undefined4 *)0x0;
    break;
  case 1:
  case 2:
  case 4:
  case 5:
  case 10:
  case 0x17:
  case 0x19:
  case 0x1d:
  case 0x23:
  case 0x29:
  case 0x2a:
  case 0x2f:
  case 0x30:
    puVar4 = puVar3;
    break;
  case 3:
    puVar4 = (undefined4 *)FUN_1008282f(puVar8,puVar3);
    break;
  case 7:
    puVar4 = (undefined4 *)0x0;
    if (in_ECX[0x1d] == 0) {
      in_ECX[0x1d] = puVar3[6];
    }
    break;
  case 8:
    goto LAB_1006b386;
  case 9:
    if (((int)in_ECX[0xe] < 6) || (9 < (int)in_ECX[0xe])) {
      pcVar9 = "instruction coissue is not supported in this shader version";
      uVar7 = 0x7eb;
      puVar4 = puVar3;
      puVar2 = puVar3;
      goto LAB_1006b560;
    }
    puVar3[0x15] = 1;
LAB_1006b386:
    FUN_1006990b(puVar3);
    puVar4 = puVar3;
    break;
  case 0xb:
    iVar5 = in_ECX[0xe];
    if (((1 < iVar5) && (iVar5 < 6)) || ((10 < iVar5 && (iVar5 < 0xf)))) {
      puVar8[0x10] = puVar3;
      puVar4 = puVar8;
      break;
    }
    pcVar9 = "instruction predication is not supported in this shader version";
    uVar7 = 0x7ec;
    puVar4 = puVar8;
    puVar2 = puVar8;
    goto LAB_1006b560;
  case 0xc:
  case 0xd:
  case 0xe:
  case 0xf:
  case 0x10:
  case 0x11:
  case 0x12:
  case 0x13:
  case 0x14:
    local_44[0] = (undefined4 *)0x0;
    if (1 < param_2) {
      local_44[1] = (undefined4 *)0x0;
      puVar3[0xf] = puVar8;
    }
    uVar6 = 2;
    puVar4 = puVar3;
    if (2 < param_2) {
      puVar8 = puVar3 + 0x11;
      do {
        puVar2 = local_44[uVar6];
        local_44[uVar6] = (undefined4 *)0x0;
        *puVar8 = puVar2;
        uVar6 = uVar6 + 1;
        puVar8 = puVar8 + 1;
      } while (uVar6 < param_2);
    }
    break;
  case 0x15:
  case 0x16:
    local_44[0] = (undefined4 *)0x0;
    puVar4 = puVar3;
    if (1 < param_2) {
      puVar8 = puVar3 + 0x11;
      do {
        puVar2 = local_44[uVar6];
        local_44[uVar6] = (undefined4 *)0x0;
        *puVar8 = puVar2;
        uVar6 = uVar6 + 1;
        puVar8 = puVar8 + 1;
      } while (uVar6 < param_2);
    }
    break;
  case 0x18:
    if (puVar3[7] == 0) {
      uVar7 = FUN_1006968b(puVar8 + 4);
      puVar3[8] = uVar7;
      puVar4 = puVar3;
    }
    else {
      FUN_10067c3e(*in_ECX,in_ECX + 4,0x7e6,"scalar registers cannot be masked");
      in_ECX[0x13] = 1;
      puVar3[8] = 0xf0000;
      puVar4 = puVar3;
    }
    break;
  case 0x1a:
    if (puVar3[5] == 0) {
      puVar3[5] = 0xd000000;
      puVar4 = puVar3;
      break;
    }
    pcVar9 = "not cannot be used with other modifiers";
    uVar7 = 0x7e2;
    puVar4 = puVar3;
    goto LAB_1006b560;
  case 0x1b:
    iVar5 = puVar3[5];
    if (iVar5 == 0) {
      puVar3[5] = 0x1000000;
      puVar4 = puVar3;
      break;
    }
    if (iVar5 == 0x2000000) {
      puVar3[5] = 0x3000000;
      puVar4 = puVar3;
      break;
    }
    if (iVar5 == 0x4000000) {
      puVar3[5] = 0x5000000;
      puVar4 = puVar3;
      break;
    }
    if (iVar5 == 0x7000000) {
      puVar3[5] = 0x8000000;
      puVar4 = puVar3;
      break;
    }
    if ((iVar5 != 0x9000000) && (iVar5 != 0xa000000)) {
      puVar4 = puVar3;
      if (iVar5 == 0xb000000) {
        puVar3[5] = 0xc000000;
      }
      break;
    }
    pcVar9 = "negate and divide modifiers cannot be combined";
    uVar7 = 0x7db;
    puVar4 = puVar3;
    goto LAB_1006b560;
  case 0x1c:
    if (puVar3[6] == 1) {
      if (((int)in_ECX[0xe] < 6) || (9 < (int)in_ECX[0xe])) {
        pcVar9 = "complement is not supported in this shader version";
        uVar7 = 0x7ed;
        puVar4 = puVar8;
      }
      else {
        if (puVar8[5] == 0) {
          puVar8[5] = 0x6000000;
          puVar4 = puVar8;
          break;
        }
        pcVar9 = "complement cannot be used with other modifiers";
        uVar7 = 0x7dc;
        puVar4 = puVar8;
      }
    }
    else {
      pcVar9 = "invalid complement expression";
      uVar7 = 0x7da;
      puVar4 = puVar8;
    }
    goto LAB_1006b560;
  case 0x1e:
    if (puVar3[7] == 0) {
      uVar7 = FUN_10069740(puVar8 + 4);
      puVar3[9] = uVar7;
      puVar4 = puVar3;
    }
    else {
      FUN_10067c3e(*in_ECX,in_ECX + 4,0x7e6,"scalar registers cannot be swizzled");
      in_ECX[0x13] = 1;
      puVar3[9] = 0xe40000;
      puVar4 = puVar3;
    }
    break;
  case 0x21:
    puVar8 = (undefined4 *)0x0;
    goto LAB_1006b5d6;
  case 0x22:
LAB_1006b5d6:
    puVar4 = (undefined4 *)FUN_1006ad34(puVar3 + 4,puVar8);
    goto LAB_1006b75a;
  case 0x24:
    puVar3[6] = puVar3[6] + puVar8[6];
    if (puVar3[10] == 0) {
      puVar3[10] = puVar8[10];
      puVar8[10] = 0;
      puVar4 = puVar3;
      break;
    }
    puVar4 = puVar3;
    if (puVar8[10] == 0) break;
    pcVar9 = "only one address register reference allowed in a relative address expression";
    uVar7 = 0x7d9;
LAB_1006b560:
    FUN_10067c3e(*in_ECX,puVar2 + 4,uVar7,pcVar9);
    in_ECX[0x13] = 1;
    break;
  case 0x25:
    iVar5 = FUN_1006506e(0x2c);
    puVar4 = (undefined4 *)0x0;
    if (iVar5 != 0) {
      uVar7 = 0;
      puVar8 = local_44[0];
LAB_1006b63d:
      puVar4 = (undefined4 *)FUN_10085208(0,0,uVar7,0,puVar8);
    }
    goto LAB_1006b75a;
  case 0x26:
    iVar5 = FUN_1006506e(0x2c);
    puVar4 = (undefined4 *)0x0;
    if (iVar5 != 0) {
      uVar7 = local_44[0][6];
      puVar8 = (undefined4 *)0x0;
      goto LAB_1006b63d;
    }
    goto LAB_1006b75a;
  case 0x27:
    iVar5 = FUN_1006506e(0x30);
    if (iVar5 == 0) {
      puVar4 = (undefined4 *)0x0;
    }
    else {
      puVar4 = (undefined4 *)FUN_10082a7b(in_ECX + 4);
    }
    FUN_10068d70(puVar4);
    puVar4[4] = 2;
    puVar4[6] = 1;
    break;
  case 0x28:
    iVar5 = FUN_1006506e(0x30);
    if (iVar5 == 0) {
      puVar4 = (undefined4 *)0x0;
    }
    else {
      puVar4 = (undefined4 *)FUN_10082a7b(in_ECX + 4);
    }
    FUN_10068d70(puVar4);
    puVar4[6] = 0;
    puVar4[4] = 2;
    break;
  case 0x2b:
    puVar3[6] = -puVar3[6];
    puVar4 = puVar3;
    break;
  case 0x2c:
  case 0x2d:
    dVar1 = (double)(int)puVar3[6];
    puVar3[4] = 5;
    if ((int)puVar3[6] < 0) {
      dVar1 = dVar1 + 4294967296.0;
    }
    goto LAB_1006b6f2;
  case 0x2e:
    dVar1 = (double)(int)puVar3[6];
    puVar3[4] = 5;
    if ((int)puVar3[6] < 0) {
      dVar1 = dVar1 + 4294967296.0;
    }
    goto LAB_1006b719;
  case 0x31:
    dVar1 = *(double *)(puVar3 + 6);
LAB_1006b719:
    dVar1 = -dVar1;
LAB_1006b6f2:
    *(double *)(puVar3 + 6) = dVar1;
    puVar4 = puVar3;
    break;
  case 0x32:
  case 0x33:
  case 0x34:
  case 0x35:
  case 0x36:
  case 0x37:
  case 0x38:
  case 0x39:
  case 0x3a:
  case 0x3b:
  case 0x3c:
    iVar5 = FUN_1006506e(0x60);
    if (iVar5 == 0) {
LAB_1006b758:
      puVar4 = (undefined4 *)0x0;
    }
    else {
      puVar4 = (undefined4 *)FUN_10085180(in_ECX + 4,in_ECX[0x10],in_ECX[0x11],in_ECX[0x12]);
    }
    goto LAB_1006b75a;
  case 0x3d:
  case 0x3e:
  case 0x3f:
    iVar5 = FUN_1006506e(0x30);
    if (iVar5 == 0) goto LAB_1006b758;
    puVar4 = (undefined4 *)FUN_10082a7b(in_ECX + 4);
LAB_1006b75a:
    FUN_10068d70(puVar4);
  }
  if (in_ECX[0x14] == 0) {
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 == 0) {
      iVar5 = 0;
    }
    else {
      iVar5 = FUN_10082872(puVar4,in_ECX[0xd],"Stack");
    }
    if (iVar5 == 0) {
      FUN_10067c3e(*in_ECX,in_ECX + 4,0,"internal error: out of memory");
      in_ECX[0x14] = 1;
      in_ECX[0x13] = 1;
    }
    else {
      in_ECX[0xd] = iVar5;
    }
  }
  return;
}


