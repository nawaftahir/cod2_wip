// 10001460 size=39 R_SetSunLightOverride

void R_SetSunLightOverride(void)

{
  int iVar1;
  
  iVar1 = DAT_101d1b9c;
  *(undefined4 *)(DAT_101d1b9c + 200) = *(undefined4 *)(DAT_101d1b9c + 0xe0);
  *(undefined4 *)(iVar1 + 0xcc) = *(undefined4 *)(iVar1 + 0xe4);
  *(undefined4 *)(iVar1 + 0xd0) = *(undefined4 *)(iVar1 + 0xe8);
  return;
}


