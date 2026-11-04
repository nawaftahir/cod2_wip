extern unsigned int DAT_101a4020;


unsigned int FUN_100a7ec8(int param_1,int *param_2,unsigned int param_3)

{
  unsigned char bVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  unsigned int local_8;
  
  local_8 = 0;
  if (param_3 != 0) {
    piVar3 = &DAT_101a4020;
    do {
      bVar1 = true;
      iVar4 = 4;
      piVar2 = param_2;
      do {
        if ((*(int *)((param_1 - (int)param_2) + (int)piVar2) != *piVar3) && (*piVar2 != -1)) {
          bVar1 = false;
        }
        piVar3 = piVar3 + 1;
        piVar2 = piVar2 + 1;
        iVar4 = iVar4 + -1;
      } while (iVar4 != 0);
      if (bVar1) {
        return 1;
      }
      local_8 = local_8 + 1;
    } while (local_8 < param_3);
  }
  return 0;
}


