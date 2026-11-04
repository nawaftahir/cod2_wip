// 100340f0 size=211 FUN_100340f0

void FUN_100340f0(undefined4 param_1)

{
  int in_EAX;
  int iVar1;
  undefined4 *in_ECX;
  
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    iVar1 = in_EAX * 0x24;
    *(undefined4 *)(&DAT_106d3200 + iVar1) = *in_ECX;
    *(undefined4 *)(&DAT_106d3204 + iVar1) = in_ECX[1];
    *(undefined4 *)(&DAT_106d3208 + iVar1) = in_ECX[2];
    *(undefined4 *)(&DAT_106d320c + iVar1) = 0;
    *(undefined4 *)(&DAT_106d3210 + iVar1) = 0;
    *(undefined4 *)(&DAT_106d3214 + iVar1) = 0x3f800000;
    *(undefined4 *)(&DAT_106d3218 + iVar1) = param_1;
    *(undefined4 *)(&DAT_106d321c + iVar1) = 0;
    *(undefined4 *)(&DAT_106d3220 + iVar1) = 0;
    return;
  }
  iVar1 = in_EAX * 0x40;
  *(undefined4 *)(&DAT_106d3200 + iVar1) = *in_ECX;
  *(undefined4 *)(&DAT_106d3204 + iVar1) = in_ECX[1];
  *(undefined4 *)(&DAT_106d3208 + iVar1) = in_ECX[2];
  *(undefined4 *)(&DAT_106d320c + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3210 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3214 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3218 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d321c + iVar1) = param_1;
  *(undefined4 *)(&DAT_106d3228 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d322c + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3230 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3234 + iVar1) = 0x3f800000;
  *(undefined4 *)(&DAT_106d3238 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d323c + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3220 + iVar1) = 0;
  *(undefined4 *)(&DAT_106d3224 + iVar1) = 0;
  return;
}


