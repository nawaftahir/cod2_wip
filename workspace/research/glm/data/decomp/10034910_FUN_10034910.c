// 10034910 size=657 FUN_10034910

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10034910(void)

{
  int iVar1;
  int *piVar2;
  float local_18;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  iVar1 = DAT_106d3194;
  if (((DAT_1072d9c0 != 3) &&
      (piVar2 = (int *)(DAT_106d3194 + 0x219cec), *(int *)(DAT_106d3194 + 0x219cec) != 0)) &&
     (*(char *)(DAT_106d3194 + 0x219d08) != '\0')) {
    DAT_1072dec8 = *(undefined4 *)(DAT_106d3194 + 0x219cf8);
    FUN_10034bb0();
    FUN_100236c0();
    _DAT_1072dbd0 = local_10;
    _DAT_1072dbdc = local_4;
    _DAT_1072dbd8 = local_8;
    _DAT_1072dbd4 = local_c;
    if (*(float *)(DAT_101ce61c + 8) == 0.0) {
      local_18 = *(float *)(iVar1 + 0x219d00);
    }
    else {
      local_18 = *(float *)(DAT_101ce61c + 8);
    }
    _DAT_1072dbc4 = 1.0 / (local_18 - *(float *)(iVar1 + 0x219cfc));
    _DAT_1072dbc0 = -_DAT_1072dbc4;
    _DAT_1072dbc4 = _DAT_1072dbc4 * local_18;
    _DAT_1072dbc8 = -*(float *)(iVar1 + 0x219d04);
    _DAT_1072dbcc = 0;
    if (*(int *)(DAT_101ce708 + 8) == 2) {
      if (*piVar2 == 1) {
        if (DAT_107667dc != 3) {
          do {
            if (*(int *)(DAT_101ce7ec + 8) != 0) {
              FUN_100378f0();
            }
            (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x8c,3);
          } while (DAT_1076a830 != 0);
          DAT_107667dc = 3;
        }
        if (_DAT_107667e0 != *(float *)(iVar1 + 0x219cfc)) {
          do {
            if (*(int *)(DAT_101ce7ec + 8) != 0) {
              FUN_100378f0();
            }
            (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x24,*(undefined4 *)(iVar1 + 0x219cfc))
            ;
          } while (DAT_1076a830 != 0);
          _DAT_107667e0 = *(float *)(iVar1 + 0x219cfc);
        }
        if (_DAT_107667e4 != local_18) {
          do {
            if (*(int *)(DAT_101ce7ec + 8) != 0) {
              FUN_100378f0();
            }
            (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x25,local_18);
          } while (DAT_1076a830 != 0);
          _DAT_107667e4 = local_18;
          return;
        }
      }
      else {
        if (DAT_107667dc != 1) {
          do {
            if (*(int *)(DAT_101ce7ec + 8) != 0) {
              FUN_100378f0();
            }
            (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x8c,1);
          } while (DAT_1076a830 != 0);
          DAT_107667dc = 1;
        }
        if (_DAT_107667e8 != *(float *)(iVar1 + 0x219d04)) {
          do {
            if (*(int *)(DAT_101ce7ec + 8) != 0) {
              FUN_100378f0();
            }
            (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x26,*(undefined4 *)(iVar1 + 0x219d04))
            ;
          } while (DAT_1076a830 != 0);
          _DAT_107667e8 = *(float *)(iVar1 + 0x219d04);
        }
      }
    }
  }
  return;
}


