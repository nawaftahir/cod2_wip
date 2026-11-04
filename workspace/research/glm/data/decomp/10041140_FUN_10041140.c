// 10041140 size=276 FUN_10041140

void FUN_10041140(void)

{
  int iVar1;
  int in_EAX;
  undefined4 uVar2;
  int iVar3;
  undefined4 local_14;
  int local_10;
  int local_c;
  int local_8;
  undefined4 local_4;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (*(int *)(DAT_101ce7ec + 8) != 0) {
    uVar2 = FUN_10060c70("--- RB_TessXModelSkinnedCached( %s ) ---\n",*DAT_1072d9bc);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar2);
      _fflush(DAT_10764584);
    }
  }
  iVar1 = *(int *)(in_EAX + 4);
  local_4 = 0;
  local_14 = 0;
  iVar3 = ((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffe4) + 0x40;
  local_8 = *(int *)(in_EAX + 8) / iVar3;
  local_c = (int)*(short *)(iVar1 + 4);
  local_10 = (int)*(short *)(iVar1 + 2);
  if (DAT_1076674c != *(int *)(iVar1 + 0x14)) {
    FUN_1003ecb0();
  }
  iVar1 = *(int *)(*(int *)(DAT_106d3194 + 0x217c78) + 8);
  if (((DAT_10766750 != iVar1) || (DAT_10766754 != 0)) || (DAT_10766758 != iVar3)) {
    FUN_1003ed20(iVar1);
  }
  FUN_1003a580(0,&local_14);
  return;
}


