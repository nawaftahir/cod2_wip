// 10001230 size=69 R_GetWorldBounds

void R_GetWorldBounds(undefined4 *param_1,undefined4 *param_2)

{
  int iVar1;
  
  iVar1 = DAT_101d1b9c;
  *param_1 = *(undefined4 *)(DAT_101d1b9c + 0x13c);
  param_1[1] = *(undefined4 *)(iVar1 + 0x140);
  param_1[2] = *(undefined4 *)(iVar1 + 0x144);
  iVar1 = DAT_101d1b9c;
  *param_2 = *(undefined4 *)(DAT_101d1b9c + 0x148);
  param_2[1] = *(undefined4 *)(iVar1 + 0x14c);
  param_2[2] = *(undefined4 *)(iVar1 + 0x150);
  return;
}


