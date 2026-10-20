
undefined4 FUN_0048b2f0(void)

{
  tm *ptVar1;
  int *unaff_ESI;
  time_t tVar2;
  undefined4 local_8;
  
  tVar2 = _time((time_t *)0x0);
  local_8 = (undefined4)tVar2;
  if ((unaff_ESI != (int *)0x0) && (ptVar1 = _localtime((time_t *)&local_8), ptVar1 != (tm *)0x0)) {
    *unaff_ESI = ptVar1->tm_sec;
    unaff_ESI[1] = ptVar1->tm_min;
    unaff_ESI[2] = ptVar1->tm_hour;
    unaff_ESI[3] = ptVar1->tm_mday;
    unaff_ESI[4] = ptVar1->tm_mon;
    unaff_ESI[5] = ptVar1->tm_year;
    unaff_ESI[6] = ptVar1->tm_wday;
    unaff_ESI[7] = ptVar1->tm_yday;
    unaff_ESI[8] = ptVar1->tm_isdst;
  }
  return local_8;
}

