
int FUN_00496750(char *param_1,char *param_2)

{
  char cVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  char *pcVar5;
  bool bVar6;
  
  if ((param_1 == (char *)0x0) && (DAT_0124a4fe == '\0')) {
    iVar3 = FUN_0047d980(&DAT_00553e30,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x274,0,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a4fe = '\x01';
    }
  }
  if ((param_2 == (char *)0x0) && (DAT_0124a4fd == '\0')) {
    iVar3 = FUN_0047d980(&DAT_0054919c,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x275,0,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a4fd = '\x01';
    }
  }
LAB_004967e0:
  do {
    pcVar5 = param_1;
    cVar1 = *pcVar5;
    param_1 = pcVar5 + 1;
    if (cVar1 == '*') {
      if (*param_1 == '\0') {
        return 0;
      }
      if (*param_2 == '\0') goto LAB_004967e0;
      iVar3 = FUN_00496750(pcVar5,param_2 + 1);
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

