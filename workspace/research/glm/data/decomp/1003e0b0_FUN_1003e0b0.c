// 1003e0b0 size=126 FUN_1003e0b0

void FUN_1003e0b0(undefined4 param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  undefined4 local_40 [15];
  undefined4 local_4;
  
  puVar2 = (undefined4 *)(DAT_1072ddc8 + 0x48);
  puVar3 = local_40;
  for (iVar1 = 0x10; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  local_4 = param_1;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->SetTransform( D3DTS_VIEW, &transform )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,2,local_40);
  } while (DAT_1076a830 != 0);
  return;
}


