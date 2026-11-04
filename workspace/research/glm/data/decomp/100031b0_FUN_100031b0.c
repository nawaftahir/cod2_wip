// 100031b0 size=626 FUN_100031b0

void FUN_100031b0(undefined4 param_1)

{
  undefined4 uVar1;
  char cVar2;
  byte bVar3;
  float10 fVar4;
  undefined4 local_98;
  int local_94;
  undefined4 local_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  float fStack_80;
  float fStack_7c;
  undefined4 local_78;
  float local_74;
  undefined4 local_70;
  float local_6c;
  float local_68;
  float local_64;
  undefined1 auStack_60 [96];
  
  cVar2 = FUN_10003030();
  if (cVar2 == '\0') {
    return;
  }
  local_94 = DAT_101ae37c * 0x60 + DAT_101ae380;
  DAT_101ae37c = DAT_101ae37c + 1;
  fVar4 = (float10)FUN_10002e80("angle",0);
  if (fVar4 == (float10)0.0) {
    FUN_10002ed0("angles","0 0 0",param_1);
  }
  else {
    local_74 = (float)fVar4;
    local_78 = 0;
    local_70 = 0;
  }
  cVar2 = FUN_10002ed0("modelscale_vec","1 1 1",param_1);
  if (cVar2 == '\0') {
    fVar4 = (float10)FUN_10002e80("modelscale",0x3f800000);
    local_6c = (float)fVar4;
    local_68 = (float)fVar4;
    local_64 = (float)fVar4;
  }
  uVar1 = local_98;
  FUN_1002a9c0(&DAT_101ae288,local_98,&local_90,&local_78,local_64,local_94);
  bVar3 = (*(code *)RI_XModelGetName)(uVar1);
  cVar2 = FUN_10002f50("FF000000",param_1,&local_90);
  if (*(char *)(DAT_101ce658 + 8) == '\0') {
    if (((bVar3 & 1) == 0) || (cVar2 == '\0')) {
      FUN_1002a6d0(&local_98,auStack_60);
    }
    else {
      FUN_1002a730(&local_98);
    }
    fVar4 = (float10)FUN_10002e80("directLightScale",0x3f800000);
    fStack_80 = (float)fVar4;
    if (fVar4 < (float10)0.0) {
      FUN_100138c0(1,&DAT_10191784);
    }
    fVar4 = (float10)FUN_10002e80("indirectLightScale",0x3f800000);
    fStack_7c = (float)fVar4;
    if (fVar4 < (float10)0.0) {
      FUN_100138c0(1,&DAT_10191744);
    }
    FUN_1002a520(fStack_80,fStack_7c,auStack_60);
    goto LAB_100033fc;
  }
  uStack_88 = 0;
  uStack_84 = 0;
  if ((bVar3 & 1) == 0) {
    uStack_8c = 0;
LAB_10003319:
    local_90 = 0x3f800000;
  }
  else {
    uStack_8c = 0x3f800000;
    if (cVar2 == '\0') goto LAB_10003319;
    local_90 = 0;
  }
  FUN_1002a730(&local_98);
LAB_100033fc:
  FUN_1002a570(local_94,local_98,auStack_60);
  return;
}


