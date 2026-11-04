// 100a21d8 size=3762 FUN_100a21d8

void FUN_100a21d8(undefined4 param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined1 *puVar4;
  int iVar5;
  int in_ECX;
  undefined1 *puVar6;
  longlong lVar7;
  undefined8 uVar8;
  ulonglong uVar9;
  char *pcVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined1 *local_64 [4];
  undefined4 local_54;
  undefined1 local_24 [28];
  undefined1 *local_8;
  
  puVar6 = (undefined1 *)0x0;
  local_8 = (undefined1 *)0x0;
  if (*(int *)(in_ECX + 0x44) != 0) {
    return;
  }
  while (param_2 != 0) {
    iVar5 = *(int *)(in_ECX + 8);
    param_2 = param_2 + -1;
    if (iVar5 == 0) goto LAB_100a307a;
    local_64[param_2] = *(undefined1 **)(iVar5 + 8);
    *(undefined4 *)(in_ECX + 8) = *(undefined4 *)(iVar5 + 0xc);
    *(undefined4 *)(iVar5 + 8) = 0;
    *(undefined4 *)(iVar5 + 0xc) = *(undefined4 *)(in_ECX + 0xc);
    *(int *)(in_ECX + 0xc) = iVar5;
  }
  switch(param_1) {
  case 0:
    iVar5 = FUN_1006506e(0x20);
    if (iVar5 == 0) break;
    local_64[0] = (undefined1 *)0x0;
    uVar8 = 0;
    uVar12 = 0;
LAB_100a224d:
    puVar6 = (undefined1 *)FUN_10082aec(uVar12,uVar8,local_64[0]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 1:
    iVar5 = FUN_1006506e(0x20);
    if (iVar5 != 0) {
      uVar8 = *(undefined8 *)(in_ECX + 0x54);
      uVar12 = *(undefined4 *)(in_ECX + 0x50);
      goto LAB_100a224d;
    }
    break;
  case 2:
  case 5:
  case 6:
  case 7:
  case 8:
  case 9:
  case 10:
  case 0x12:
  case 0x14:
  case 0x21:
  case 0x24:
  case 0x25:
  case 0x28:
  case 0x2a:
  case 0x2d:
  case 0x2e:
  case 0x2f:
  case 0x30:
  case 0x4e:
  case 0x51:
  case 0x56:
  case 0x59:
  case 0x5f:
  case 0x61:
  case 100:
  case 0x65:
  case 0x66:
  case 0x68:
  case 0x6b:
  case 0x6e:
  case 0x79:
  case 0x80:
  case 0x86:
  case 0x8c:
  case 0x93:
  case 0x97:
  case 0x9e:
  case 0xa7:
  case 0xa8:
  case 0xa9:
  case 0xaa:
  case 0xad:
  case 0xb5:
  case 0xb7:
  case 0xb9:
  case 0xbc:
  case 0xbd:
  case 0xbe:
  case 0xbf:
  case 0xc0:
  case 199:
  case 0xd4:
  case 0xd5:
  case 0xd6:
  case 0xdb:
  case 0xe1:
  case 0xe3:
  case 0xe7:
  case 0xea:
  case 0xef:
  case 0xf2:
  case 0xf4:
  case 0xf6:
  case 0xfd:
  case 0x102:
  case 0x104:
  case 0x105:
  case 0x106:
  case 0x108:
  case 0x109:
  case 0x10b:
  case 0x10d:
  case 0x10f:
  case 0x111:
  case 0x118:
  case 0x119:
  case 0x121:
    puVar6 = local_64[0];
    goto LAB_100a249e;
  case 3:
  case 0x52:
  case 0x62:
  case 0x6c:
  case 0x7a:
  case 0x8d:
  case 0x94:
  case 0x9f:
  case 0x107:
    goto LAB_100a228f;
  case 4:
  case 0x2c:
  case 0x4a:
  case 0x58:
  case 0x5c:
  case 0x5e:
  case 0x67:
  case 0x74:
  case 0x75:
  case 0x78:
  case 0x88:
  case 0x8f:
  case 0x96:
  case 0x9a:
  case 0xa0:
  case 0xb3:
  case 0xb6:
  case 0xb8:
  case 0xcc:
  case 0x101:
  case 0x117:
    goto switchD_100a222d_caseD_4;
  case 0xb:
  case 0x15:
  case 0x81:
    FUN_100999b4();
    puVar6 = local_64[0];
    goto LAB_100a249e;
  case 0xc:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 == 0) break;
    lVar7 = 2;
LAB_100a22bd:
    puVar6 = (undefined1 *)FUN_10082d22(lVar7,0);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xd:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x40;
      goto LAB_100a22bd;
    }
    break;
  case 0xe:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 1;
      goto LAB_100a22bd;
    }
    break;
  case 0xf:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 4;
      goto LAB_100a22bd;
    }
    break;
  case 0x10:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x100;
      goto LAB_100a22bd;
    }
    break;
  case 0x11:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 8;
      goto LAB_100a22bd;
    }
    break;
  case 0x13:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = ZEXT48(local_64[0]) << 0x20;
      goto LAB_100a22bd;
    }
    break;
  case 0x16:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x200;
      goto LAB_100a22bd;
    }
    break;
  case 0x17:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x400;
      goto LAB_100a22bd;
    }
    break;
  case 0x18:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x800;
      goto LAB_100a22bd;
    }
    break;
  case 0x19:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      uVar8 = 0;
      goto LAB_100a29e1;
    }
