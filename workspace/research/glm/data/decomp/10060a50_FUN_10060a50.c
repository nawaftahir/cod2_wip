// 10060a50 size=122 FUN_10060a50

int FUN_10060a50(char *param_1,char *param_2)

{
  char cVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  char *pcVar5;
  bool bVar6;
  
LAB_10060a60:
  do {
    pcVar5 = param_1;
    cVar1 = *pcVar5;
    param_1 = pcVar5 + 1;
    if (cVar1 == '*') {
      if (*param_1 == '\0') {
        return 0;
      }
      if (*param_2 == '\0') goto LAB_10060a60;
      iVar3 = FUN_10060a50(pcVar5,param_2 + 1);
      bVar6 = iVar3 == 0;
    }
    else {
      cVar2 = *param_2;
      param_2 = param_2 + 1;
      if ((cVar1 != cVar2) && (cVar1 != '?')) {
        iVar3 = _tolower((int)cVar2);
        iVar4 = _tolower((int)cVar1);
        if (iVar4 != iVar3) {
          return (uint)(-1 < iVar4 - iVar3) * 2 + -1;
        }
      }
      bVar6 = cVar1 == '\0';
    }
    if (bVar6) {
      return 0;
    }
  } while( true );
}


