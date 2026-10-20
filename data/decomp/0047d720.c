
int FUN_0047d720(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  char local_5;
  
  FUN_0047d4b0();
  iVar3 = 0;
  local_5 = '\0';
  iVar2 = param_1;
  if (0 < param_2 + param_3) {
    do {
      if (param_3 <= iVar3) {
        iVar1 = FUN_0047d510(iVar2,&local_5);
        iVar2 = iVar2 + iVar1;
        if (local_5 != '\0') break;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < param_2 + param_3);
  }
  return iVar2 - param_1;
}

