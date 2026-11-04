// 1003c430 size=2055 FUN_1003c430

void FUN_1003c430(uint param_1)

{
  char cVar1;
  char cVar2;
  uint uVar3;
  undefined4 uVar4;
  uint uVar5;
  
  uVar5 = DAT_10766688 ^ param_1;
  if ((uVar5 != 0) || (uVar3 = DAT_10766688, ((DAT_10766680 ^ param_1) & 0x7000700) != 0)) {
    if (*(int *)(DAT_101ce7ec + 8) != 0) {
      FUN_10037ce0(uVar5);
    }
    if ((uVar5 & 0x800) != 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_ALPHATESTENABLE, (stateBits0 & DXS0_ATEST_DISABLE) ? 0 : 1 )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xf,~(param_1 >> 0xb) & 1);
      } while (DAT_1076a830 != 0);
    }
    uVar3 = param_1;
    if ((param_1 & 0x800) != 0) {
      uVar3 = param_1 | DAT_10766688 & 0x3000;
      uVar5 = uVar5 & 0xffffcfff;
    }
    param_1 = uVar5;
    cVar1 = DAT_107667c8;
    if ((param_1 & 0x3000) != 0) {
      if ((uVar3 & 0x3000) == 0x1000) {
        uVar4 = 5;
        cVar2 = '\0';
      }
      else {
        cVar2 = -0x80;
        uVar4 = 2;
        if ((uVar3 & 0x3000) != 0x2000) {
          uVar4 = 7;
        }
      }
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_ALPHAFUNC, function )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x19,uVar4);
      } while (DAT_1076a830 != 0);
      cVar1 = DAT_107667c8;
      if (DAT_107667c8 != cVar2) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_ALPHAREF, ref )\n");
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x18,cVar2);
          cVar1 = cVar2;
        } while (DAT_1076a830 != 0);
      }
    }
    DAT_107667c8 = cVar1;
    if ((param_1 & 0x18000000) != 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_COLORWRITEENABLE, mask )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))
                  (DAT_101d1bf8,0xa8,-(uint)((uVar3 & 0x8000000) != 0) & 7 | uVar3 >> 0x19 & 8);
      } while (DAT_1076a830 != 0);
    }
    if ((param_1 & 0x20000000) != 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_FOGENABLE, (stateBits0 & DXS0_FOG) ? 1 : 0 )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x1c,uVar3 >> 0x1d & 1);
      } while (DAT_1076a830 != 0);
    }
    if ((param_1 & 0xc000) != 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_CULLMODE, s_cullTable[(stateBits0 & DXS0_CULL_MASK) >> DXS0_CULL_SHIFT] )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))
                  (DAT_101d1bf8,0x16,*(undefined4 *)(&DAT_10190704 + ((int)uVar3 >> 0xe & 3U) * 4));
      } while (DAT_1076a830 != 0);
    }
    if ((int)param_1 < 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_FILLMODE, (stateBits0 & DXS0_POLYMODE_LINE) ? D3DFILL_WIREFRAME : D3DFILL_SOLID )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,8,3 - (uint)((uVar3 & 0x80000000) != 0));
      } while (DAT_1076a830 != 0);
    }
    cVar1 = -((uVar3 & 0x700) != 0);
    if ((char)('\x01' - ((DAT_10766680 & 0x700) != 0)) != (char)(cVar1 + '\x01')) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_ALPHABLENDENABLE, disableBlendOpRgb ? 0 : 1 )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x1b,cVar1 == -1);
      } while (DAT_1076a830 != 0);
    }
    if (cVar1 == -1) {
      if ((param_1 & 0x700) != 0) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetRenderState( D3DRS_BLENDOP, s_blendOpTable[(stateBits0 >> DXS0_BLENDOP_RGB_SHIFT) & DXS_BLENDOP_MASK] )\n"
                    );
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))
                    (DAT_101d1bf8,0xab,*(undefined4 *)(&DAT_101906ec + ((int)uVar3 >> 8 & 7U) * 4));
        } while (DAT_1076a830 != 0);
      }
    }
    else {
      uVar3 = uVar3 ^ (DAT_10766688 ^ uVar3) & 0x7ff;
      param_1 = param_1 & 0xfffff800;
    }
    if ((char)param_1 != '\0') {
      if ((param_1 & 0xf) != 0) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetRenderState( D3DRS_SRCBLEND, s_blendTable[blend] )\n");
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))
                    (DAT_101d1bf8,0x13,*(undefined4 *)(&DAT_101906b8 + (uVar3 & 0xf) * 4));
        } while (DAT_1076a830 != 0);
      }
      if ((param_1 & 0xf0) != 0) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetRenderState( D3DRS_DESTBLEND, s_blendTable[blend] )\n");
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))
                    (DAT_101d1bf8,0x14,*(undefined4 *)(&DAT_101906b8 + ((int)uVar3 >> 4 & 0xfU) * 4)
                    );
        } while (DAT_1076a830 != 0);
      }
    }
    cVar1 = -((uVar3 & 0x7000000) != 0);
    if ((char)('\x01' - ((DAT_10766680 & 0x7000000) != 0)) != (char)(cVar1 + '\x01')) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_SEPARATEALPHABLENDENABLE, disableSeparateAlphaBlend ? 0 : 1 )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xce,cVar1 == -1);
      } while (DAT_1076a830 != 0);
    }
    if (cVar1 == -1) {
      if ((param_1 & 0x7000000) != 0) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetRenderState( D3DRS_BLENDOPALPHA, s_blendOpTable[(stateBits0 >> DXS0_BLENDOP_ALPHA_SHIFT) & DXS_BLENDOP_MASK] )\n"
                    );
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))
                    (DAT_101d1bf8,0xd1,
                     *(undefined4 *)(&DAT_101906ec + ((int)uVar3 >> 0x18 & 7U) * 4));
        } while (DAT_1076a830 != 0);
      }
    }
    else {
      uVar3 = uVar3 ^ (DAT_10766688 ^ uVar3) & 0x7ff0000;
      param_1 = param_1 & 0xf800ffff;
    }
    if ((param_1 & 0xff0000) != 0) {
      if ((param_1 & 0xf0000) != 0) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetRenderState( D3DRS_SRCBLENDALPHA, s_blendTable[blend] )\n");
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))
                    (DAT_101d1bf8,0xcf,
                     *(undefined4 *)(&DAT_101906b8 + ((int)uVar3 >> 0x10 & 0xfU) * 4));
        } while (DAT_1076a830 != 0);
      }
      if ((param_1 & 0xf00000) != 0) {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetRenderState( D3DRS_DESTBLENDALPHA, s_blendTable[blend] )\n");
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))
                    (DAT_101d1bf8,0xd0,
                     *(undefined4 *)(&DAT_101906b8 + ((int)uVar3 >> 0x14 & 0xfU) * 4));
        } while (DAT_1076a830 != 0);
      }
    }
    if ((param_1 & 0x40000000) != 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_NORMALIZENORMALS, (stateBits0 & DXS0_RENORMALIZE) ? 1 : 0 )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x8f,uVar3 >> 0x1e & 1);
      } while (DAT_1076a830 != 0);
    }
    if (((DAT_101d496e != '\0') && (*(int *)(DAT_101ce67c + 8) != 0)) && ((param_1 & 0xf00) != 0)) {
      FUN_1003c3a0();
    }
  }
  DAT_10766688 = uVar3;
  return;
}


