
int FUN_00496680(int param_1,char *param_2)

{
  char cVar1;
  char cVar2;
  int iVar3;
  
  if ((param_1 == 0) && (DAT_0124a500 == '\0')) {
    iVar3 = FUN_0047d980(&DAT_00553e3c,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x268,0,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a500 = '\x01';
    }
  }
  if ((param_2 == (char *)0x0) && (DAT_0124a4ff == '\0')) {
    iVar3 = FUN_0047d980(&DAT_00553e38,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x269,0,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a4ff = '\x01';
    }
  }
  param_1 = param_1 - (int)param_2;
  iVar3 = 0x7fffffff;
  while( true ) {
    cVar1 = param_2[param_1];
    cVar2 = *param_2;
    param_2 = param_2 + 1;
    if (iVar3 == 0) {
      return 0;
    }
    if (cVar1 != cVar2) break;
    iVar3 = iVar3 + -1;
    if (cVar1 == '\0') {
      return 0;
    }
  }
  return (uint)(cVar2 <= cVar1) * 2 + -1;
}