LAB_100a23b0:
    local_64[0] = (undefined1 *)0x0;
    goto LAB_100a23b2;
  case 0x1a:
    *(undefined1 **)(local_64[0] + 0x18) = local_64[1];
    puVar6 = local_64[0];
    goto LAB_100a23bb;
  default:
    FUN_10099580();
    goto LAB_100a249e;
  case 0x1d:
    FUN_10082d22(0,0,*(undefined4 *)(*(int *)(local_64[0] + 8) + 0x18));
    puVar6 = local_64[0];
    local_64[0] = local_24;
    goto LAB_100a23bb;
  case 0x1e:
    *(undefined4 *)(local_64[0] + 0x18) = *(undefined4 *)(*(int *)(local_64[1] + 8) + 0x18);
    FUN_1009cc93(local_64[0]);
    *(undefined4 *)(local_64[0] + 0x18) = 0;
    goto switchD_100a222d_caseD_4b;
  case 0x1f:
    puVar6 = (undefined1 *)FUN_100a083c();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x20:
    uVar12 = FUN_100a083c();
    FUN_100995d8(uVar12);
    goto LAB_100a228f;
  case 0x22:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 == 0) break;
    pcVar10 = "TypeDefs";
LAB_100a2457:
    local_64[1] = (undefined1 *)0x0;
LAB_100a2458:
    puVar6 = (undefined1 *)FUN_10082872(local_64[0],local_64[1],pcVar10);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x23:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "TypeDefs";
      goto LAB_100a2458;
    }
    break;
  case 0x26:
    FUN_1009e0fb(0,local_64[0] + 0x10,0,0,*(undefined4 *)(in_ECX + 0x10),1,&local_8,0);
    puVar6 = local_8;
    goto LAB_100a249e;
  case 0x27:
    iVar5 = FUN_1009e0fb(0,local_64[0] + 0x10,0,0,*(undefined4 *)(in_ECX + 0x10),1,&local_8,0);
    puVar6 = local_8;
    if (((iVar5 == 0) && (local_8 != (undefined1 *)0x0)) && (*(int *)(local_8 + 4) != 1)) {
      FUN_100994dd();
    }
    goto LAB_100a249e;
  case 0x29:
    FUN_1009b5b3();
    puVar6 = local_64[1];
    goto LAB_100a249e;
  case 0x2b:
    puVar6 = (undefined1 *)FUN_100a0b63();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x31:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 == 0) break;
    uVar12 = 0;
LAB_100a254a:
    uVar8 = 0x100000001;
    uVar11 = 0;
