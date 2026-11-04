// 100f6d79 size=267 _asctime

/* Library Function - Single Match
    _asctime
   
   Library: Visual Studio 2003 Release */

char * __cdecl _asctime(tm *_Tm)

{
  int iVar1;
  int iVar2;
  _ptiddata p_Var3;
  char *pcVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  int iVar8;
  
  p_Var3 = __getptd();
  if (p_Var3->_asctimebuf == (char *)0x0) {
    pcVar4 = _malloc(0x1a);
    p_Var3->_asctimebuf = pcVar4;
    pcVar6 = &DAT_101add60;
    if (pcVar4 == (char *)0x0) goto LAB_100f6da2;
  }
  pcVar6 = p_Var3->_asctimebuf;
LAB_100f6da2:
  iVar5 = _Tm->tm_wday;
  iVar1 = _Tm->tm_mon;
  iVar8 = 0;
  pcVar4 = pcVar6;
  do {
    pcVar7 = pcVar4;
    *pcVar7 = "SunMonTueWedThuFriSat"[iVar8 + iVar5 * 3];
    iVar2 = iVar1 * 3 + iVar8;
    iVar8 = iVar8 + 1;
    pcVar7[4] = "JanFebMarAprMayJunJulAugSepOctNovDec"[iVar2];
    pcVar4 = pcVar7 + 1;
  } while (iVar8 < 3);
  pcVar7[1] = ' ';
  pcVar7[5] = ' ';
  iVar5 = _Tm->tm_mday;
  pcVar7[6] = (char)(iVar5 / 10) + '0';
  pcVar7[7] = (char)(iVar5 % 10) + '0';
  pcVar7[8] = ' ';
  iVar5 = _Tm->tm_hour;
  pcVar7[9] = (char)(iVar5 / 10) + '0';
  pcVar7[10] = (char)(iVar5 % 10) + '0';
  pcVar7[0xb] = ':';
  iVar5 = _Tm->tm_min;
  pcVar7[0xc] = (char)(iVar5 / 10) + '0';
  pcVar7[0xd] = (char)(iVar5 % 10) + '0';
  pcVar7[0xe] = ':';
  iVar5 = _Tm->tm_sec;
  pcVar7[0xf] = (char)(iVar5 / 10) + '0';
  pcVar7[0x10] = (char)(iVar5 % 10) + '0';
  pcVar7[0x11] = ' ';
  iVar5 = _Tm->tm_year / 100 + 0x13;
  pcVar7[0x12] = (char)(iVar5 / 10) + '0';
  pcVar7[0x13] = (char)(iVar5 % 10) + '0';
  iVar5 = _Tm->tm_year % 100;
  pcVar7[0x14] = (char)(iVar5 / 10) + '0';
  pcVar7[0x15] = (char)(iVar5 % 10) + '0';
  pcVar7[0x16] = '\n';
  pcVar7[0x17] = '\0';
  return pcVar6;
}


