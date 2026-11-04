// 10030710 size=202 FUN_10030710

void FUN_10030710(float param_1)

{
  float10 fVar1;
  
  fVar1 = (float10)(*(code *)RI_DObjGetLodOutDist)(0x40400000);
  if (param_1 < (float)fVar1) {
    param_1 = (float)fVar1;
  }
  FUN_10035560(param_1);
  FUN_1003ea30();
  DAT_1073055c = DAT_101d48c0;
  FUN_1002e850(0,0,(float)DAT_1076671c,(float)DAT_10766720,0,0,0x3f800000,0x3f800000);
  FUN_1003a8d0();
  return;
}


