// 1002e740 size=270 FUN_1002e740

void FUN_1002e740(float param_1,float param_2,float param_3,float param_4,undefined4 param_5,
                 undefined4 param_6,undefined4 param_7,undefined4 param_8,undefined4 param_9,
                 undefined4 *param_10)

{
  int in_EAX;
  int iVar1;
  
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    param_4 = 1.0 / param_4;
    iVar1 = in_EAX * 0x24;
    *(float *)(&DAT_106d3200 + iVar1) = param_1 * param_4;
    *(float *)(&DAT_106d3204 + iVar1) = param_2 * param_4;
    *(float *)(&DAT_106d3208 + iVar1) = param_4 * param_3;
    *(undefined4 *)(&DAT_106d320c + iVar1) = param_5;
    *(undefined4 *)(&DAT_106d3210 + iVar1) = param_6;
    *(undefined4 *)(&DAT_106d3214 + iVar1) = param_7;
    *(undefined4 *)(&DAT_106d3218 + iVar1) = *param_10;
    *(undefined4 *)(&DAT_106d321c + iVar1) = param_8;
    *(undefined4 *)(&DAT_106d3220 + iVar1) = param_9;
    return;
  }
  iVar1 = in_EAX * 0x40;
  *(float *)(&DAT_106d3200 + iVar1) = param_1;
  *(float *)(&DAT_106d3204 + iVar1) = param_2;
  *(float *)(&DAT_106d3208 + iVar1) = param_3;
  *(float *)(&DAT_106d320c + iVar1) = param_4;
  *(undefined4 *)(&DAT_106d3210 + iVar1) = param_5;
  *(undefined4 *)(&DAT_106d3214 + iVar1) = param_6;
  *(undefined4 *)(&DAT_106d3218 + iVar1) = param_7;
  *(undefined4 *)(&DAT_106d321c + iVar1) = *param_10;
  *(undefined4 *)(&DAT_106d3220 + iVar1) = param_8;
  *(undefined4 *)(&DAT_106d3224 + iVar1) = param_9;
  *(undefined4 *)(&DAT_106d3234 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3238 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d323c + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3228 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d322c + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3230 + iVar1) = 0;
  return;
}


