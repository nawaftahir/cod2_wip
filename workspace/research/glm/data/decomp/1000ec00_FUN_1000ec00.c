// 1000ec00 size=348 FUN_1000ec00

void FUN_1000ec00(int param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  uint local_10;
  undefined4 local_c;
  int iStack_8;
  int iStack_4;
  
  uVar1 = (uint)(*(ushort *)(param_1 + 0x1a) >> ((byte)param_3 & 0x1f));
  uVar3 = 1;
  if ((int)(1 - uVar1) < 0) {
    uVar3 = uVar1;
  }
  uVar1 = (uint)(*(ushort *)(param_1 + 0x1c) >> ((byte)param_3 & 0x1f));
  local_10 = 1;
  if ((int)(1 - uVar1) < 0) {
    local_10 = uVar1;
  }
  iVar2 = FUN_1000e840();
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","image->texture.volmap->LockBox( mipLevel, &lockedBox, 0, 0 )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(**(int **)(param_1 + 4) + 0x4c))(*(int **)(param_1 + 4),param_3,&local_c,0,0);
  } while (DAT_1076a830 != 0);
  DAT_1076a830 = 0;
  iVar4 = iStack_4;
  for (; local_10 != 0; local_10 = local_10 - 1) {
    FUN_1000e900(uVar3,param_4,local_c,iVar4);
    param_4 = param_4 + iVar2;
    iVar4 = iVar4 + iStack_8;
  }
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","image->texture.volmap->UnlockBox( mipLevel )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(**(int **)(param_1 + 4) + 0x50))(*(int **)(param_1 + 4),param_3);
  } while (DAT_1076a830 != 0);
  return;
}


