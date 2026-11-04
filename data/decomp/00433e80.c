
void FUN_00433e80(void)

{
  int iVar1;
  uint uVar2;
  
  iVar1 = *(int *)(*(int *)(DAT_01233488 + 0x7e0) + 0xf4);
  if (iVar1 == 2) {
    uVar2 = 2;
  }
  else {
    uVar2 = (uint)(iVar1 != 0);
  }
  (&DAT_0109c528)[uVar2] = 0;
  DAT_0109fdfc = DAT_0109c528;
  DAT_0109fe00 = DAT_0109c52c;
  DAT_0109fe04 = DAT_0109c530;
  return;
}

