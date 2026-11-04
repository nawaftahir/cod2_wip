// 100413c0 size=326 FUN_100413c0

void FUN_100413c0(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 local_1c;
  int local_18;
  int local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (*(int *)(DAT_101ce7ec + 8) != 0) {
    uVar1 = FUN_10060c70("--- RB_TessXModelRigid( %s ) ---\n",*DAT_1072d9bc);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar1);
      _fflush(DAT_10764584);
    }
  }
  iVar2 = *(int *)(param_1 + 4);
  local_18 = (int)*(short *)(iVar2 + 2);
  local_14 = (int)*(short *)(iVar2 + 4);
  local_c = 0;
  local_10 = 0;
  local_1c = 0;
  if (DAT_1076674c != *(int *)(iVar2 + 0x14)) {
    FUN_1003ecb0();
  }
  if (((DAT_10766750 != *(int *)(iVar2 + 0x10)) || (DAT_10766754 != 0)) ||
     (DAT_10766758 != ((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffe4) + 0x40)) {
    FUN_1003ed20(*(int *)(iVar2 + 0x10));
  }
  puVar3 = (undefined4 *)(&DAT_1072dee0 + DAT_10730550 * 0xcd0);
  puVar4 = (undefined4 *)(&DAT_1072ebb0 + DAT_10730550 * 0xcd0);
  for (iVar2 = 0x334; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  DAT_10730550 = DAT_10730550 + 1;
  FUN_1003eea0(DAT_1072de40);
  FUN_1003a580(0,&local_1c);
  FUN_1003e4b0();
  return;
}


