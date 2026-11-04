// 1003d4c0 size=878 FUN_1003d4c0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003d4c0(int param_1,char param_2)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  undefined4 local_40 [9];
  float local_1c;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  if (param_2 == '\0') {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXCOORDINDEX, 0x00000000 | samplerIndex )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x10c))(DAT_101d1bf8,param_1,0xb,param_1);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_DISABLE )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x10c))(DAT_101d1bf8,param_1,0x18,0);
    } while (DAT_1076a830 != 0);
    (&DAT_10766715)[param_1] = 0;
    return;
  }
  if (param_2 == '\x01') {
    FUN_1005ad00();
    local_10 = 0;
    local_c = 0;
    local_8 = 0;
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXCOORDINDEX, 0x00020000 )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x10c))(DAT_101d1bf8,param_1,0xb,0x20000);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_COUNT3 )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x10c))(DAT_101d1bf8,param_1,0x18,3);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTransform( static_cast< D3DTRANSFORMSTATETYPE >( D3DTS_TEXTURE0 + samplerIndex ), &transform )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,param_1 + 0x10,local_40);
    } while (DAT_1076a830 != 0);
    (&DAT_10766715)[param_1] = 1;
    return;
  }
  if (param_2 != '\x02') {
    (&DAT_10766715)[param_1] = param_2;
    return;
  }
  puVar2 = &DAT_10191368;
  puVar3 = local_40;
  for (iVar1 = 0x10; local_1c = -_DAT_1072dedc, iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXCOORDINDEX, 0x00000000 | samplerIndex)\n"
              );
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0x10c))(DAT_101d1bf8,param_1,0xb,param_1);
  } while (DAT_1076a830 != 0);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_COUNT3 )\n"
              );
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0x10c))(DAT_101d1bf8,param_1,0x18,3);
  } while (DAT_1076a830 != 0);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->SetTransform( static_cast< D3DTRANSFORMSTATETYPE >( D3DTS_TEXTURE0 + samplerIndex ), &transform )\n"
              );
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,param_1 + 0x10,local_40);
  } while (DAT_1076a830 != 0);
  (&DAT_10766715)[param_1] = 2;
  return;
}


