// 10066a19 size=1128 FUN_10066a19

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_10066a19(void)

{
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  
  iVar4 = 0;
  _DAT_101abd50 = 0;
  DAT_101abd4c = 0;
  DAT_101abd44 = (short *)&DAT_101ab950;
  DAT_101abd40 = (undefined4 *)&DAT_101ab180;
  _DAT_101ab950 = 0;
LAB_10066a47:
  DAT_101abd48 = -1;
LAB_10066a4f:
  iVar2 = (int)(short)(&DAT_1019e100)[iVar4];
  if (iVar2 == 0) {
    if ((DAT_101abd48 < 0) && (DAT_101abd48 = FUN_10065c86(), DAT_101abd48 < 0)) {
      DAT_101abd48 = 0;
    }
    if (((((short)(&DAT_1019e1c0)[iVar4] != 0) &&
         (iVar2 = (short)(&DAT_1019e1c0)[iVar4] + DAT_101abd48, -1 < iVar2)) && (iVar2 < 0x172)) &&
       (*(short *)(&DAT_1019e608 + iVar2 * 2) == DAT_101abd48)) {
      if (&DAT_101abd36 <= DAT_101abd44) goto LAB_10066e68;
      iVar4 = (int)*(short *)(&DAT_1019e320 + iVar2 * 2);
      DAT_101abd44 = DAT_101abd44 + 1;
      *DAT_101abd44 = *(short *)(&DAT_1019e320 + iVar2 * 2);
      DAT_101abd40 = DAT_101abd40 + 1;
      *DAT_101abd40 = DAT_101abd38;
      DAT_101abd48 = -1;
      if (0 < DAT_101abd4c) {
        DAT_101abd4c = DAT_101abd4c + -1;
      }
      goto LAB_10066a4f;
    }
    if ((((short)(&DAT_1019e260)[iVar4] != 0) &&
        (iVar2 = (short)(&DAT_1019e260)[iVar4] + DAT_101abd48, -1 < iVar2)) &&
       ((iVar2 < 0x172 && (*(short *)(&DAT_1019e608 + iVar2 * 2) == DAT_101abd48)))) {
      iVar2 = (int)*(short *)(&DAT_1019e320 + iVar2 * 2);
      goto LAB_10066b36;
    }
    if (DAT_101abd4c == 0) {
      FUN_10063ee5(DAT_101abd78,"syntax error");
      _DAT_101abd50 = _DAT_101abd50 + 1;
    }
    if (2 < DAT_101abd4c) goto LAB_10066e5f;
    DAT_101abd4c = 3;
    while ((((short)(&DAT_1019e1c0)[*DAT_101abd44] == 0 ||
            (iVar4 = (short)(&DAT_1019e1c0)[*DAT_101abd44] + 0x100, iVar4 < 0)) ||
           ((0x171 < iVar4 || (*(short *)(&DAT_1019e608 + iVar4 * 2) != 0x100))))) {
      if (DAT_101abd44 < (short *)0x101ab951) {
        DAT_101abd4c = 3;
        return 1;
      }
      DAT_101abd44 = DAT_101abd44 + -1;
      DAT_101abd40 = DAT_101abd40 + -1;
    }
    if ((short *)0x101abd35 < DAT_101abd44) goto LAB_10066e68;
    sVar1 = *(short *)(&DAT_1019e320 + iVar4 * 2);
    DAT_101abd44 = DAT_101abd44 + 1;
    *DAT_101abd44 = sVar1;
    uVar6 = DAT_101abd38;
  }
  else {
LAB_10066b36:
    iVar4 = (int)*(short *)(&DAT_1019e0a0 + iVar2 * 2);
    DAT_101abd3c = DAT_101abd40[1 - iVar4];
    switch(iVar2) {
    case 1:
      uVar7 = 1;
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
      uVar7 = 0;
      uVar6 = 4;
      break;
    case 6:
      uVar7 = 0;
      uVar6 = 5;
      break;
    case 7:
      uVar7 = 1;
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
      uVar7 = 0;
      uVar6 = 10;
      break;
    case 0xc:
      uVar7 = 0;
      uVar6 = 0xb;
      break;
    case 0xd:
      uVar7 = 0;
      uVar6 = 0xc;
      break;
    case 0xe:
      uVar7 = 0;
      uVar6 = 0xd;
      break;
    case 0xf:
      uVar7 = 0;
      uVar6 = 0xe;
      break;
    case 0x10:
      uVar7 = 1;
      uVar6 = 0xf;
      break;
    case 0x11:
      uVar7 = 1;
      uVar6 = 0x10;
      break;
    case 0x12:
      uVar7 = 1;
      uVar6 = 0x11;
      break;
    case 0x13:
      uVar7 = 1;
      uVar6 = 0x12;
      break;
    case 0x14:
      uVar7 = 1;
      uVar6 = 0x13;
      break;
    case 0x15:
      uVar7 = 1;
      uVar6 = 0x14;
      break;
    case 0x16:
      uVar7 = 1;
      uVar6 = 0x15;
      break;
    case 0x17:
      uVar7 = 1;
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
      uVar7 = 2;
      uVar6 = 0x19;
      break;
    case 0x1b:
      uVar7 = 1;
      uVar6 = 0x1a;
      break;
    case 0x1c:
      uVar7 = 2;
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
      uVar7 = 2;
      uVar6 = 0x1f;
      break;
    case 0x21:
      uVar7 = 2;
      uVar6 = 0x20;
      break;
    case 0x22:
      uVar7 = 2;
      uVar6 = 0x21;
      break;
    case 0x23:
      uVar7 = 1;
      uVar6 = 0x22;
      break;
    case 0x24:
      uVar7 = 2;
      uVar6 = 0x23;
      break;
    case 0x25:
      uVar7 = 2;
      uVar6 = 0x24;
      break;
    case 0x26:
      uVar7 = 1;
      uVar6 = 0x25;
      break;
    case 0x27:
      uVar7 = 2;
      uVar6 = 0x26;
      break;
    case 0x28:
      uVar7 = 1;
      uVar6 = 0x27;
      break;
    case 0x29:
      uVar7 = 2;
      uVar6 = 0x28;
      break;
    case 0x2a:
      uVar7 = 1;
      uVar6 = 0x29;
      break;
    case 0x2b:
      uVar7 = 3;
      uVar6 = 0x2a;
      break;
    case 0x2c:
      uVar7 = 1;
      uVar6 = 0x2b;
      break;
    case 0x2d:
      uVar7 = 0;
      uVar6 = 0x2c;
      break;
    case 0x2e:
      uVar7 = 0;
      uVar6 = 0x2d;
      break;
    case 0x2f:
      uVar7 = 0;
      uVar6 = 0x2e;
      break;
    default:
      goto switchD_10066b60_default;
    }
    FUN_100665f9(uVar6,uVar7);
switchD_10066b60_default:
    DAT_101abd44 = DAT_101abd44 + -iVar4;
    iVar3 = (int)*DAT_101abd44;
    DAT_101abd40 = DAT_101abd40 + -iVar4;
    if ((iVar3 == 0) && (*(short *)(&DAT_1019e040 + iVar2 * 2) == 0)) {
      DAT_101abd44 = DAT_101abd44 + 1;
      iVar4 = 0xf;
      *DAT_101abd44 = 0xf;
      DAT_101abd40 = DAT_101abd40 + 1;
      *DAT_101abd40 = DAT_101abd3c;
      bVar5 = DAT_101abd48 == 0;
      if (DAT_101abd48 < 0) {
        DAT_101abd48 = FUN_10065c86();
        bVar5 = DAT_101abd48 == 0;
        if (DAT_101abd48 < 0) {
          DAT_101abd48 = 0;
          bVar5 = true;
        }
      }
      if (bVar5) {
        return 0;
      }
      goto LAB_10066a4f;
    }
    iVar4 = *(short *)(&DAT_1019e040 + iVar2 * 2) * 2;
    if ((((*(short *)(&DAT_1019e300 + iVar4) == 0) ||
         (iVar2 = *(short *)(&DAT_1019e300 + iVar4) + iVar3, iVar2 < 0)) || (0x171 < iVar2)) ||
       (*(short *)(&DAT_1019e608 + iVar2 * 2) != iVar3)) {
      sVar1 = *(short *)(&DAT_1019e1a0 + iVar4);
    }
    else {
      sVar1 = *(short *)(&DAT_1019e320 + iVar2 * 2);
    }
    if ((short *)0x101abd35 < DAT_101abd44) {
LAB_10066e68:
      FUN_10063ee5(DAT_101abd78,"yacc stack overflow");
      return 1;
    }
    DAT_101abd44 = DAT_101abd44 + 1;
    *DAT_101abd44 = sVar1;
    uVar6 = DAT_101abd3c;
  }
  iVar4 = (int)sVar1;
  DAT_101abd40 = DAT_101abd40 + 1;
  *DAT_101abd40 = uVar6;
  goto LAB_10066a4f;
LAB_10066e5f:
  if (DAT_101abd48 == 0) {
    return 1;
  }
  goto LAB_10066a47;
}


