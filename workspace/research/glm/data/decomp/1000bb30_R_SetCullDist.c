// 1000bb30 size=143 R_SetCullDist

void R_SetCullDist(int param_1,undefined4 param_2,undefined4 param_3,undefined1 param_4,
                  undefined1 param_5,undefined1 param_6,float param_7)

{
  int iVar1;
  
  iVar1 = param_1 * 0x20;
  (&DAT_101d617a)[iVar1] = param_4;
  (&DAT_101d6178)[iVar1] = param_6;
  (&DAT_101d6179)[iVar1] = param_5;
  (&DAT_101d617b)[iVar1] = 0xff;
  *(undefined4 *)(&DAT_101d6180 + iVar1) = param_3;
  *(undefined4 *)(&DAT_101d617c + iVar1) = param_2;
  (&DAT_101d618a)[iVar1] = 0;
  (&DAT_101d6188)[iVar1] = 1;
  (&DAT_101d6189)[iVar1] = 1;
  if (1.0 <= param_7) {
    (&DAT_101d616c)[param_1 * 8] = 1;
    *(undefined4 *)(&DAT_101d6184 + iVar1) = 0x3f800000;
    return;
  }
  (&DAT_101d616c)[param_1 * 8] = 2;
  *(float *)(&DAT_101d6184 + iVar1) = param_7;
  return;
}


