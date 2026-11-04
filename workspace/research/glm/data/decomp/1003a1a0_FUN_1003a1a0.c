// 1003a1a0 size=388 FUN_1003a1a0

void FUN_1003a1a0(void)

{
  int iVar1;
  uint uVar2;
  undefined1 *puVar3;
  undefined1 local_340 [832];
  
  iVar1 = *(int *)(*(int *)(DAT_1072d9bc + 0x38) + 0x40);
  if ((iVar1 == 0) || (*(char *)(iVar1 + 0xe) == '\0')) {
    iVar1 = FUN_10037500();
  }
  else {
    iVar1 = FUN_10037420();
  }
  uVar2 = 0;
  if (0 < iVar1) {
    puVar3 = local_340;
    do {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->LightEnable( lightIndex, 1 )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xd4))(DAT_101d1bf8,uVar2,1);
      } while (DAT_1076a830 != 0);
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->SetLight( lightIndex, &lights[lightIndex] )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xcc))(DAT_101d1bf8,uVar2,puVar3);
      } while (DAT_1076a830 != 0);
      uVar2 = uVar2 + 1;
      puVar3 = puVar3 + 0x68;
    } while ((int)uVar2 < iVar1);
    if (7 < uVar2) {
      return;
    }
  }
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->LightEnable( lightIndex, 0 )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xd4))(DAT_101d1bf8,uVar2,0);
  } while ((DAT_1076a830 != 0) || (uVar2 = uVar2 + 1, uVar2 < 8));
  return;
}


