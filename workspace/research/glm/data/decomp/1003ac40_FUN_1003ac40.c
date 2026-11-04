// 1003ac40 size=256 FUN_1003ac40

void FUN_1003ac40(undefined4 param_1)

{
  int iVar1;
  short sVar2;
  uint uVar3;
  
  uVar3 = DAT_1072d9d4;
  sVar2 = (short)DAT_1072d9d4;
  *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar2 + 3;
  *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar2;
  *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar2 + 2;
  *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = sVar2 + 2;
  *(short *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = sVar2;
  *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = sVar2 + 1;
  iVar1 = (uVar3 & 0xffff) * 0x24;
  *(undefined4 *)(&DAT_106d320c + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3210 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3214 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d321c + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3220 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3218 + iVar1) = param_1;
  *(undefined4 *)(&DAT_106d3230 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3234 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3238 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3240 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3244 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d323c + iVar1) = param_1;
  *(undefined4 *)(&DAT_106d3254 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3258 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d325c + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3264 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3268 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3260 + iVar1) = param_1;
  *(undefined4 *)(&DAT_106d3278 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d327c + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3280 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3288 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d328c + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3284 + iVar1) = param_1;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  return;
}


