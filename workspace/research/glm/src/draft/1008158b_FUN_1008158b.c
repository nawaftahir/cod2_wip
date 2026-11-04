extern int FUN_1007e699();
extern int FUN_100811b0();


int FUN_1008158b(unsigned int param_1,unsigned int param_2,int param_3,unsigned int param_4,unsigned int param_5)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  
  if (param_3 < 0) {
    iVar3 = -param_3;
  }
  else {
    iVar1 = FUN_100811b0(param_3,&param_3);
    iVar3 = param_3;
    if (iVar1 < 0) {
      return iVar1;
    }
  }
  uVar2 = param_5 >> 2;
  do {
    iVar1 = FUN_1007e699(iVar3,param_2,param_4,uVar2,0);
    if (iVar1 < 0) {
      return iVar1;
    }
    iVar3 = *(int *)(iVar3 + 0x24);
  } while (iVar3 != 0);
  return 0;
}


