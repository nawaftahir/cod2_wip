// 1003cc60 size=1420 FUN_1003cc60

void FUN_1003cc60(float param_1)

{
  float fVar1;
  float fVar2;
  byte bVar3;
  int iVar4;
  uint uVar5;
  uint uVar6;
  uint local_8;
  
  local_8 = DAT_1076668c ^ (uint)param_1;
  uVar5 = DAT_1076668c;
  if (local_8 != 0) {
    if (*(int *)(DAT_101ce7ec + 8) != 0) {
      FUN_10038110(param_1);
    }
    if ((local_8 & 1) != 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_ZWRITEENABLE, (stateBits1 & DXS1_DEPTHWRITE) ? 1 : 0 )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xe,(uint)param_1 & 1);
      } while (DAT_1076a830 != 0);
    }
    if ((local_8 & 2) != 0) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_ZENABLE, (stateBits1 & DXS1_DEPTHTEST_DISABLE) ? D3DZB_FALSE : D3DZB_TRUE )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,7,~((uint)param_1 >> 1) & 1);
      } while (DAT_1076a830 != 0);
    }
    uVar5 = (uint)param_1;
    if (((uint)param_1 & 2) != 0) {
      uVar5 = (uint)param_1 | DAT_1076668c & 0xc;
      local_8 = local_8 & 0xfffffff3;
    }
    if ((local_8 & 0xc) != 0) {
      if ((uVar5 & 0xc) == 4) {
        iVar4 = 4;
      }
      else {
        iVar4 = (((uVar5 & 0xc) != 8) - 1 & 0xfffffffb) + 8;
      }
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_ZFUNC, function )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x17,iVar4);
      } while (DAT_1076a830 != 0);
    }
    if ((local_8 & 0x30) != 0) {
      fVar2 = (float)((int)uVar5 >> 4 & 3);
      param_1 = fVar2 * *(float *)(DAT_101ce698 + 8) * 1.5258789e-05;
      if (DAT_101d496a == '\0') {
        param_1 = param_1 + param_1;
      }
      else {
        fVar1 = *(float *)(DAT_101ce674 + 8);
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetRenderState( D3DRS_SLOPESCALEDEPTHBIAS, FloatAsInt( &scale ) )\n"
                    );
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xaf,fVar2 * fVar1);
        } while (DAT_1076a830 != 0);
      }
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderState( D3DRS_DEPTHBIAS, FloatAsInt( &bias ) )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xc3,param_1);
      } while (DAT_1076a830 != 0);
    }
    if ((uVar5 & 0x40) == 0) {
      uVar6 = local_8 & 0x40;
      while (uVar6 != 0) {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_STENCILENABLE, 0 )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x34,0);
        uVar6 = DAT_1076a830;
      }
      uVar5 = uVar5 | DAT_1076668c & 0xffffff80;
      local_8 = local_8 & 0x7f;
    }
    else {
      uVar6 = local_8 & 0x40;
      while (uVar6 != 0) {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_STENCILENABLE, 1 )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x34,1);
        uVar6 = DAT_1076a830;
      }
    }
    if ((char)uVar5 < '\0') {
      if ((char)local_8 < '\0') {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_TWOSIDEDSTENCILMODE, 1 )\n"
                    );
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xb9,1);
        } while (DAT_1076a830 != 0);
      }
    }
    else {
      if ((char)local_8 < '\0') {
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_TWOSIDEDSTENCILMODE, 0 )\n"
                    );
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xb9,0);
        } while (DAT_1076a830 != 0);
      }
      uVar5 = uVar5 | DAT_1076668c & 0xfff00000;
      local_8 = local_8 & 0xfffff;
    }
    if ((local_8 & 0x1ff1ff00) != 0) {
      uVar6 = 0;
      do {
        bVar3 = (byte)*(undefined4 *)((int)&DAT_10190764 + uVar6);
        if (((int)local_8 >> (bVar3 & 0x1f) & 7U) != 0) {
          do {
            if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
              _fprintf(DAT_10764584,"%s",
                       "dx.device->SetRenderState( s_stencilOpDecode[decodeIndex].renderState, s_stencilOpTable[stateNibble] )\n"
                      );
              _fflush(DAT_10764584);
            }
            (**(code **)(*DAT_101d1bf8 + 0xe4))
                      (DAT_101d1bf8,*(undefined4 *)((int)&DAT_10190768 + uVar6),
                       *(undefined4 *)(&DAT_10190724 + ((int)uVar5 >> (bVar3 & 0x1f) & 7U) * 4));
          } while (DAT_1076a830 != 0);
        }
        uVar6 = uVar6 + 8;
      } while (uVar6 < 0x30);
    }
    if ((local_8 & 0xe00e0000) != 0) {
      uVar6 = 0;
      do {
        bVar3 = (byte)*(undefined4 *)((int)&DAT_10190794 + uVar6);
        if (((int)local_8 >> (bVar3 & 0x1f) & 7U) != 0) {
          do {
            if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
              _fprintf(DAT_10764584,"%s",
                       "dx.device->SetRenderState( s_stencilFuncDecode[decodeIndex].renderState, s_stencilFuncTable[stateNibble] )\n"
                      );
              _fflush(DAT_10764584);
            }
            (**(code **)(*DAT_101d1bf8 + 0xe4))
                      (DAT_101d1bf8,*(undefined4 *)((int)&DAT_10190798 + uVar6),
                       *(undefined4 *)(&DAT_10190744 + ((int)uVar5 >> (bVar3 & 0x1f) & 7U) * 4));
          } while (DAT_1076a830 != 0);
        }
        uVar6 = uVar6 + 8;
      } while (uVar6 < 0x10);
    }
  }
  DAT_1076668c = uVar5;
  return;
}


