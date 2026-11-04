// 1000aac0 size=38 R_ResetSunLightParseParams

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_ResetSunLightParseParams(float param_1)

{
  if (!NAN(param_1) && param_1 < 0.0 != (param_1 == 0.0)) {
    _DAT_101ce5f4 = 0.0;
    return;
  }
  _DAT_101ce5f4 = param_1;
  return;
}


