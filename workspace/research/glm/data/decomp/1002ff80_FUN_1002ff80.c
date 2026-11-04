// 1002ff80 size=525 FUN_1002ff80

void FUN_1002ff80(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  
  uVar8 = DAT_1072dbbc;
  uVar7 = DAT_1072dbb8;
  uVar6 = DAT_1072dbb4;
  uVar5 = DAT_1072dbb0;
  fVar3 = (float)DAT_1076671c * 0.5;
  fVar4 = (float)DAT_10766720 * 0.5;
  DAT_1073055c = DAT_101d485c;
  fVar1 = fVar3 * 0.5;
  fVar2 = fVar4 * 0.5;
  FUN_1003ea30();
  DAT_1072dbb0 = 0x3f800000;
  DAT_1072dbb4 = 0;
  DAT_1072dbb8 = 0;
  DAT_1072dbbc = 0;
  FUN_1002e850(fVar1,fVar2,fVar1,fVar2,0x3e800000,0x3e800000,0x3f000000,0x3f000000);
  FUN_1003a8d0();
  DAT_1072dbb0 = 0;
  DAT_1072dbb4 = 0x3f800000;
  DAT_1072dbb8 = 0;
  DAT_1072dbbc = 0;
  FUN_1002e850(fVar3,fVar2,fVar1,fVar2,0x3f000000,0x3e800000,0x3f400000,0x3f000000);
  FUN_1003a8d0();
  DAT_1072dbb0 = 0;
  DAT_1072dbb4 = 0;
  DAT_1072dbb8 = 0x3f800000;
  DAT_1072dbbc = 0;
  FUN_1002e850(fVar1,fVar4,fVar1,fVar2,0x3e800000,0x3f000000,0x3f000000,0x3f400000);
  FUN_1003a8d0();
  DAT_1072dbb0 = 0;
  DAT_1072dbb4 = 0;
  DAT_1072dbb8 = 0;
  DAT_1072dbbc = 0x3f800000;
  FUN_1002e850(fVar3,fVar4,fVar1,fVar2,0x3f000000,0x3f000000,0x3f400000,0x3f400000);
  FUN_1003a8d0();
  DAT_1072dbb0 = uVar5;
  DAT_1072dbb4 = uVar6;
  DAT_1072dbb8 = uVar7;
  DAT_1072dbbc = uVar8;
  return;
}


