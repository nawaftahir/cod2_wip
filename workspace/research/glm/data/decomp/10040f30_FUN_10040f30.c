// 10040f30 size=245 FUN_10040f30

void FUN_10040f30(void)

{
  undefined4 uVar1;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (*(int *)(DAT_101ce7ec + 8) != 0) {
    uVar1 = FUN_10060c70("--- RB_TessParticleCloud( %s ) ---\n",*DAT_1072d9bc);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar1);
      _fflush(DAT_10764584);
    }
  }
  local_8 = 0;
  local_4 = 0;
  local_14 = 0;
  local_10 = 0x1000;
  local_c = 0x800;
  FUN_10040df0();
  if (DAT_1076674c != DAT_101d49ac) {
    FUN_1003ecb0();
  }
  if (((DAT_10766750 != DAT_101d49a8) || (DAT_10766754 != 0)) || (DAT_10766758 != 0x14)) {
    FUN_1003ed20(DAT_101d49a8);
  }
  FUN_1003a580(2,&local_14);
  return;
}


