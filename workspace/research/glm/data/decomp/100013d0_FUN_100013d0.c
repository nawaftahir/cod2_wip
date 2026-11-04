// 100013d0 size=83 FUN_100013d0

void FUN_100013d0(void)

{
  int iVar1;
  
  FUN_100012c0();
  FUN_10004dc0();
  iVar1 = DAT_101d1b9c;
  *(undefined4 *)(DAT_101d1b9c + 0xe0) = *(undefined4 *)(DAT_101d1b9c + 200);
  *(undefined4 *)(iVar1 + 0xe4) = *(undefined4 *)(iVar1 + 0xcc);
  *(undefined4 *)(iVar1 + 0xe8) = *(undefined4 *)(iVar1 + 0xd0);
  return;
}


