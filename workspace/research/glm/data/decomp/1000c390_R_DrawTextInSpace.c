// 1000c390 size=186 R_DrawTextInSpace

void R_DrawTextInSpace(int param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  char cStack_411;
  float fStack_410;
  int iStack_40c;
  float fStack_408;
  undefined1 auStack_404 [4];
  undefined1 auStack_400 [1024];
  
  uVar1 = param_3;
  fStack_410 = 0.0;
  while (param_1 != 0) {
    param_1 = FUN_1000c0f0(param_1,&param_2,&cStack_411);
    iStack_40c = R_NormalizedTextScale(auStack_400,param_2,uVar1);
    fStack_410 = (float)iStack_40c + fStack_410;
    if (cStack_411 != '\0') {
      param_1 = FUN_1000c250(param_1,&param_2,auStack_404,&iStack_40c);
      fStack_410 = fStack_408 + fStack_410;
    }
  }
  FUN_1010a8a8();
  return;
}


