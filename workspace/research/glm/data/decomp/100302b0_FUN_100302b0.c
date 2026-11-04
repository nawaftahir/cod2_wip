// 100302b0 size=271 FUN_100302b0

void FUN_100302b0(void)

{
  float fVar1;
  float fVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  
  uVar6 = DAT_1072dbbc;
  uVar5 = DAT_1072dbb8;
  uVar4 = DAT_1072dbb4;
  uVar3 = DAT_1072dbb0;
  if (DAT_101d489c != 0) {
    fVar1 = (float)DAT_1076671c;
    fVar2 = (float)DAT_10766720;
    FUN_1003ea30();
    DAT_1073055c = DAT_101d4898;
    DAT_1072dbb0 = 0x3a83126f;
    DAT_1072dbb4 = 0;
    DAT_1072dbb8 = 0;
    DAT_1072dbbc = 0;
    FUN_1002e850(fVar1 * 0.5 * 0.5,fVar2 * 0.5 * 0.5,fVar1 * 0.5,fVar2 * 0.5,0x3e800000,0x3e800000,
                 0x3f400000,0x3f400000);
    FUN_1003a8d0();
  }
  DAT_1072dbb0 = uVar3;
  DAT_1072dbb4 = uVar4;
  DAT_1072dbb8 = uVar5;
  DAT_1072dbbc = uVar6;
  return;
}