LAB_100a254b:
    puVar6 = (undefined1 *)FUN_10082e36(uVar11,uVar12,uVar8,0);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x32:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 4;
      goto LAB_100a254a;
    }
    break;
  case 0x33:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 10;
      goto LAB_100a254a;
    }
    break;
  case 0x34:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0xb;
      goto LAB_100a254a;
    }
    break;
  case 0x35:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0xc;
      goto LAB_100a254a;
    }
    break;
  case 0x36:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar8 = 0x400000001;
      uVar12 = 0xb;
      uVar11 = 1;
      goto LAB_100a254b;
    }
    break;
  case 0x37:
    puVar6 = (undefined1 *)FUN_100a0a34();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x38:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar8 = 0x400000004;
      uVar12 = 0xb;
      uVar11 = 2;
      goto LAB_100a254b;
    }
    break;
  case 0x39:
    puVar6 = (undefined1 *)FUN_100a0aba(local_64[0],local_64[1],local_64[2]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x3a:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0xe;
LAB_100a27b4:
      uVar8 = 0x100000001;
      uVar11 = 3;
      goto LAB_100a254b;
    }
    break;
  case 0x3b:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0xf;
      goto LAB_100a27b4;
    }
    break;
  case 0x3c:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x10;
      goto LAB_100a27b4;
    }
    break;
  case 0x3d:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x11;
      goto LAB_100a27b4;
    }
    break;
  case 0x3e:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x12;
      goto LAB_100a27b4;
    }
    break;
  case 0x3f:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x13;
      goto LAB_100a27b4;
    }
    break;
  case 0x40:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x14;
      goto LAB_100a27b4;
    }
    break;
  case 0x41:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x15;
      goto LAB_100a27b4;
    }
    break;
  case 0x42:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x16;
      goto LAB_100a27b4;
    }
    break;
  case 0x43:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x17;
      goto LAB_100a27b4;
    }
    break;
  case 0x44:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x18;
      goto LAB_100a27b4;
    }
    break;
  case 0x45:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x19;
      goto LAB_100a27b4;
    }
    break;
  case 0x46:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x1a;
      goto LAB_100a27b4;
    }
    break;
  case 0x47:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x1b;
      goto LAB_100a27b4;
    }
    break;
  case 0x48:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x1c;
      goto LAB_100a27b4;
    }
    break;
  case 0x49:
    iVar5 = FUN_1006506e(0x24);
    if (iVar5 != 0) {
      uVar12 = 0x1d;
      goto LAB_100a27b4;
    }
    break;
  case 0x4b:
  case 0x5d:
  case 0x76:
  case 0x89:
  case 0x90:
  case 0x9b:
    goto switchD_100a222d_caseD_4b;
  case 0x4c:
    goto LAB_100a27bf;
  case 0x4d:
LAB_100a27bf:
    puVar6 = (undefined1 *)FUN_100a09ec();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x4f:
    FUN_1009b5b3();
    goto switchD_100a222d_caseD_4b;
  case 0x50:
    goto LAB_100a27ec;
  case 0x53:
  case 99:
  case 0x8b:
  case 0x9d:
    goto switchD_100a222d_caseD_53;
  case 0x54:
  case 0x55:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "Semantics";
      goto LAB_100a2457;
    }
    break;
  case 0x57:
    puVar6 = (undefined1 *)FUN_1008282f();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x5a:
    iVar5 = FUN_1006506e(0x18);
    if (iVar5 == 0) break;
