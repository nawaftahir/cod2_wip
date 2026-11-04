// 10025380 size=386 FUN_10025380

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10025380(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  bool bVar4;
  undefined1 auStack_16f0 [192];
  undefined1 auStack_1630 [2600];
  undefined1 auStack_c08 [3068];
  undefined4 uStack_c;
  
  uStack_c = 0x10025390;
  uVar2 = FUN_10007d60();
  if ((DAT_101d1b9c != 0) && (*(int *)(DAT_101d1b9c + 0x100) != 0)) {
    FUN_1000a8d0(uVar2);
  }
  (*(code *)RI_DObjNumBones)();
  (*(code *)RI_RI_unk167)();
  uVar1 = DAT_10678abc;
  uVar2 = DAT_10678ab8;
  FUN_100244b0();
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    bVar4 = false;
  }
  else {
    bVar4 = *(char *)(DAT_101ce7c4 + 8) != '\0';
    if (bVar4) {
      FUN_10027d00(param_2,auStack_16f0);
      FUN_10028170(auStack_16f0,auStack_1630,0x18,&LAB_10027170);
      FUN_10027f40(param_2,auStack_16f0);
    }
  }
  uVar3 = 0;
  if ((*(int *)(DAT_101ce708 + 8) != 2) && (*(int *)(DAT_101ce6fc + 8) != 0)) {
    uVar3 = FUN_10014fc0(uVar1,uVar2,auStack_c08);
  }
  FUN_10025300(param_3,uVar1,bVar4,auStack_1630,auStack_c08,uVar3);
  if (*(uint *)(DAT_101ce6e4 + 8) != 0) {
    if ((*(uint *)(DAT_101ce6e4 + 8) & 2) != 0) {
      R_BlendSavedScreen(6,&DAT_10191488,0x3f800000,0);
    }
    FUN_10021890(uVar1,uVar2,0x1d,0);
  }
  FUN_1001e540();
  if ((bVar4 == true) && (*(char *)(DAT_101ce730 + 8) != '\0')) {
    FUN_10027c80();
  }
  return;
}


