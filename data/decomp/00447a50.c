
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __fastcall FUN_00447a50(char param_1)

{
  float fVar1;
  float fVar2;
  float *in_EAX;
  undefined2 extraout_var;
  undefined4 uVar3;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  float *unaff_ESI;
  double dVar4;
  float local_18;
  float local_14;
  float local_10;
  
  if (param_1 == '\0') {
    local_18 = *in_EAX;
    fVar1 = (float)*(double *)(in_EAX + 4);
    local_14 = in_EAX[1];
    local_10 = in_EAX[2];
  }
  else {
    local_18 = -*in_EAX;
    local_14 = -in_EAX[1];
    local_10 = -in_EAX[2];
    fVar1 = -(float)*(double *)(in_EAX + 4);
  }
  dVar4 = _fabs((double)(*unaff_ESI - local_18));
  fVar2 = (float)dVar4;
  uVar3 = CONCAT22(extraout_var,
                   (ushort)(fVar2 < _DAT_00556bb0) << 8 |
                   (ushort)(NAN(fVar2) || NAN(_DAT_00556bb0)) << 10 |
                   (ushort)(fVar2 == _DAT_00556bb0) << 0xe);
  if (fVar2 < _DAT_00556bb0) {
    dVar4 = _fabs((double)(unaff_ESI[1] - local_14));
    fVar2 = (float)dVar4;
    uVar3 = CONCAT22(extraout_var_00,
                     (ushort)(fVar2 < _DAT_00556bb0) << 8 |
                     (ushort)(NAN(fVar2) || NAN(_DAT_00556bb0)) << 10 |
                     (ushort)(fVar2 == _DAT_00556bb0) << 0xe);
    if (fVar2 < _DAT_00556bb0) {
      dVar4 = _fabs((double)(unaff_ESI[2] - local_10));
      fVar2 = (float)dVar4;
      uVar3 = CONCAT22(extraout_var_01,
                       (ushort)(fVar2 < _DAT_00556bb0) << 8 |
                       (ushort)(NAN(fVar2) || NAN(_DAT_00556bb0)) << 10 |
                       (ushort)(fVar2 == _DAT_00556bb0) << 0xe);
      if (fVar2 < _DAT_00556bb0) {
        dVar4 = _fabs((double)((float)*(double *)(unaff_ESI + 4) - fVar1));
        uVar3 = CONCAT22(extraout_var_02,
                         (ushort)(dVar4 < _DAT_00556bf0) << 8 |
                         (ushort)(NAN(dVar4) || NAN(_DAT_00556bf0)) << 10 |
                         (ushort)(dVar4 == _DAT_00556bf0) << 0xe);
        if (dVar4 < _DAT_00556bf0) {
          return CONCAT31((int3)((uint)uVar3 >> 8),1);
        }
      }
    }
  }
  return uVar3;
}

