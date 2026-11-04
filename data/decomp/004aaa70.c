
void __fastcall FUN_004aaa70(undefined4 *param_1)

{
  undefined4 uVar1;
  undefined4 *in_EAX;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 *puVar5;
  short *psVar6;
  
  iVar2 = FUN_004aa670();
  if (iVar2 != 0) {
    FUN_0047ae50(1,"Could not load replacement model.");
  }
  uVar1 = param_1[0x22];
  FUN_004aa7a0();
  puVar5 = param_1;
  for (iVar2 = 0x24; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar5 = *in_EAX;
    in_EAX = in_EAX + 1;
    puVar5 = puVar5 + 1;
  }
  param_1[0x22] = uVar1;
  psVar6 = (short *)(param_1 + 3);
  iVar2 = 4;
  do {
    if ((*(int *)(psVar6 + 2) != 0) && (iVar4 = 0, 0 < *psVar6)) {
      do {
        iVar3 = FUN_004a87b0();
        *(short *)(iVar3 + 2) = *(short *)(iVar3 + 2) + 1;
        iVar4 = iVar4 + 1;
      } while (iVar4 < *psVar6);
    }
    psVar6 = psVar6 + 10;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  return;
}

