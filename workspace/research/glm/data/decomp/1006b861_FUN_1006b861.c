// 1006b861 size=1263 FUN_1006b861

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_1006b861(void)

{
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  
  iVar4 = 0;
  _DAT_101ac950 = 0;
  DAT_101ac94c = 0;
  DAT_101ac944 = (short *)&DAT_101ac550;
  DAT_101ac940 = (undefined4 *)&DAT_101abd80;
  _DAT_101ac550 = 0;
LAB_1006b88f:
  DAT_101ac948 = -1;
LAB_1006b897:
  iVar2 = (int)(short)(&DAT_1019e9f0)[iVar4];
  if (iVar2 == 0) {
    if ((DAT_101ac948 < 0) && (DAT_101ac948 = FUN_1006ac56(), DAT_101ac948 < 0)) {
      DAT_101ac948 = 0;
    }
    if (((((short)(&DAT_1019eb38)[iVar4] != 0) &&
         (iVar2 = (short)(&DAT_1019eb38)[iVar4] + DAT_101ac948, -1 < iVar2)) && (iVar2 < 0x128)) &&
       (*(short *)(&DAT_1019efd8 + iVar2 * 2) == DAT_101ac948)) {
      if (&DAT_101ac936 <= DAT_101ac944) goto LAB_1006bd37;
      iVar4 = (int)*(short *)(&DAT_1019ed88 + iVar2 * 2);
      DAT_101ac944 = DAT_101ac944 + 1;
      *DAT_101ac944 = *(short *)(&DAT_1019ed88 + iVar2 * 2);
      DAT_101ac940 = DAT_101ac940 + 1;
      *DAT_101ac940 = DAT_101ac938;
      DAT_101ac948 = -1;
      if (0 < DAT_101ac94c) {
        DAT_101ac94c = DAT_101ac94c + -1;
      }
      goto LAB_1006b897;
    }
    if ((((short)(&DAT_1019ec40)[iVar4] != 0) &&
        (iVar2 = (short)(&DAT_1019ec40)[iVar4] + DAT_101ac948, -1 < iVar2)) &&
       ((iVar2 < 0x128 && (*(short *)(&DAT_1019efd8 + iVar2 * 2) == DAT_101ac948)))) {
      iVar2 = (int)*(short *)(&DAT_1019ed88 + iVar2 * 2);
      goto LAB_1006b97e;
    }
    if (DAT_101ac94c == 0) {
      FUN_10068c42(DAT_101ac958,"syntax error");
      _DAT_101ac950 = _DAT_101ac950 + 1;
    }
    if (2 < DAT_101ac94c) goto LAB_1006bd2e;
    DAT_101ac94c = 3;
    while ((((short)(&DAT_1019eb38)[*DAT_101ac944] == 0 ||
            (iVar4 = (short)(&DAT_1019eb38)[*DAT_101ac944] + 0x100, iVar4 < 0)) ||
           ((0x127 < iVar4 || (*(short *)(&DAT_1019efd8 + iVar4 * 2) != 0x100))))) {
      if (DAT_101ac944 < (short *)0x101ac551) {
        DAT_101ac94c = 3;
        return 1;
      }
      DAT_101ac944 = DAT_101ac944 + -1;
      DAT_101ac940 = DAT_101ac940 + -1;
    }
    if ((short *)0x101ac935 < DAT_101ac944) goto LAB_1006bd37;
    sVar1 = *(short *)(&DAT_1019ed88 + iVar4 * 2);
    DAT_101ac944 = DAT_101ac944 + 1;
    *DAT_101ac944 = sVar1;
    uVar6 = DAT_101ac938;
  }
  else {
LAB_1006b97e:
    iVar4 = (int)*(short *)(&DAT_1019e970 + iVar2 * 2);
    DAT_101ac93c = DAT_101ac940[1 - iVar4];
    switch(iVar2) {
    case 1:
      uVar7 = 0;
      uVar6 = 0;
      break;
    case 2:
      uVar7 = 1;
      uVar6 = 1;
      break;
    case 3:
      uVar7 = 1;
      uVar6 = 2;
      break;
    case 4:
      uVar7 = 2;
      uVar6 = 3;
      break;
    case 5:
      uVar7 = 1;
      uVar6 = 4;
      break;
    case 6:
      uVar7 = 1;
      uVar6 = 5;
      break;
    case 7:
      uVar7 = 0;
      uVar6 = 6;
      break;
    case 8:
      uVar7 = 1;
      uVar6 = 7;
      break;
    case 9:
      uVar7 = 1;
      uVar6 = 8;
      break;
    case 10:
      uVar7 = 1;
      uVar6 = 9;
      break;
    case 0xb:
      uVar7 = 1;
      uVar6 = 10;
      break;
    case 0xc:
      uVar7 = 2;
      uVar6 = 0xb;
      break;
    case 0xd:
      uVar7 = 1;
      uVar6 = 0xc;
      break;
    case 0xe:
      uVar7 = 2;
      uVar6 = 0xd;
      break;
    case 0xf:
      uVar7 = 3;
      uVar6 = 0xe;
      break;
    case 0x10:
      uVar7 = 4;
      uVar6 = 0xf;
      break;
    case 0x11:
      uVar7 = 5;
      uVar6 = 0x10;
      break;
    case 0x12:
      uVar7 = 6;
      uVar6 = 0x11;
      break;
    case 0x13:
      uVar7 = 6;
      uVar6 = 0x12;
      break;
    case 0x14:
      uVar7 = 6;
      uVar6 = 0x13;
      break;
    case 0x15:
      uVar7 = 3;
      uVar6 = 0x14;
      break;
    case 0x16:
      uVar7 = 2;
      uVar6 = 0x15;
      break;
    case 0x17:
      uVar7 = 3;
      uVar6 = 0x16;
      break;
    case 0x18:
      uVar7 = 1;
      uVar6 = 0x17;
      break;
    case 0x19:
      uVar7 = 2;
      uVar6 = 0x18;
      break;
    case 0x1a:
      uVar7 = 1;
      uVar6 = 0x19;
      break;
    case 0x1b:
      uVar7 = 1;
      uVar6 = 0x1a;
      break;
    case 0x1c:
      uVar7 = 1;
      uVar6 = 0x1b;
      break;
    case 0x1d:
      uVar7 = 2;
      uVar6 = 0x1c;
      break;
    case 0x1e:
      uVar7 = 1;
      uVar6 = 0x1d;
      break;
    case 0x1f:
      uVar7 = 2;
      uVar6 = 0x1e;
      break;
    case 0x20:
      uVar7 = 1;
      uVar6 = 0x21;
      break;
    case 0x21:
      uVar7 = 2;
      uVar6 = 0x22;
      break;
    case 0x22:
      uVar7 = 1;
      uVar6 = 0x23;
      break;
    case 0x23:
      uVar7 = 2;
      uVar6 = 0x24;
      break;
    case 0x24:
      uVar7 = 1;
      uVar6 = 0x25;
      break;
    case 0x25:
      uVar7 = 1;
      uVar6 = 0x26;
      break;
    case 0x26:
      uVar7 = 0;
      uVar6 = 0x27;
      break;
    case 0x27:
      uVar7 = 0;
      uVar6 = 0x28;
      break;
    case 0x28:
      uVar7 = 1;
      uVar6 = 0x29;
      break;
    case 0x29:
      uVar7 = 1;
      uVar6 = 0x2a;
      break;
    case 0x2a:
      uVar7 = 1;
      uVar6 = 0x2b;
      break;
    case 0x2b:
      uVar7 = 1;
      uVar6 = 0x2c;
      break;
    case 0x2c:
      uVar7 = 1;
      uVar6 = 0x2d;
      break;
    case 0x2d:
      uVar7 = 1;
      uVar6 = 0x2e;
      break;
    case 0x2e:
      uVar7 = 1;
      uVar6 = 0x2f;
      break;
    case 0x2f:
      uVar7 = 1;
      uVar6 = 0x30;
      break;
    case 0x30:
      uVar7 = 1;
      uVar6 = 0x31;
      break;
    case 0x31:
      uVar7 = 0;
      uVar6 = 0x32;
      break;
    case 0x32:
      uVar7 = 0;
      uVar6 = 0x33;
      break;
    case 0x33:
      uVar7 = 0;
      uVar6 = 0x34;
      break;
    case 0x34:
      uVar7 = 0;
      uVar6 = 0x35;
      break;
    case 0x35:
      uVar7 = 0;
      uVar6 = 0x36;
      break;
    case 0x36:
      uVar7 = 0;
      uVar6 = 0x37;
      break;
    case 0x37:
      uVar7 = 0;
      uVar6 = 0x38;
      break;
    case 0x38:
      uVar7 = 0;
      uVar6 = 0x39;
      break;
    case 0x39:
      uVar7 = 0;
      uVar6 = 0x3a;
      break;
    case 0x3a:
      uVar7 = 0;
      uVar6 = 0x3b;
      break;
    case 0x3b:
      uVar7 = 0;
      uVar6 = 0x3c;
      break;
    case 0x3c:
      uVar7 = 0;
      uVar6 = 0x3d;
      break;
    case 0x3d:
      uVar7 = 0;
      uVar6 = 0x3e;
      break;
    case 0x3e:
      uVar7 = 0;
      uVar6 = 0x3f;
      break;
    default:
      goto switchD_1006b9a8_default;
    }
    FUN_1006b2b4(uVar6,uVar7);
switchD_1006b9a8_default:
    DAT_101ac944 = DAT_101ac944 + -iVar4;
    iVar3 = (int)*DAT_101ac944;
    DAT_101ac940 = DAT_101ac940 + -iVar4;
    if ((iVar3 == 0) && (*(short *)(&DAT_1019e8f0 + iVar2 * 2) == 0)) {
      DAT_101ac944 = DAT_101ac944 + 1;
      iVar4 = 0x10;
      *DAT_101ac944 = 0x10;
      DAT_101ac940 = DAT_101ac940 + 1;
      *DAT_101ac940 = DAT_101ac93c;
      bVar5 = DAT_101ac948 == 0;
      if (DAT_101ac948 < 0) {
        DAT_101ac948 = FUN_1006ac56();
        bVar5 = DAT_101ac948 == 0;
        if (DAT_101ac948 < 0) {
          DAT_101ac948 = 0;
          bVar5 = true;
        }
      }
      if (bVar5) {
        return 0;
      }
      goto LAB_1006b897;
    }
    iVar4 = *(short *)(&DAT_1019e8f0 + iVar2 * 2) * 2;
    if ((((*(short *)(&DAT_1019ed48 + iVar4) == 0) ||
         (iVar2 = *(short *)(&DAT_1019ed48 + iVar4) + iVar3, iVar2 < 0)) || (0x127 < iVar2)) ||
       (*(short *)(&DAT_1019efd8 + iVar2 * 2) != iVar3)) {
      sVar1 = *(short *)(&DAT_1019eaf8 + iVar4);
    }
    else {
      sVar1 = *(short *)(&DAT_1019ed88 + iVar2 * 2);
    }
    if ((short *)0x101ac935 < DAT_101ac944) {
LAB_1006bd37:
      FUN_10068c42(DAT_101ac958,"yacc stack overflow");
      return 1;
    }
    DAT_101ac944 = DAT_101ac944 + 1;
    *DAT_101ac944 = sVar1;
    uVar6 = DAT_101ac93c;
  }
  iVar4 = (int)sVar1;
  DAT_101ac940 = DAT_101ac940 + 1;
  *DAT_101ac940 = uVar6;
  goto LAB_1006b897;
LAB_1006bd2e:
  if (DAT_101ac948 == 0) {
    return 1;
  }
  goto LAB_1006b88f;
}