LAB_100a2844:
    puVar6 = (undefined1 *)FUN_10083650();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x5b:
    iVar5 = FUN_1006506e(0x18);
    if (iVar5 != 0) goto LAB_100a2844;
    break;
  case 0x60:
    goto LAB_100a27ec;
  case 0x69:
  case 0x7b:
    puVar6 = local_64[1];
    goto LAB_100a286f;
  case 0x6a:
    puVar6 = (undefined1 *)FUN_1008282f();
    goto LAB_100a286f;
  case 0x6d:
    puVar6 = (undefined1 *)FUN_100a12d3(local_64[0],local_64[1],local_64[2],local_64[3]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x6f:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "VariableDim";
      goto LAB_100a2457;
    }
    break;
  case 0x70:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "VariableDim";
      goto LAB_100a2458;
    }
    break;
  case 0x71:
    FUN_1009aae8();
    *(undefined4 *)(in_ECX + 0x18) = 0;
    puVar6 = local_64[0];
    goto LAB_100a249e;
  case 0x72:
    if ((local_64[0] != (undefined1 *)0x0) && (iVar5 = *(int *)(local_64[0] + 8), iVar5 != 0)) {
      iVar3 = *(int *)(iVar5 + 0x18);
      *(undefined1 **)(iVar5 + 0x1c) = local_64[1];
      *(undefined1 **)(iVar3 + 0x28) = local_64[2];
      *(undefined4 *)(iVar3 + 0x3c) = 1;
      for (iVar3 = *(int *)(in_ECX + 0x10); iVar3 != 0; iVar3 = *(int *)(iVar3 + 0x20)) {
        for (iVar2 = FUN_100997e2(); iVar2 != 0; iVar2 = *(int *)(iVar2 + 0xc)) {
          iVar1 = *(int *)(iVar2 + 8);
          if (((iVar1 != 0) && (*(int *)(iVar1 + 4) == 6)) &&
             (*(int *)(iVar1 + 0x24) == *(int *)(iVar5 + 0x24))) {
            if (*(int *)(*(int *)(*(int *)(iVar2 + 8) + 0x18) + 0x3c) != 0) {
              FUN_100994dd();
            }
            *(undefined4 *)(*(int *)(*(int *)(iVar2 + 8) + 0x18) + 0x3c) = 1;
            goto LAB_100a2990;
          }
        }
      }
    }
LAB_100a2990:
    FUN_1009aae8();
    *(undefined4 *)(in_ECX + 0x18) = 0;
    puVar6 = local_64[0];
    goto LAB_100a249e;
  case 0x73:
    puVar6 = (undefined1 *)FUN_100a0337(local_64[1],local_64[2],local_64[3]);
    FUN_100995d8(puVar6);
LAB_100a286f:
    FUN_100998ff();
    goto LAB_100a249e;
  case 0x77:
    goto LAB_100a27ec;
  case 0x7c:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 == 0) goto LAB_100a23b0;
    uVar8 = 0x10;
LAB_100a29e1:
    local_64[0] = (undefined1 *)FUN_10082d22(uVar8,local_64[0]);
LAB_100a23b2:
    FUN_100995d8(local_64[0]);
    puVar6 = local_64[0];
    goto LAB_100a23bb;
  case 0x7d:
    *(undefined1 **)(local_64[0] + 0x18) = local_64[1];
    puVar6 = local_64[0];
    if ((local_64[0][0x10] & 0x70) == 0) {
      *(uint *)(local_64[0] + 0x10) = *(uint *)(local_64[0] + 0x10) | 0x10;
    }
LAB_100a23bb:
    FUN_1009cc93(local_64[0]);
    goto LAB_100a249e;
  case 0x82:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x10;
      goto LAB_100a22bd;
    }
    break;
  case 0x83:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x20;
      goto LAB_100a22bd;
    }
    break;
  case 0x84:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x30;
      goto LAB_100a22bd;
    }
    break;
  case 0x85:
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 != 0) {
      lVar7 = 0x50;
      goto LAB_100a22bd;
    }
    break;
  case 0x87:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 == 0) {
      puVar6 = (undefined1 *)0x0;
    }
    else {
      puVar6 = (undefined1 *)FUN_10082872(0,0,"Stmts");
    }
    iVar5 = FUN_100995d8(puVar6);
    if (iVar5 != 0) {
      iVar5 = FUN_1006506e(0x30);
      if (iVar5 == 0) {
        uVar12 = 0;
      }
      else {
        uVar12 = FUN_10082c4b(3,local_64[0],local_64[2],local_64[1]);
      }
      *(undefined4 *)(puVar6 + 8) = uVar12;
      FUN_100995d8(uVar12);
    }
    *(int *)(in_ECX + 0x50) = *(int *)(in_ECX + 0x50) + 1;
    goto LAB_100a249e;
  case 0x8a:
    FUN_1009960d();
    goto switchD_100a222d_caseD_4;
  case 0x8e:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 == 0) {
      puVar6 = (undefined1 *)0x0;
    }
    else {
      puVar6 = (undefined1 *)FUN_10082872(0,0,"Passes");
    }
    iVar5 = FUN_100995d8(puVar6);
    if (iVar5 == 0) goto LAB_100a249e;
    iVar5 = FUN_1006506e(0x30);
    if (iVar5 == 0) {
LAB_100a2b90:
      puVar4 = (undefined1 *)0x0;
    }
    else {
      puVar4 = (undefined1 *)FUN_10082c4b(4,local_64[0],local_64[2],local_64[1]);
    }
    goto LAB_100a2b92;
  case 0x91:
    FUN_1009960d();
    *(undefined4 *)(in_ECX + 0x48) = 0;
