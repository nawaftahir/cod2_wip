
uint FUN_00401d30(void)

{
  LRESULT LVar1;
  BOOL BVar2;
  uint uVar3;
  undefined2 extraout_var;
  int unaff_ESI;
  float10 fVar4;
  float10 fVar5;
  undefined4 extraout_var_00;
  undefined4 uVar6;
  float fVar7;
  
  LVar1 = SendMessageA(*(HWND *)(unaff_ESI + 0x44c),0xf0,0,0);
  uVar6 = extraout_var_00;
  if (LVar1 != 0) {
    BVar2 = IsWindowVisible(*(HWND *)(unaff_ESI + 0x1c));
    uVar3 = 0;
    if (BVar2 == 0) goto LAB_00401d7e;
  }
  uVar3 = FUN_00401d90(unaff_ESI);
  if (uVar3 != 6) {
    fVar4 = (float10)FUN_00401b80(uVar6);
    fVar7 = (float)fVar4;
    fVar5 = (float10)FUN_00401bd0();
    fVar4 = (float10)fVar7;
    uVar3 = CONCAT22(extraout_var,
                     (ushort)(fVar5 < fVar4) << 8 | (ushort)(NAN(fVar5) || NAN(fVar4)) << 10 |
                     (ushort)(fVar5 == fVar4) << 0xe);
    if (fVar5 < fVar4 == (fVar5 == fVar4)) {
      return CONCAT31((int3)(uVar3 >> 8),1);
    }
  }
LAB_00401d7e:
  return uVar3 & 0xffffff00;
}

