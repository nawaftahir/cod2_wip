extern unsigned int DAT_101d48c0;
extern unsigned int DAT_1073055c;
extern unsigned int DAT_1076671c;
extern unsigned int DAT_10766720;
extern int FUN_1002e850();
extern int FUN_10035560();
extern int FUN_1003a8d0();
extern int FUN_1003ea30();


void FUN_10030710(float param_1)

{
  float fVar1;
  
  fVar1 = (float)(*(void *)RI_DObjGetLodOutDist)(0x40400000);
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