switchD_100a222d_caseD_4:
    puVar6 = (undefined1 *)0x0;
    goto LAB_100a249e;
  case 0x92:
    *(undefined4 *)(in_ECX + 0x48) = 1;
switchD_100a222d_caseD_53:
    puVar6 = (undefined1 *)0x0;
LAB_100a27fc:
    FUN_1009aae8();
    goto LAB_100a249e;
  case 0x95:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 == 0) {
      puVar6 = (undefined1 *)0x0;
    }
    else {
      puVar6 = (undefined1 *)FUN_10082872(0,0,"States");
    }
    iVar5 = FUN_100995d8(puVar6);
    if (iVar5 == 0) goto LAB_100a249e;
    iVar5 = FUN_1006506e(0x1c);
    if (iVar5 == 0) goto LAB_100a2b90;
    puVar4 = (undefined1 *)FUN_10083527(local_64[0],local_64[1],local_64[3]);
LAB_100a2b92:
    *(undefined1 **)(puVar6 + 8) = puVar4;
    goto LAB_100a225c;
  case 0x98:
    *(undefined4 *)(in_ECX + 0x48) = 1;
    goto LAB_100a249e;
  case 0x99:
    *(undefined4 *)(in_ECX + 0x48) = 0;
    goto LAB_100a249e;
  case 0x9c:
    goto LAB_100a27ec;
  case 0xa1:
  case 0xb4:
    puVar6 = (undefined1 *)FUN_1009a5b0(local_64[0]);
    goto LAB_100a249e;
  case 0xa2:
    local_64[0] = (undefined1 *)0x0;
    goto LAB_100a2bbd;
  case 0xa3:
LAB_100a2bbd:
    puVar6 = (undefined1 *)FUN_100a121f(local_64[0]);
    goto LAB_100a249e;
  case 0xa4:
    puVar6 = local_64[0];
    puVar4 = local_64[0];
    local_64[0] = local_64[1];
    goto LAB_100a2c02;
  case 0xa5:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "Stmts";
      goto LAB_100a2457;
    }
    break;
  case 0xa6:
    puVar6 = (undefined1 *)FUN_1009a612();
    goto LAB_100a249e;
  case 0xab:
  case 0xae:
    puVar6 = (undefined1 *)0x0;
    puVar4 = local_64[1];
LAB_100a2c02:
    puVar6 = (undefined1 *)FUN_1009a695(puVar6,local_64[0],puVar4);
    goto LAB_100a249e;
  case 0xac:
  case 0xaf:
    puVar6 = (undefined1 *)FUN_1009a695(local_64[1],local_64[2],local_64[3],local_54);
    goto LAB_100a27fc;
  case 0xb0:
    local_64[2] = (undefined1 *)0x0;
    goto LAB_100a2c2e;
  case 0xb1:
LAB_100a2c2e:
    puVar6 = (undefined1 *)FUN_1009f6b5(local_64[0],local_64[1],local_64[2]);
    goto LAB_100a249e;
  case 0xb2:
LAB_100a27ec:
    FUN_1009960d();
    puVar6 = (undefined1 *)0x0;
    goto LAB_100a249e;
  case 0xba:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "DwordExpr";
      goto LAB_100a2457;
    }
    break;
  case 0xbb:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "DwordExpr";
      goto LAB_100a2458;
    }
    break;
  case 0xc1:
    uVar8 = 0x3ff0000000000000;
    uVar12 = 1;
    goto LAB_100a2c99;
  case 0xc2:
    uVar8 = 0;
    uVar12 = 0;
