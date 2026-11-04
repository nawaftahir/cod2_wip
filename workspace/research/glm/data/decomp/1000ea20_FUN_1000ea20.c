// 1000ea20 size=459 FUN_1000ea20

void FUN_1000ea20(undefined4 param_1,undefined4 param_2)

{
  uint uVar1;
  uint uVar2;
  int *unaff_ESI;
  byte unaff_DI;
  undefined4 local_8;
  undefined4 uStack_4;
  
  uVar1 = (uint)(*(ushort *)((int)unaff_ESI + 0x1a) >> (unaff_DI & 0x1f));
  uVar2 = 1;
  if ((int)(1 - uVar1) < 0) {
    uVar2 = uVar1;
  }
  if (*unaff_ESI == 3) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","image->texture.map->LockRect( mipLevel, &lockedRect, 0, 0 )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*(int *)unaff_ESI[1] + 0x4c))((int *)unaff_ESI[1]);
    } while (DAT_1076a830 != 0);
    FUN_1000e900(uVar2,param_2,local_8,uStack_4);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","image->texture.map->UnlockRect( mipLevel )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*(int *)unaff_ESI[1] + 0x50))((int *)unaff_ESI[1]);
    } while (DAT_1076a830 != 0);
    return;
  }
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "image->texture.cubemap->LockRect( cubemapFace, mipLevel, &lockedRect, 0, 0 )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*(int *)unaff_ESI[1] + 0x4c))((int *)unaff_ESI[1]);
  } while (DAT_1076a830 != 0);
  FUN_1000e900(uVar2,param_2,local_8,uStack_4);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","image->texture.cubemap->UnlockRect( cubemapFace, mipLevel )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*(int *)unaff_ESI[1] + 0x50))((int *)unaff_ESI[1]);
  } while (DAT_1076a830 != 0);
  return;
}


