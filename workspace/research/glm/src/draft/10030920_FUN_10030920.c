extern unsigned int DAT_101d4884;
extern unsigned int DAT_1073055c;
extern unsigned int DAT_1076671c;
extern unsigned int DAT_10766720;
extern int FUN_1002e850();
extern int FUN_1002eaa0();
extern int FUN_1003a8d0();


void FUN_10030920(unsigned int param_1,unsigned int param_2)

{
  float fVar1;
  float fVar2;
  unsigned int uVar3;
  
  uVar3 = DAT_101d4884;
  fVar1 = (float)DAT_1076671c;
  fVar2 = (float)DAT_10766720;
  FUN_1002eaa0();
  DAT_1073055c = uVar3;
  FUN_1002e850(0x3f800000,0x3f800000,fVar1 - 2.0,fVar2 - 2.0,param_1,param_1,param_2,param_2);
  FUN_1003a8d0();
  return;
}