LAB_100a2c99:
    puVar6 = (undefined1 *)FUN_1009bdcd(0,uVar12,uVar8,in_ECX + 0x20);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xc3:
  case 0xc4:
    puVar6 = (undefined1 *)FUN_1009bee5(local_64[0]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xc5:
    puVar6 = (undefined1 *)FUN_1009bf69(local_64[0]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xc6:
    puVar6 = (undefined1 *)FUN_1009e7b8();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 200:
  case 0xc9:
    uVar12 = 1;
    goto LAB_100a2ce6;
  case 0xca:
    puVar6 = (undefined1 *)FUN_100a1bf8(local_64[0],local_64[1],0);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xcb:
    puVar6 = (undefined1 *)FUN_1009a1e0(local_64[0]);
    goto LAB_100a249e;
  case 0xcd:
    local_64[0] = local_64[1];
    goto LAB_100a2d22;
  case 0xce:
  case 0xcf:
LAB_100a2d22:
    puVar6 = (undefined1 *)FUN_1009c5c8(local_64[0]);
    goto LAB_100a249e;
  case 0xd0:
    uVar12 = 0;
    goto LAB_100a2d42;
  case 0xd1:
    puVar6 = (undefined1 *)FUN_1009c702(local_64[0]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xd2:
    uVar12 = 1;
LAB_100a2d42:
    puVar6 = (undefined1 *)FUN_100a2010(local_64[0],local_64[1],local_64[2],uVar12);
    goto LAB_100a249e;
  case 0xd3:
    puVar6 = (undefined1 *)FUN_1009c7dc(local_64[0]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xd7:
    puVar6 = (undefined1 *)FUN_100a0bdc();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xd8:
    puVar6 = (undefined1 *)FUN_1009c137();
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xd9:
    uVar11 = 1;
    uVar9 = ZEXT48(local_64[0]);
    uVar12 = 0x21;
    goto LAB_100a2d92;
  case 0xda:
    uVar11 = 1;
    uVar9 = ZEXT48(local_64[0]);
    uVar12 = 0x22;
    goto LAB_100a2d92;
  case 0xdc:
    uVar11 = 1;
    uVar9 = ZEXT48(local_64[0]);
    uVar12 = 2;
    goto LAB_100a2d92;
  case 0xdd:
    uVar11 = 1;
    uVar9 = ZEXT48(local_64[0]);
    uVar12 = 3;
    goto LAB_100a2d92;
  case 0xde:
    uVar11 = 1;
    uVar9 = ZEXT48(local_64[0]);
    uVar12 = 4;
    goto LAB_100a2d92;
  case 0xdf:
    uVar11 = 1;
    uVar9 = ZEXT48(local_64[0]);
    uVar12 = 5;
    goto LAB_100a2d92;
  case 0xe0:
    uVar11 = 1;
    uVar9 = ZEXT48(local_64[0]);
    uVar12 = 6;
    goto LAB_100a2d92;
  case 0xe2:
    uVar12 = 0;
LAB_100a2ce6:
    puVar6 = (undefined1 *)FUN_1009e8bf(local_64[0],local_64[1],uVar12,1);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xe4:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 7;
    goto LAB_100a2d92;
  case 0xe5:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 8;
    goto LAB_100a2d92;
  case 0xe6:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 9;
    goto LAB_100a2d92;
  case 0xe8:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 10;
    goto LAB_100a2d92;
  case 0xe9:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0xb;
    goto LAB_100a2d92;
  case 0xeb:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0xc;
    goto LAB_100a2d92;
  case 0xec:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0xd;
    goto LAB_100a2d92;
  case 0xed:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0xe;
    goto LAB_100a2d92;
  case 0xee:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0xf;
    goto LAB_100a2d92;
  case 0xf0:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x10;
    goto LAB_100a2d92;
  case 0xf1:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x11;
    goto LAB_100a2d92;
  case 0xf3:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x12;
    goto LAB_100a2d92;
  case 0xf5:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x13;
    goto LAB_100a2d92;
  case 0xf7:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x15;
    goto LAB_100a2d92;
  case 0xf8:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x1c;
    goto LAB_100a2d92;
  case 0xf9:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x1d;
    goto LAB_100a2d92;
  case 0xfa:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x1e;
    goto LAB_100a2d92;
  case 0xfb:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x1f;
    goto LAB_100a2d92;
  case 0xfc:
    uVar11 = 1;
    uVar9 = CONCAT44(local_64[1],local_64[0]);
    uVar12 = 0x20;
    goto LAB_100a2d92;
  case 0xfe:
    puVar6 = (undefined1 *)FUN_1009eae8(local_64[0],local_64[1],local_64[2]);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0xff:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "Arguments";
      goto LAB_100a2457;
    }
    break;
  case 0x100:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 == 0) {
      puVar6 = (undefined1 *)0x0;
    }
    else {
      puVar6 = (undefined1 *)FUN_10082872(local_64[1],0,"Arguments");
    }
    iVar5 = FUN_100995d8(puVar6);
    if (iVar5 == 0) goto LAB_100a249e;
LAB_100a228f:
    puVar6 = (undefined1 *)FUN_1008282f();
    goto LAB_100a249e;
  case 0x103:
    iVar5 = FUN_1006506e(0x14);
    if (iVar5 != 0) {
      pcVar10 = "Value";
      goto LAB_100a2457;
    }
    break;
  case 0x10a:
    if ((*(int *)(in_ECX + 0x10) != 0) && (*(int *)(*(int *)(in_ECX + 0x10) + 0x10) == 7)) {
      FUN_10099533();
    }
    uVar11 = 0;
    uVar9 = CONCAT44(local_64[0],local_64[1]);
    uVar12 = 1;
LAB_100a2d92:
    puVar6 = (undefined1 *)FUN_100a0e06(uVar12,uVar9,uVar11);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x10c:
    *(int *)(local_64[0] + 0x18) = -*(int *)(local_64[0] + 0x18);
    puVar6 = local_64[0];
    goto LAB_100a249e;
  case 0x10e:
    *(double *)(local_64[0] + 0x18) = -*(double *)(local_64[0] + 0x18);
    puVar6 = local_64[0];
    goto LAB_100a249e;
  case 0x110:
    puVar6 = (undefined1 *)FUN_1009a904();
    goto LAB_100a249e;
  case 0x112:
  case 0x113:
  case 0x114:
  case 0x11a:
  case 0x11b:
  case 0x11c:
  case 0x11d:
  case 0x11e:
  case 0x11f:
  case 0x120:
  case 0x123:
  case 0x124:
  case 0x125:
    iVar5 = FUN_1006506e(0x30);
    if (iVar5 == 0) break;
    puVar6 = (undefined1 *)FUN_10082a7b(in_ECX + 0x20);
    puVar4 = puVar6;
    goto LAB_100a225c;
  case 0x115:
  case 0x116:
    *(undefined4 *)(in_ECX + 0x1c) = *(undefined4 *)(local_64[0] + 0x18);
    puVar6 = local_64[0];
    goto LAB_100a249e;
  case 0x122:
    puVar6 = (undefined1 *)FUN_1009a9f3();
    goto LAB_100a249e;
  case 0x126:
    puVar6 = (undefined1 *)FUN_1009a7b0();
    goto LAB_100a249e;
  case 0x127:
    uVar12 = 0;
    goto LAB_100a302d;
  case 0x128:
    uVar12 = 1;
LAB_100a302d:
    puVar6 = (undefined1 *)FUN_1009a7cb(uVar12);
    goto LAB_100a249e;
  }
  puVar6 = (undefined1 *)0x0;
  puVar4 = puVar6;
LAB_100a225c:
  FUN_100995d8(puVar4);
LAB_100a249e:
  if (*(int *)(in_ECX + 0x44) == 0) {
    iVar5 = *(int *)(in_ECX + 0xc);
    if (iVar5 == 0) {
      iVar5 = FUN_1006506e(0x14);
      if (iVar5 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = FUN_10082872(puVar6,*(undefined4 *)(in_ECX + 8),"Stack");
      }
      if (iVar5 == 0) {
LAB_100a307a:
        FUN_10099580();
        return;
      }
    }
    else {
      *(undefined4 *)(in_ECX + 0xc) = *(undefined4 *)(iVar5 + 0xc);
      *(undefined1 **)(iVar5 + 8) = puVar6;
      *(undefined4 *)(iVar5 + 0xc) = *(undefined4 *)(in_ECX + 8);
    }
    *(int *)(in_ECX + 8) = iVar5;
  }
  return;
switchD_100a222d_caseD_4b:
  puVar6 = local_64[1];
  goto LAB_100a249e;
}


