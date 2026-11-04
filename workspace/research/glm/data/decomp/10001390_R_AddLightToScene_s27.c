// 10001390 size=62 R_AddLightToScene_s27

void R_AddLightToScene_s27(void)

{
  int iVar1;
  
  FUN_10004dc0();
  iVar1 = DAT_101d1b9c;
  *(undefined4 *)(DAT_101d1b9c + 0xe0) = *(undefined4 *)(DAT_101d1b9c + 200);
  *(undefined4 *)(iVar1 + 0xe4) = *(undefined4 *)(iVar1 + 0xcc);
  *(undefined4 *)(iVar1 + 0xe8) = *(undefined4 *)(iVar1 + 0xd0);
  return;
}


