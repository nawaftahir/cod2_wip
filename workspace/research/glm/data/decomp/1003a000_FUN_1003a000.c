// 1003a000 size=404 FUN_1003a000

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003a000(undefined4 param_1)

{
  undefined4 *puVar1;
  int in_EAX;
  undefined4 uVar2;
  int iVar3;
  char *pcVar4;
  int local_4;
  
  puVar1 = *(undefined4 **)(*(int *)(DAT_1072d9bc + 0x38) + 4 + in_EAX * 4);
  if (*(int *)(DAT_101ce7ec + 8) != 0) {
    uVar2 = FUN_10060c70("\n---------- RB_DrawSingleTechnique( %s ) ----------\n",*puVar1);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar2);
      _fflush(DAT_10764584);
    }
  }
  if (in_EAX == 0x21) {
    iVar3 = *(int *)(DAT_101ce6ac + 8) * 0x10;
    _DAT_1072dba0 = *(undefined4 *)(&DAT_10190640 + iVar3);
    _DAT_1072dba4 = *(undefined4 *)(&DAT_10190644 + iVar3);
    _DAT_1072dba8 = *(undefined4 *)(&DAT_10190648 + iVar3);
    _DAT_1072dbac = *(undefined4 *)(&DAT_1019064c + iVar3);
  }
  local_4 = 0;
  if (*(short *)((int)puVar1 + 6) != 0) {
    pcVar4 = (char *)((int)puVar1 + 0xd);
    do {
      if (*(int *)(DAT_101ce708 + 8) == 2) {
        FUN_10039b40(pcVar4 + -5,param_1);
      }
      else {
        FUN_100396d0(param_1);
      }
      if ((*(int *)(DAT_101ce708 + 8) == 2) && (*pcVar4 != '\0')) {
        FUN_1003e0b0(0);
        FUN_10038610();
        FUN_1003e0b0(0x3f800000);
      }
      else {
        FUN_10038610();
      }
      local_4 = local_4 + 1;
      pcVar4 = pcVar4 + 0x5c;
    } while (local_4 < (int)(uint)*(ushort *)((int)puVar1 + 6));
  }
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",&DAT_10193290);
    _fflush(DAT_10764584);
  }
  return;
}


