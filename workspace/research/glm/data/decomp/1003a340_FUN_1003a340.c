// 1003a340 size=566 FUN_1003a340

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003a340(void)

{
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    if (((DAT_1072d9c0 != 0xf) && (DAT_1072d9c0 != 0x10)) && (DAT_1072d9c0 != 0x11)) {
      if (DAT_1072de44 != (int *)0x0) {
        if (*DAT_1072de44 != DAT_1072ddb4) {
          FUN_100366b0();
        }
        FUN_1003a1a0(DAT_1072de44[1]);
        return;
      }
      if (*DAT_1072de40 == 2) {
        FUN_1003a1a0(DAT_1072de40[3]);
        return;
      }
    }
  }
  else {
    if (DAT_1072de44 != (int *)0x0) {
      if (*DAT_1072de44 != DAT_1072ddb4) {
        FUN_100366b0();
      }
      _DAT_1072da5c = DAT_1072de44[1];
      _DAT_1072da50 = DAT_10730580;
      _DAT_1072da54 = DAT_10730584;
      _DAT_1072da58 = DAT_10730588;
      _DAT_1072db20 = DAT_1072de44[2];
      _DAT_1072db24 = DAT_1072de44[3];
      _DAT_1072db28 = DAT_1072de44[4];
      _DAT_1072db2c = DAT_1072de44[5];
      _DAT_1072db30 = DAT_1072de44[6];
      _DAT_1072db34 = DAT_1072de44[7];
      _DAT_1072db38 = DAT_1072de44[8];
      _DAT_1072db3c = DAT_1072de44[9];
      _DAT_1072db40 = DAT_1072de44[10];
      _DAT_1072db44 = DAT_1072de44[0xb];
      _DAT_1072db48 = DAT_1072de44[0xc];
      _DAT_1072db4c = DAT_1072de44[0xd];
      _DAT_1072db50 = DAT_1072de44[0xe];
      _DAT_1072db54 = DAT_1072de44[0xf];
      _DAT_1072db58 = DAT_1072de44[0x10];
      _DAT_1072db5c = DAT_1072de44[0x11];
      _DAT_1072db60 = DAT_1072de44[0x12];
      _DAT_1072db64 = DAT_1072de44[0x13];
      _DAT_1072db68 = DAT_1072de44[0x14];
      _DAT_1072db6c = DAT_1072de44[0x15];
      _DAT_1072db70 = DAT_1072de44[0x16];
      _DAT_1072db74 = DAT_1072de44[0x17];
      _DAT_1072db78 = DAT_1072de44[0x18];
      _DAT_1072db7c = DAT_1072de44[0x19];
      return;
    }
    _DAT_1072da50 = DAT_10730580;
    _DAT_1072da5c = DAT_1073058c;
    _DAT_1072da54 = DAT_10730584;
    _DAT_1072da58 = DAT_10730588;
    if (*DAT_1072de40 == 2) {
      _DAT_1072db90 = *(undefined4 *)(DAT_101d1b9c + 0x110);
      _DAT_1072db94 = *(undefined4 *)(DAT_101d1b9c + 0x114);
      _DAT_1072db98 = *(undefined4 *)(DAT_101d1b9c + 0x118);
      _DAT_1072db9c = 0;
      _DAT_1072db80 = DAT_1072de40[2];
      _DAT_1072db84 = DAT_1072de40[3];
      _DAT_1072db88 = DAT_1072de40[4];
      _DAT_1072db8c = 0;
    }
  }
  return;
}


