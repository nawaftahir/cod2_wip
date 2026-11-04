// 10040df0 size=318 FUN_10040df0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10040df0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  int iVar7;
  int unaff_EDI;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  if (*(float *)(unaff_EDI + 100) != *(float *)(unaff_EDI + 0x68)) {
    iVar7 = FUN_1003ee10();
    if (iVar7 == 0) {
      fVar1 = *(float *)(unaff_EDI + 0x48);
      fVar2 = *(float *)(unaff_EDI + 0x3c);
      fVar3 = *(float *)(unaff_EDI + 0x4c);
      fVar4 = *(float *)(unaff_EDI + 0x40);
      fVar5 = *(float *)(unaff_EDI + 0x50);
      fVar6 = *(float *)(unaff_EDI + 0x44);
      FUN_100590b0();
      local_8 = *(float *)(unaff_EDI + 0x68);
      fVar1 = (fVar1 - fVar2) * local_8;
      local_c = (fVar3 - fVar4) * local_8;
      local_8 = (fVar5 - fVar6) * local_8;
      FUN_10040ca0();
      FUN_10040d40();
      goto LAB_10040e99;
    }
  }
  local_4 = *(undefined4 *)(unaff_EDI + 0x68);
  fVar1 = *(float *)(unaff_EDI + 100);
  local_c = 0.0;
  local_8 = 0.0;
LAB_10040e99:
  _DAT_1072dd10 = fVar1;
  _DAT_1072dd18 = local_8;
  _DAT_1072dd1c = local_4;
  _DAT_1072dd14 = local_c;
  _DAT_1072dd08 = (float)*(byte *)(unaff_EDI + 0x5a) * 0.003921569;
  _DAT_1072dd0c = (float)*(byte *)(unaff_EDI + 0x5b) * 0.003921569;
  _DAT_1072dd00 = (float)*(byte *)(unaff_EDI + 0x58) * 0.003921569;
  _DAT_1072dd04 = (float)*(byte *)(unaff_EDI + 0x59) * 0.003921569;
  return;
}


