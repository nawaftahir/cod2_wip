// 1000c4b0 size=483 R_ConsoleTextWidth

void R_ConsoleTextWidth(int param_1,undefined4 param_2,int param_3,float param_4,float param_5,
                       float param_6,float param_7,undefined4 *param_8,undefined4 param_9)

{
  float fVar1;
  int iVar2;
  char cVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  char cStack_42a;
  char cStack_429;
  float fStack_428;
  float fStack_424;
  float fStack_420;
  float fStack_41c;
  float fStack_418;
  undefined4 uStack_414;
  undefined4 uStack_410;
  undefined4 uStack_40c;
  undefined4 uStack_408;
  undefined4 uStack_404;
  char acStack_400 [1024];
  
  iVar2 = param_3;
  uStack_410 = *param_8;
  uStack_40c = param_8[1];
  uStack_408 = param_8[2];
  uStack_404 = param_8[3];
  fStack_428 = 0.0;
joined_r0x1000c4ea:
  if (param_1 == 0) {
    return;
  }
  param_1 = FUN_1000c0f0(param_1,&param_2,&cStack_429);
  cVar3 = cStack_429;
  if (acStack_400[0] != '\0') goto code_r0x1000c52c;
  goto LAB_1000c5a8;
code_r0x1000c52c:
  R_TextHeight(acStack_400,0x7fffffff,iVar2,fStack_428 + param_4,param_5,param_6,param_7,&uStack_410
               ,param_9);
  if (cVar3 != '\0') {
    fStack_41c = (float)R_NormalizedTextScale(acStack_400,param_2,iVar2);
    fStack_428 = (float)(int)fStack_41c * param_6 + fStack_428;
LAB_1000c5a8:
    if (cVar3 != '\0') {
      param_1 = FUN_1000c250(param_1,&param_2,&fStack_420,&uStack_414);
      fVar1 = (float)*(int *)(iVar2 + 4);
      fStack_424 = fStack_424 * fVar1 * param_6;
      fStack_420 = fStack_420 * fVar1 * param_7;
      fStack_418 = param_5 - (fVar1 * param_7 * 0.8 + fStack_420) * 0.5;
      fStack_41c = fStack_428 + param_4;
      if (cStack_42a == '\0') {
        uVar5 = 0x3f800000;
        uVar4 = 0;
      }
      else {
        uVar5 = 0;
        uVar4 = 0x3f800000;
      }
      R_SetMaterialColor(fStack_41c,fStack_418,fStack_424,fStack_420,uVar4,0,uVar5,0x3f800000,
                         &uStack_410,uStack_414);
      fStack_428 = fStack_424 + fStack_428;
    }
  }
  goto joined_r0x1000c4ea;
}


