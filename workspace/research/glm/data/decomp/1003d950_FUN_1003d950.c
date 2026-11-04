// 1003d950 size=1025 FUN_1003d950

void FUN_1003d950(byte param_1)

{
  int in_EAX;
  int iVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int unaff_EDI;
  
  if (in_EAX != (&DAT_10766774)[unaff_EDI]) {
    if (in_EAX == 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->SetTexture( samplerIndex, 0 )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0x104))(DAT_101d1bf8);
      } while (DAT_1076a830 != 0);
    }
    else {
      if (*(int *)(DAT_101ce7ec + 8) != 0) {
        FUN_10060c70("---------- texture %i: %s\n");
        FUN_100378f0();
      }
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetTexture( samplerIndex, image->texture.basemap )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0x104))(DAT_101d1bf8);
      } while (DAT_1076a830 != 0);
    }
    (&DAT_10766774)[unaff_EDI] = in_EAX;
  }
  if (in_EAX != 0) {
    if ((param_1 & 0xf) == 0) {
      param_1 = param_1 | DAT_1072debe;
    }
    bVar2 = (&DAT_10766764)[unaff_EDI] ^ param_1;
    if (bVar2 != 0) {
      if ((bVar2 & 3) != 0) {
        iVar5 = *(int *)(&DAT_10190714 + (param_1 & 3) * 4);
        iVar3 = iVar5;
        if ((iVar5 == 3) && (iVar3 = 2, DAT_101d495c == 0)) {
          iVar5 = 2;
        }
        iVar1 = *(int *)(&DAT_10190714 + ((byte)(&DAT_10766764)[unaff_EDI] & 3) * 4);
        iVar4 = iVar1;
        if ((iVar1 == 3) && (iVar4 = 2, DAT_101d495c == 0)) {
          iVar1 = 2;
        }
        if (iVar5 != iVar1) {
          do {
            if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
              _fprintf(DAT_10764584,"%s",
                       "dx.device->SetSamplerState( samplerIndex, D3DSAMP_MINFILTER, minFilter )\n")
              ;
              _fflush(DAT_10764584);
            }
            (**(code **)(*DAT_101d1bf8 + 0x114))(DAT_101d1bf8);
          } while (DAT_1076a830 != 0);
        }
        if (iVar3 != iVar4) {
          do {
            if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
              _fprintf(DAT_10764584,"%s",
                       "dx.device->SetSamplerState( samplerIndex, D3DSAMP_MAGFILTER, magFilter )\n")
              ;
              _fflush(DAT_10764584);
            }
            (**(code **)(*DAT_101d1bf8 + 0x114))(DAT_101d1bf8);
          } while (DAT_1076a830 != 0);
        }
      }
      if ((bVar2 & 0xc) != 0) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetSamplerState( samplerIndex, D3DSAMP_MIPFILTER, mipFilter )\n");
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0x114))(DAT_101d1bf8);
        } while (DAT_1076a830 != 0);
      }
      if ((bVar2 & 0x70) != 0) {
        if ((bVar2 & 0x10) != 0) {
          do {
            if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
              _fprintf(DAT_10764584,"%s",
                       "dx.device->SetSamplerState( samplerIndex, D3DSAMP_ADDRESSU, address )\n");
              _fflush(DAT_10764584);
            }
            (**(code **)(*DAT_101d1bf8 + 0x114))(DAT_101d1bf8);
          } while (DAT_1076a830 != 0);
        }
        if ((bVar2 & 0x20) != 0) {
          do {
            if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
              _fprintf(DAT_10764584,"%s",
                       "dx.device->SetSamplerState( samplerIndex, D3DSAMP_ADDRESSV, address )\n");
              _fflush(DAT_10764584);
            }
            (**(code **)(*DAT_101d1bf8 + 0x114))(DAT_101d1bf8);
          } while (DAT_1076a830 != 0);
        }
        if ((bVar2 & 0x40) != 0) {
          do {
            if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
              _fprintf(DAT_10764584,"%s",
                       "dx.device->SetSamplerState( samplerIndex, D3DSAMP_ADDRESSW, address )\n");
              _fflush(DAT_10764584);
            }
            (**(code **)(*DAT_101d1bf8 + 0x114))(DAT_101d1bf8);
          } while (DAT_1076a830 != 0);
        }
      }
      (&DAT_10766764)[unaff_EDI] = param_1;
    }
  }
  return;
}


