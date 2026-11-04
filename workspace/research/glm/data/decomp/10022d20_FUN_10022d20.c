// 10022d20 size=2102 FUN_10022d20

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10022d20(void)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 unaff_EBX;
  uint uVar3;
  uint uVar4;
  undefined1 auStack_20 [32];
  
  FUN_10022940();
  (*(code *)RI_Printf)(0,"Requested frame buffer to be %s\n","24-bit color with 8-bit alpha");
  (**(code **)(*DAT_101d4824 + 0x30))(DAT_101d4824,auStack_20);
  DAT_101d1c00 = unaff_EBX;
  uVar1 = FUN_10022710();
  (*(code *)RI_Printf)(0,"DirectX returned a frame buffer that is %s\n",uVar1);
  if ((*(int *)(DAT_101ce708 + 8) != 2) && (*(char *)(DAT_101ce694 + 8) != '\0')) {
    uVar3 = DAT_101d4c6c;
    if ((int)DAT_101d4c6c < 1) {
      uVar3 = 1;
    }
    uVar4 = DAT_101d4c70;
    if ((int)DAT_101d4c70 < 1) {
      uVar4 = 1;
    }
    _DAT_101ce91c = PTR_s__floatz_101a59d4;
    DAT_101ce91a = 6;
    DAT_101ce906 = 0;
    DAT_101ce908 = 0;
    iVar2 = FUN_1000cb40();
    (&DAT_101cea68)[iVar2] = &DAT_101ce8fc;
    DAT_101d4898 = &DAT_101ce8fc;
    FUN_1000ce80(1,1,0);
    FUN_1000ca70(&DAT_101ce8fc,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
    DAT_101d489c = FUN_1000d4b0();
    _DAT_101d48a4 = uVar3 & 0xffff;
    _DAT_101d48a8 = uVar4 & 0xffff;
    _DAT_101d48a0 = FUN_10022830();
    FUN_1000c9d0(DAT_101d4898,0);
  }
  uVar3 = DAT_101d4c6c;
  if ((int)DAT_101d4c6c < 1) {
    uVar3 = 1;
  }
  uVar4 = DAT_101d4c70;
  if ((int)DAT_101d4c70 < 1) {
    uVar4 = 1;
  }
  _DAT_101ce8b0 = PTR_s__dynamic_shadows_101a59c8;
  DAT_101ce8ae = 6;
  DAT_101ce89a = 0;
  DAT_101ce89c = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce890;
  DAT_101d485c = &DAT_101ce890;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce890,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d4860 = FUN_1000d4b0();
  _DAT_101d4868 = uVar3 & 0xffff;
  _DAT_101d486c = uVar4 & 0xffff;
  _DAT_101d4864 = FUN_10022830();
  FUN_1000c9d0(DAT_101d485c,0);
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c) {
    uVar3 = DAT_101d4c6c;
  }
  uVar4 = DAT_101d4c70;
  if ((int)DAT_101d4c70 < 1) {
    uVar4 = 1;
  }
  _DAT_101ce9f4 = PTR_s__resolved_post_sun_101a59ec;
  DAT_101ce9f2 = 6;
  DAT_101ce9de = 0;
  DAT_101ce9e0 = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce9d4;
  DAT_101d4834 = &DAT_101ce9d4;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce9d4,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  DAT_101d4838 = FUN_1000d4b0();
  _DAT_101d4840 = uVar3 & 0xffff;
  _DAT_101d4844 = uVar4 & 0xffff;
  FUN_1000c9d0(DAT_101d4834,0);
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c) {
    uVar3 = DAT_101d4c6c;
  }
  uVar4 = DAT_101d4c70;
  if ((int)DAT_101d4c70 < 1) {
    uVar4 = 1;
  }
  _DAT_101cea18 = PTR_s__resolved_scene_101a59f0;
  DAT_101cea16 = 6;
  DAT_101cea02 = 0;
  DAT_101cea04 = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce9f8;
  DAT_101d4848 = &DAT_101ce9f8;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce9f8,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d484c = FUN_1000d4b0();
  _DAT_101d4854 = uVar3 & 0xffff;
  _DAT_101d4858 = uVar4 & 0xffff;
  FUN_1000c9d0(DAT_101d4848,0);
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c) {
    uVar3 = DAT_101d4c6c;
  }
  uVar4 = DAT_101d4c70;
  if ((int)DAT_101d4c70 < 1) {
    uVar4 = 1;
  }
  _DAT_101cea3c = PTR_s__savedscreen_101a59f4;
  DAT_101cea3a = 6;
  DAT_101cea26 = 0;
  DAT_101cea28 = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101cea1c;
  DAT_101d48ac = &DAT_101cea1c;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101cea1c,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d48b0 = FUN_1000d4b0();
  _DAT_101d48b8 = uVar3 & 0xffff;
  _DAT_101d48bc = uVar4 & 0xffff;
  FUN_1000c9d0(DAT_101d48ac,0);
  FUN_10022b90();
  FUN_10022c30();
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c >> 2) {
    uVar3 = (int)DAT_101d4c6c >> 2;
  }
  uVar4 = (int)DAT_101d4c70 >> 2;
  if ((int)uVar4 < 1) {
    uVar4 = 1;
  }
  _DAT_101ce940 = PTR_s__blurred_screen_101a59d8;
  DAT_101ce93e = 6;
  DAT_101ce92a = 0;
  DAT_101ce92c = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce920;
  DAT_101d48c0 = &DAT_101ce920;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce920,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d48c4 = FUN_1000d4b0();
  _DAT_101d48cc = uVar3 & 0xffff;
  _DAT_101d48d0 = uVar4 & 0xffff;
  _DAT_101d48c8 = FUN_10022830();
  FUN_1000c9d0(DAT_101d48c0,2);
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c >> 2) {
    uVar3 = (int)DAT_101d4c6c >> 2;
  }
  uVar4 = (int)DAT_101d4c70 >> 2;
  if ((int)uVar4 < 1) {
    uVar4 = 1;
  }
  _DAT_101ce964 = PTR_s__glow_0_101a59dc;
  DAT_101ce962 = 6;
  DAT_101ce94e = 0;
  DAT_101ce950 = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce944;
  DAT_101d48d4 = &DAT_101ce944;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce944,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d48d8 = FUN_1000d4b0();
  _DAT_101d48e0 = uVar3 & 0xffff;
  _DAT_101d48e4 = uVar4 & 0xffff;
  _DAT_101d48dc = FUN_10022830();
  FUN_1000c9d0(DAT_101d48d4,2);
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c >> 2) {
    uVar3 = (int)DAT_101d4c6c >> 2;
  }
  uVar4 = (int)DAT_101d4c70 >> 2;
  if ((int)uVar4 < 1) {
    uVar4 = 1;
  }
  _DAT_101ce988 = PTR_s__glow_1_101a59e0;
  DAT_101ce986 = 6;
  DAT_101ce972 = 0;
  DAT_101ce974 = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce968;
  DAT_101d48e8 = &DAT_101ce968;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce968,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d48ec = FUN_1000d4b0();
  _DAT_101d48f4 = uVar3 & 0xffff;
  _DAT_101d48f8 = uVar4 & 0xffff;
  _DAT_101d48f0 = FUN_10022830();
  FUN_1000c9d0(DAT_101d48e8,2);
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c >> 2) {
    uVar3 = (int)DAT_101d4c6c >> 2;
  }
  uVar4 = (int)DAT_101d4c70 >> 2;
  if ((int)uVar4 < 1) {
    uVar4 = 1;
  }
  _DAT_101ce9ac = PTR_s__pingpong_0_101a59e4;
  DAT_101ce9aa = 6;
  DAT_101ce996 = 0;
  DAT_101ce998 = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce98c;
  DAT_101d48fc = &DAT_101ce98c;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce98c,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d4900 = FUN_1000d4b0();
  _DAT_101d4908 = uVar3 & 0xffff;
  _DAT_101d490c = uVar4 & 0xffff;
  _DAT_101d4904 = FUN_10022830();
  FUN_1000c9d0(DAT_101d48fc,2);
  uVar3 = 1;
  if (0 < (int)DAT_101d4c6c >> 2) {
    uVar3 = (int)DAT_101d4c6c >> 2;
  }
  uVar4 = (int)DAT_101d4c70 >> 2;
  if ((int)uVar4 < 1) {
    uVar4 = 1;
  }
  _DAT_101ce9d0 = PTR_s__pingpong_1_101a59e8;
  DAT_101ce9ce = 6;
  DAT_101ce9ba = 0;
  DAT_101ce9bc = 0;
  iVar2 = FUN_1000cb40();
  (&DAT_101cea68)[iVar2] = &DAT_101ce9b0;
  DAT_101d4910 = &DAT_101ce9b0;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce9b0,3,uVar3 & 0xffff,uVar4 & 0xffff,1);
  _DAT_101d4914 = FUN_1000d4b0();
  _DAT_101d491c = uVar3 & 0xffff;
  _DAT_101d4920 = uVar4 & 0xffff;
  _DAT_101d4918 = FUN_10022830();
  FUN_1000c9d0(DAT_101d4910,2);
  return;
}


