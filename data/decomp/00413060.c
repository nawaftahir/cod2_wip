
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00413060(void)

{
  double dVar1;
  int in_EAX;
  clock_t cVar2;
  undefined8 local_c;
  
  if (*(char *)(in_EAX + 0x7e5) != '\0') {
    if (_DAT_01129948 == _DAT_00556a68) {
      _DAT_01129948 = _DAT_00556a68;
    }
    if (_DAT_01129940 == _DAT_00556a68) {
      _DAT_01129940 = _DAT_00556a68;
    }
    cVar2 = _clock();
    dVar1 = (double)cVar2 / _DAT_00556aa8;
    local_c = dVar1 - _DAT_01129948;
    if (_DAT_00556b18 < local_c) {
      local_c = _DAT_00556b98;
    }
    _DAT_01129940 = local_c;
    if (_DAT_00556be0 < local_c) {
      local_c = _DAT_00556be0;
    }
    _DAT_01129948 = dVar1;
    if (*(int *)(in_EAX + 0x78c) != 0) {
      FUN_00403ae0((float)local_c);
    }
    if (DAT_0123348c != 0) {
      DAT_0123348c = 0;
      FUN_00417d60();
    }
  }
  return;
}

