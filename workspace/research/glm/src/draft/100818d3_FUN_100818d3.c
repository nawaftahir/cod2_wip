extern int FUN_1007fae3();
extern int FUN_100811b0();


int FUN_100818d3(unsigned int param_1,unsigned int param_2,int param_3,unsigned int param_4,
                unsigned int param_5)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  
  if (param_3 < 0) {
    iVar3 = -param_3;
  }
  else {
    iVar2 = FUN_100811b0(param_3,&param_3);
    iVar3 = param_3;
    if (iVar2 < 0) {
      return iVar2;
    }
  }
  do {
    iVar2 = FUN_1007fae3(iVar3,param_2,param_4,param_5,0);
    if (iVar2 < 0) {
      return iVar2;
    }
    piVar1 = (int *)(iVar3 + 0x24);
    iVar3 = *piVar1;
  } while (*piVar1 != 0);
  return 0;
}


