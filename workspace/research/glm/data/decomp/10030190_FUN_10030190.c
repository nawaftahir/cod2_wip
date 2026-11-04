// 10030190 size=286 FUN_10030190

void FUN_10030190(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  
  fVar3 = (float)DAT_1076671c * 0.5;
  fVar4 = (float)DAT_10766720 * 0.5;
  fVar1 = fVar3 * 0.5;
  fVar2 = fVar4 * 0.5;
  FUN_1002e850(fVar1,fVar2,fVar1,fVar2,0,0,0x3f800000,0x3f800000);
  FUN_1002e850(fVar3,fVar2,fVar1,fVar2,0,0,0x3f800000,0x3f800000);
  FUN_1002e850(fVar1,fVar4,fVar1,fVar2,0,0,0x3f800000,0x3f800000);
  FUN_1002e850(fVar3,fVar4,fVar1,fVar2,0,0,0x3f800000,0x3f800000);
  FUN_1003a8d0();
  return;
}


